import 'package:flutter/material.dart';
import 'home_page.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(const Base());
}

class Base extends StatelessWidget {
  const Base({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: OpeningScreen(),
    );
  }
}

class OpeningScreen extends StatefulWidget {
  const OpeningScreen({super.key});

  @override
  State<OpeningScreen> createState() => _OpeningScreenState();
}

class _OpeningScreenState extends State<OpeningScreen> {
  final winnerplayer = AudioPlayer();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[900],
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 60,
            ),
            Container(
              padding: const EdgeInsets.all(20),
              width: double.infinity,
              child: const Center(
                child: Text(
                  "TIC TAC TOE",
                  style: TextStyle(color: Colors.white, fontSize: 40),
                ),
              ),
            ),
            const Padding(padding: EdgeInsets.only(bottom: 10)),
            const Image(image: AssetImage("assets/My project-1.png")),
            const Padding(padding: EdgeInsets.all(70)),
            GestureDetector(
              onTap: () {
                winnerplayer.play(AssetSource("winnermusic.mp3"));
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => const HomePage()));
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                height: 40,
                width: 200,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    gradient: const LinearGradient(
                        colors: [Colors.black, Colors.white])),
                child: const Center(
                  child: Text(
                    "START GAME !!",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            )
          ],
        ));
  }
}
