import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() => runApp(const XylophoneApp());

class XylophoneApp extends StatelessWidget {
  const XylophoneApp({super.key});

  Future<void> playSound(int noteNumber) async {
    final player = AudioPlayer();
    await player.play(AssetSource('audio/note$noteNumber.wav'));
  }

  Widget buildKey(int soundNumber,Color color){
    return Expanded(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(0.0)
            ),
            backgroundColor: color
        ),
        onPressed: () async {
          playSound(soundNumber);
        },
        child: null,
      ),
    );
  }


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
              'Xylophone',
            style: TextStyle(
              fontFamily: 'Merienda',
              fontSize: 30.0,

            ),
          ),
        ),
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              buildKey(1, Colors.red),
              buildKey(2, Colors.orange),
              buildKey(3, Colors.yellow),
              buildKey(4, Colors.green),
              buildKey(5, Colors.teal),
              buildKey(6, Colors.blue),
              buildKey(7, Colors.purple),
            ],
          ),
        ),
      ),
    );
  }
}
