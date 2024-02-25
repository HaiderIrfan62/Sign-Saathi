import 'dart:async';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:sign_saathi_app/config/strings.dart';
import 'package:sign_saathi_app/utils/Button.dart';
import 'package:tflite_v2/tflite_v2.dart';
import '../API/ApiFuncs.dart';
import '../config/config.dart';
import '../main.dart';
import '../utils/NavBar.dart';
import '../utils/sidebarNprofile.dart';

class GestureRecognitionPage extends StatefulWidget {
  const GestureRecognitionPage({Key? key}) : super(key: key);

  @override
  State<GestureRecognitionPage> createState() => _GestureRecognitionPageState();
}

class _GestureRecognitionPageState extends State<GestureRecognitionPage> with WidgetsBindingObserver {
  CameraImage? cameraImage;
  CameraController? cameraController;
  String output = " ";

  Timer? _timer;

  @override
  void initState(){
    super.initState();
    WidgetsBinding.instance?.addObserver(this); // Use the null-aware operator '?'
    if(cameraOn) {
      loadCamera();
      loadmodel();
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance?.removeObserver(this); // Use the null-aware operator '?'
    cameraController?.dispose();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      loadCamera();
    } else if (state == AppLifecycleState.paused) {
      cameraController?.stopImageStream();
      cameraController?.dispose();
    }
  }

  loadCamera(){
    cameraController = CameraController(cameras![1], ResolutionPreset.medium);
    cameraController!.initialize().then((value){
      if(!mounted){
        return;
      }
      else{
        setState(() {
          cameraController!.startImageStream((imageStream){
            cameraImage = imageStream;
            runModel();
          });
        });
      }
    });
  }

  loadAPI(){
    setState(() {
      runAPI();
    });
  }

  Future<void> runAPI() async {
    try {
      String url = configURL + "model";
      print(url);
      output = await getterAPI(url).toString();
      print(output);
    } catch (e) {
      print('Error: $e');
    }
  }

  runModel()async{
    if(cameraImage != null){
      var predictions = await Tflite.runModelOnFrame(bytesList: cameraImage!.planes.map((plane){
        return plane.bytes;
      }).toList(),
        imageHeight: cameraImage!.height,
        imageWidth: cameraImage!.width,
        imageMean: 127.5,
        imageStd: 127.5,
        rotation: 90,
        numResults: 2,
        threshold: 0.1,
        asynch: true,
      );
      predictions!.forEach((element) {
        setState(() {
          output = element['label'];
        });
      });
    }
  }

  loadmodel() async {
    await Tflite.loadModel(
      model: "lib/model/model_unquant.tflite",
      labels: "lib/model/labels.txt"
    );
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SideBarNProfile(screenSize: screenSize, imagePath: 'lib/assets/avatar1.png'),
            Container(
              padding: EdgeInsets.symmetric(vertical: screenSize.height * 0.015, horizontal: screenSize.width * 0.015),
              height: screenSize.height * 0.7,
              width: screenSize.width * 0.8,
              decoration: BoxDecoration(
                color: Color(0xFF263238), // The color property must be moved inside the BoxDecoration
                borderRadius: BorderRadius.circular(30.0), // This will make the corners rounder
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(padding: EdgeInsets.all(20),
                    child: Container(
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(30.0)),
                      height: MediaQuery.of(context).size.height * 0.4,
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: !cameraController!.value.isInitialized?
                      Container():
                      AspectRatio(aspectRatio: cameraController!.value.aspectRatio,
                        child: CameraPreview(cameraController!),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Text(GestureRecognitionWordHeading, style: TextStyle(color: Colors.white, fontSize: 32, fontWeight: FontWeight.w900),),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20.0),
                    child: Text(output[output.length-1], style: TextStyle(color: Colors.white, fontSize: 40 , fontWeight: FontWeight.w900)),
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.only(bottom: 40.0),
                  //   child: Button(color: Color(0xFF357C93), text: GestureRecognitionStartBtn),
                  // ),
                ],
              ),
            ),
            //SizedBox(height: screenSize.height * 0.010),
            NavBar(screenSize: screenSize, pageName: PageNameGestureRecognition),
            SizedBox(height: screenSize.height * 0.01),
          ],
        ),
      ),
    );
  }
}
