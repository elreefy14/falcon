import 'dart:async';
import 'dart:math';

import 'package:falcon/core/core_exports.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';






class VideoPlayerScreen extends StatefulWidget {
  VideoPlayerScreen({required this.link });
  String link;
  @override
  _VideoPlayerScreenState createState() => _VideoPlayerScreenState();

}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late YoutubePlayerController _controller;

  late Timer _timer;
  Offset _currentPosition = Offset(0, 0);

  // Define possible positions for the watermark
  List<Offset> _getWatermarkPositions() {
    final screenSize = MediaQuery.of(context).size;
    return [
      Offset(0, screenSize.height/2),
      Offset(0, screenSize.height/2 -(screenSize.height/2)*0.05),
      Offset(0, screenSize.height/2 -(screenSize.height/2)*0.1),
      Offset(0, screenSize.height/2 -(screenSize.height/2)*0.15),
      Offset(0, screenSize.height/2 -(screenSize.height/2)*0.2),
      Offset(0, screenSize.height/2 -(screenSize.height/2)*0.25),
      Offset(0, screenSize.height/2 +(screenSize.height/2)*0.05),
      Offset(0, screenSize.height/2 +(screenSize.height/2)*0.1),
      Offset(0, screenSize.height/2 +(screenSize.height/2)*0.125),

      Offset(screenSize.width*0.5, screenSize.height/2 -(screenSize.height/2)*0.05),
      Offset(screenSize.width*0.5, screenSize.height/2 -(screenSize.height/2)*0.1),
      Offset(screenSize.width*0.5, screenSize.height/2 -(screenSize.height/2)*0.15),
      Offset(screenSize.width*0.5, screenSize.height/2 -(screenSize.height/2)*0.2),
      Offset(screenSize.width*0.5, screenSize.height/2 -(screenSize.height/2)*0.25),
      Offset(screenSize.width*0.5, screenSize.height/2 +(screenSize.height/2)*0.05),
      Offset(screenSize.width*0.5, screenSize.height/2 +(screenSize.height/2)*0.1),
      Offset(screenSize.width*0.5, screenSize.height/2 +(screenSize.height/2)*0.125),


      // Offset(screenSize.width*0.65, screenSize.height/2 -(screenSize.height/2)*0.05),
      // Offset(screenSize.width*0.65, screenSize.height/2 -(screenSize.height/2)*0.1),
      // Offset(screenSize.width*0.65, screenSize.height/2 -(screenSize.height/2)*0.15),
      // Offset(screenSize.width*0.65, screenSize.height/2 -(screenSize.height/2)*0.2),
      // Offset(screenSize.width*0.65, screenSize.height/2 -(screenSize.height/2)*0.25),
      // Offset(screenSize.width*0.65, screenSize.height/2 +(screenSize.height/2)*0.05),
      // Offset(screenSize.width*0.65, screenSize.height/2 +(screenSize.height/2)*0.1),
      // Offset(screenSize.width*0.65, screenSize.height/2 +(screenSize.height/2)*0.125),

    ];
  }
  List<Offset> _getWatermarkPositionsAllScreen() {
    final screenSize = MediaQuery.of(context).size;
    return [
      Offset(0, screenSize.height/2),
      Offset(0, screenSize.height/2 -(screenSize.height/2)*0.05),
      Offset(0, screenSize.height/2 -(screenSize.height/2)*0.1),
      Offset(0, screenSize.height/2 -(screenSize.height/2)*0.15),
      Offset(0, screenSize.height/2 -(screenSize.height/2)*0.2),
      Offset(0, screenSize.height/2 -(screenSize.height/2)*0.25),
      Offset(0, screenSize.height/2 +(screenSize.height/2)*0.05),
      Offset(0, screenSize.height/2 +(screenSize.height/2)*0.1),
      Offset(0, screenSize.height/2 +(screenSize.height/2)*0.125),

      Offset(screenSize.width-(screenSize.width)*0.5, screenSize.height/2 -(screenSize.height/2)*0.05),
      Offset(screenSize.width-(screenSize.width)*0.5, screenSize.height/2 -(screenSize.height/2)*0.1),
      Offset(screenSize.width-(screenSize.width)*0.5, screenSize.height/2 -(screenSize.height/2)*0.15),
      Offset(screenSize.width-(screenSize.width)*0.5, screenSize.height/2 -(screenSize.height/2)*0.2),
      Offset(screenSize.width-(screenSize.width)*0.5, screenSize.height/2 -(screenSize.height/2)*0.25),
      Offset(screenSize.width-(screenSize.width)*0.5, screenSize.height/2 +(screenSize.height/2)*0.05),
      Offset(screenSize.width-(screenSize.width)*0.5, screenSize.height/2 +(screenSize.height/2)*0.1),
      Offset(screenSize.width-(screenSize.width)*0.5, screenSize.height/2 +(screenSize.height/2)*0.125),


      Offset(screenSize.width/2-(screenSize.width)*0.2, screenSize.height/2 -(screenSize.height/2)*0.05),
      Offset(screenSize.width/2-(screenSize.width)*0.2, screenSize.height/2 -(screenSize.height/2)*0.1),
      Offset(screenSize.width/2-(screenSize.width)*0.2, screenSize.height/2 -(screenSize.height/2)*0.15),
      Offset(screenSize.width/2-(screenSize.width)*0.2, screenSize.height/2 -(screenSize.height/2)*0.2),
      Offset(screenSize.width/2-(screenSize.width)*0.2, screenSize.height/2 -(screenSize.height/2)*0.25),
      Offset(screenSize.width/2-(screenSize.width)*0.2, screenSize.height/2 +(screenSize.height/2)*0.05),
      Offset(screenSize.width/2-(screenSize.width)*0.2, screenSize.height/2 +(screenSize.height/2)*0.1),
      Offset(screenSize.width/2-(screenSize.width)*0.2, screenSize.height/2 +(screenSize.height/2)*0.125),

      //---------------------------------------------------------------------------------------------------
      Offset(0, screenSize.height),
      Offset(0, screenSize.height -(screenSize.height)*0.2),
      Offset(0, screenSize.height -(screenSize.height)*0.25),

      Offset((screenSize.width)*0.5, screenSize.height -(screenSize.height)*0.2),
      Offset((screenSize.width)*0.5, screenSize.height -(screenSize.height)*0.25),

      Offset(screenSize.width/2-(screenSize.width)*0.2, screenSize.height -(screenSize.height)*0.2),
      Offset(screenSize.width/2-(screenSize.width)*0.2, screenSize.height -(screenSize.height)*0.25),


      //-------

      Offset(0, 0),
      Offset(0, 0 +(screenSize.height)*0.2),
      Offset(0, 0 +(screenSize.height)*0.25),

      Offset(screenSize.width-(screenSize.width)*0.5, 0 +(screenSize.height)*0.2),
      Offset(screenSize.width-(screenSize.width)*0.5, 0 +(screenSize.height)*0.25),


      Offset(screenSize.width/2-(screenSize.width)*0.2, 0 +(screenSize.height)*0.2),
      Offset(screenSize.width/2-(screenSize.width)*0.2, 0 +(screenSize.height)*0.25),

      Offset((screenSize.width)*0.72, screenSize.height -(screenSize.height)*0.1),
      Offset((screenSize.width)*0.72, screenSize.height -(screenSize.height)*0.15),
      Offset((screenSize.width)*0.72, screenSize.height -(screenSize.height)*0.2),
      Offset((screenSize.width)*0.72, screenSize.height -(screenSize.height)*0.3),
      Offset((screenSize.width)*0.72, screenSize.height -(screenSize.height)*0.4),
      Offset((screenSize.width)*0.72, screenSize.height -(screenSize.height)*0.5),
      Offset((screenSize.width)*0.72, screenSize.height -(screenSize.height)*0.6),
      Offset((screenSize.width)*0.72, screenSize.height -(screenSize.height)*0.7),
      Offset((screenSize.width)*0.72, screenSize.height -(screenSize.height)*0.2),
      Offset((screenSize.width)*0.72, screenSize.height -(screenSize.height)*0.3),
      Offset((screenSize.width)*0.72, screenSize.height -(screenSize.height)*0.5),
      Offset((screenSize.width)*0.72, screenSize.height -(screenSize.height)*0.7),


    ];
  }

  String extractYoutubeId(String url) {
    final RegExp regExp = RegExp(
      r'(?:https?:\/\/)?(?:www\.)?(?:youtube\.com\/(?:[^\/\n\s]+\/\S+\/|(?:v|e(?:mbed)?)\/|\S*?[?&]v=)|youtu\.be\/)([a-zA-Z0-9_-]{11})',
      caseSensitive: false,
      multiLine: false,
    );

    final match = regExp.firstMatch(url);
    if (match != null && match.groupCount >= 1) {
      return match.group(1)!; // Return the matched video ID
    } else {
      throw 'Invalid YouTube URL';
    }
  }


  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: extractYoutubeId(widget.link), // YouTube video ID
      flags: YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
      ),
    );

    // Start the timer to update watermark position every second
    _startWatermarkAnimation();
  }

  // Method to update watermark position
  void _startWatermarkAnimation() {
    _timer = Timer.periodic(Duration(seconds: 10), (timer) {
      setState(() {
        if(MediaQuery.of(context).size.height>MediaQuery.of(context).size.width){
          _currentPosition = _getWatermarkPositions()[Random().nextInt(_getWatermarkPositions().length)];
        }else{
          _currentPosition = _getWatermarkPositionsAllScreen()[Random().nextInt(_getWatermarkPositionsAllScreen().length)];
        }

      });
    });
  }

  void listener() {
    // Add logic to handle events from the player
  }

