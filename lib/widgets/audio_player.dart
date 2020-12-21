import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class AssetAudioPlayer extends StatefulWidget {
  AssetAudioPlayer({Key key, this.audiosrc}) : super(key: key);
  final String audiosrc;

  @override
  _AssetAudioPlayerState createState() => _AssetAudioPlayerState();
}

class _AssetAudioPlayerState extends State<AssetAudioPlayer> {
  bool isPlaying = false;
  bool isPaused = true;
  AudioPlayer audioPlayer = AudioPlayer();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        IconButton(
          icon: Icon(isPlaying ? Icons.pause : Icons.play_arrow),
          onPressed: () async {
            if (isPlaying) {
              audioPlayer.pause();
              setState(() {
                isPaused = true;
                isPlaying = false;
              });
            } else {
              audioPlayer.play(widget.audiosrc, isLocal: true).then((value) {
                print("status");
                setState(() {
                  isPlaying = true;
                });
              });
            }
          },
        ),
      ],
    );
  }
}
