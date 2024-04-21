import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'totp.dart';

class AudioSoAuth extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('AudioPlayer'),
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: () {
              String totpResult = TOTPGenerator.generateTOTP("2MQA54AHI2QPDSRDVJXPROXSZWSNWGK6");
              playSound(totpResult);
            },
            child: Text("Play Sound"),
          ),
        ),
      ),
    );
  }
  final player = AudioPlayer();

  AudioPlayer audioPlayer = AudioPlayer();
  Future<void> playSound(String numberString) async {

    for(int i=0;i<numberString.length;i++){
      String digit = numberString[i];
      String soundPath = "$digit.wav";
      await player.play(AssetSource(soundPath));
    }
    // String soundPath = "iphone.mp3"; //You don't need to include assets/ because AssetSource assume that you have sound in your assets folder.
    // await player.play(AssetSource(soundPath));
  }
}