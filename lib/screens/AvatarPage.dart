import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sign_saathi_app/config/config.dart';
import 'package:sign_saathi_app/config/strings.dart';
import 'package:sign_saathi_app/utils/NavBar.dart';
import 'package:sign_saathi_app/utils/sidebarNprofile.dart';
import 'package:video_player/video_player.dart';
import 'package:http/http.dart' as http;
import 'dart:typed_data';


import 'LessonPage.dart';

class AvatarPage extends StatefulWidget {
  const AvatarPage({Key? key}) : super(key: key);

  @override
  State<AvatarPage> createState() => _AvatarPageState();
}

class _AvatarPageState extends State<AvatarPage> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;
  late TextEditingController txtController;
  final imagePicker = ImagePicker();
  File? image;
  bool showSpinner = false ;

  @override
  void initState() {
    // Initialize with an empty URL
    _controller = VideoPlayerController.network("https://signsaathi.azurewebsites.net/video/");
    _initializeVideoPlayerFuture = _controller.initialize();
    // _controller.setLooping(true);
    // _controller.setVolume(0);
    txtController = TextEditingController();
    super.initState();
    //_loadVideo();
  }

  Future<void> _loadVideo() async {
    final response =
    await http.get(Uri.parse('https://signsaathi.azurewebsites.net/video'));
    print("Hello World");

    print(response.statusCode);

    if (response.statusCode == 200) {
      // Convert the response body to Uint8List
      Uint8List bytes = response.bodyBytes;

      // Create an in-memory buffer to load the video
      final buffer = Uint8List.fromList(bytes).buffer;

      // Dispose of the old controller before creating a new one
      _controller.dispose();

      // Set the data source for the new VideoPlayerController
      _controller = VideoPlayerController.file(
        File.fromRawPath(buffer.asUint8List()),
      );

      // Initialize the new controller
      setState(() {
        _initializeVideoPlayerFuture = _controller.initialize();
      });
    } else {
      // Handle error
      print("Failed to load video: ${response.statusCode}");
      print("Response body: ${response.body}");
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[

                SideBarNProfile(screenSize: screenSize, imagePath: 'lib/assets/avatar1.png'),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Image.asset(
                    //   'lib/assets/character.png',
                    //   height: screenSize.height * 0.5,
                    // ),
                    FutureBuilder(future: _initializeVideoPlayerFuture, builder: (context, snapshot){
                      if(snapshot.connectionState == ConnectionState.done){
                        return AspectRatio(
                          aspectRatio: _controller.value.aspectRatio, //16/9,//_controller.value.aspectRatio,
                          child: VideoPlayer(_controller),
                        );
                      }
                      else{
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    }),
                    SizedBox(height: screenSize.height * 0.03), //0.06
                    Container(
                      width: screenSize.width * 0.95,
                      height: screenSize.height * 0.08,
                      padding: EdgeInsets.symmetric(
                        horizontal: screenSize.width * 0.01,
                      ),
                      decoration: BoxDecoration(
                        color: Color(0xFF176B87),
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      child: Center(
                        child: TextField(
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.grey[200],
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0),
                              borderSide: BorderSide.none,
                            ),
                            suffixIcon: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                  onPressed: () {
                                    _openCamera();
                                  },
                                  icon: Icon(
                                    Icons.camera_alt,
                                    color: Color(0xFF176B87),
                                  ),
                                ),
                                SizedBox(width: 4.0), // Adjust spacing between icons
                                IconButton(
                                    onPressed: () {
                                      FocusScope.of(context).unfocus();
                                      setState(() {
                                        txtController.clear();
                                        _controller.value.isPlaying
                                            ? _controller.pause()
                                            : _controller.play();
                                      });
                                    },
                                    icon: Icon(
                                      Icons.send,
                                      color: Color(0xFF176B87),
                                    )),
                              ],
                            ),
                            hintText: AvatarPageSearch,
                            hintStyle: TextStyle(
                                color: Color(0xFF357C93),
                                fontWeight: FontWeight.w900),
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: screenSize.width * 0.05),
                          ),
                          controller: txtController,
                        ),
                      ),
                    ),

                  ],
                ),
                SizedBox(height: screenSize.height * 0.01), //0.30
                NavBar(screenSize: screenSize, pageName: PageNameAvatar),
                SizedBox(height: screenSize.height * 0.01),
              ]),

        ),
      ),
    );
  }
  Future<void> _openCamera() async {
    final pickedFile = await imagePicker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      image = File(pickedFile.path);
      print("Image path: ${pickedFile.path}");

      // Add your logic to send the image to the API
    } else {
      print("User canceled the camera operation");
    }
  }

  Future<void> uploadImage ()async{

    setState(() {
      showSpinner = true ;
    });

    var stream  = new http.ByteStream(image!.openRead());
    stream.cast();

    var length = await image!.length();

    var uri = Uri.parse('https://fakestoreapi.com/products');

    var request = new http.MultipartRequest('POST', uri);

    request.fields['title'] = "Static title" ;

    var multiport = new http.MultipartFile(
        'image',
        stream,
        length);

    request.files.add(multiport);

    var response = await request.send() ;

    print(response.stream.toString());
    if(response.statusCode == 200){
      setState(() {
        showSpinner = false ;
      });
      print('image uploaded');
    }else {
      print('failed');
      setState(() {
        showSpinner = false ;
      });

    }

  }

}