@override
void dispose() {
  _controller.dispose();
  _timer.cancel(); // Cancel the timer to avoid memory leaks
  super.dispose();
}

  bool _flipVertical () {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

   return true;
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
        canPop: false,
        onPopInvoked: (didPop) async {
          if (didPop) {
            return;
          }
          final navigator = Navigator.of(context);
          bool value = await _flipVertical();
          if (value) {
            navigator.pop();
          }
        },
      child: SafeArea(
        child: Scaffold(
          body: Container(
            height: AppConstants.hScreen(context),
            width: AppConstants.wScreen(context),
            color: ColorManager.black,
            child: Stack(
              children: [
                Center(
                  child: Flexible(
                    child: YoutubePlayer(
                      controller: _controller,
                      showVideoProgressIndicator: true,
                      progressIndicatorColor: Colors.amber,
                      progressColors: ProgressBarColors(
                        playedColor: Colors.amber,
                        handleColor: Colors.amberAccent,
                      ),
                      onReady: () {
                        _controller.addListener(listener);
                      },
                    ),
                  ),
                ),
                // Replace Align with AnimatedAlign
                Positioned(
                  left: _currentPosition.dx,
                  top: _currentPosition.dy,
                  child: Container(
                    margin: EdgeInsets.all(10.0),
                    padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                    decoration: BoxDecoration(
                      color: Colors.black45,
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: Text(context.read<CurrentUserBloc>().userData!.name+" "+context.read<CurrentUserBloc>().userData!.id ,
                     // encryptText(context.read<CurrentUserBloc>().userData!.id,ApiConstants.encryptionKey),
                      style: getBoldStyle(
                        color: Colors.white38,
                        fontSize: FontSize.s12
                      ),
                    ),
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}

