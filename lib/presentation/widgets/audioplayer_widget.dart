import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:just_audio/just_audio.dart';

import '../../main.dart';

Duration _position = Duration(seconds: 0);
var _progress = 0.0;

class AudioPlayers extends StatefulWidget {
  const AudioPlayers({Key? key}) : super(key: key);

  @override
  State<AudioPlayers> createState() => _AudioPlayersState();
}

class _AudioPlayersState extends State<AudioPlayers> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
  //  log(size.width.toString());
    return Container(
      padding: EdgeInsets.all(8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          IconButton(
              onPressed: () {
                player!.setAsset('assets/music/valorant.mp3').then((value) {
                  return {
                    _position = value!,
                    player!.playerStateStream.listen((state) {
                      if (state.playing) {
                        setState(() {
                          _progress = .1;
                        });
                      } else
                        switch (state.processingState) {
                          case ProcessingState.idle:
                            break;
                          case ProcessingState.loading:
                            break;
                          case ProcessingState.buffering:
                            break;
                          case ProcessingState.ready:
                            setState(() {
                              _progress = 0;
                              //  timer2!.cancel();
                            });
                            break;
                          case ProcessingState.completed:
                            setState(() {
                              _progress = 0;
                            });
                            break;
                        }
                    }),
                    player!.play(),
                  };
                });
              },
              icon: Icon(
                _progress > 0 ? Icons.pause : Icons.play_circle_fill,
                size: 35,color: Colors.purple,
              )),
          _progress > 0
              ? SpinKitWave(
            color: Colors.orange.shade800,
            size: 50,
          )
              : Icon(Icons.music_off_sharp,size: 40,color: Colors.red.shade900,),
          IconButton(
              onPressed: () {
                setState(() {
                  player!.stop();
                });
              },
              icon: Icon(
                Icons.stop,
                size: 40,
                color: Colors.purple,
              )),

        ],
      ),
    );
  }
}
