import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final looserplayer = AudioPlayer();
  final player = AudioPlayer();
  final winnerplayer = AudioPlayer();
  var mytextstyle = const TextStyle(fontSize: 35, color: Colors.white);
  List<String> displayxo = ['', '', '', '', '', '', '', '', ''];
  bool oturn = false;
  int xscore = 0;
  int oscore = 0;
  void ontapped(int index, BuildContext context) {
    setState(() {
      if (oturn == false && displayxo[index] == '') {
        displayxo[index] = 'x';
      } else if (oturn == true && displayxo[index] == '') {
        displayxo[index] = 'o';
      }
      oturn = !oturn;
      findthewinner(context);
    });
  }

  findthewinner(BuildContext context) {
    if (displayxo[0] == displayxo[1] &&
        displayxo[0] == displayxo[2] &&
        displayxo[0] != '') {
      winner(context, displayxo[0]);
    } else if (displayxo[3] == displayxo[4] &&
        displayxo[3] == displayxo[5] &&
        displayxo[3] != '') {
      winner(context, displayxo[3]);
    } else if (displayxo[6] == displayxo[7] &&
        displayxo[6] == displayxo[8] &&
        displayxo[6] != '') {
      winner(context, displayxo[6]);
    } else if (displayxo[0] == displayxo[3] &&
        displayxo[0] == displayxo[6] &&
        displayxo[0] != '') {
      winner(context, displayxo[0]);
    } else if (displayxo[1] == displayxo[4] &&
        displayxo[1] == displayxo[7] &&
        displayxo[1] != '') {
      winner(context, displayxo[1]);
    } else if (displayxo[2] == displayxo[8] &&
        displayxo[2] == displayxo[5] &&
        displayxo[2] != '') {
      winner(context, displayxo[2]);
    } else if (displayxo[0] == displayxo[4] &&
        displayxo[0] == displayxo[8] &&
        displayxo[0] != '') {
      winner(context, displayxo[0]);
    } else if (displayxo[6] == displayxo[4] &&
        displayxo[6] == displayxo[2] &&
        displayxo[6] != '') {
      winner(context, displayxo[6]);
    } else if ((displayxo[0] == 'x' || displayxo[0] == 'o') &&
        (displayxo[1] == 'x' || displayxo[1] == 'o') &&
        (displayxo[2] == 'x' || displayxo[2] == 'o') &&
        (displayxo[3] == 'x' || displayxo[3] == 'o') &&
        (displayxo[4] == 'x' || displayxo[4] == 'o') &&
        (displayxo[5] == 'x' || displayxo[5] == 'o') &&
        (displayxo[6] == 'x' || displayxo[6] == 'o') &&
        (displayxo[7] == 'x' || displayxo[7] == 'o') &&
        (displayxo[8] == 'x' || displayxo[8] == 'o')) {
      draw(context);
      looserplayer.play(AssetSource('losingsound.mp3'));
    } else {
      player.play(AssetSource("sound.mp3"));
    }
  }

  winner(BuildContext context, String winner) {
    winnerplayer.play(AssetSource("winnermusic.mp3"));
    if (winner == 'x') {
      xscore = xscore + 1;
    } else {
      oscore = oscore + 1;
    }
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: Colors.black54,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            title: Text(
              'winner is  $winner',
              style: const TextStyle(color: Colors.white),
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    SystemNavigator.pop();
                  },
                  child: const Text("Exit",
                      style: TextStyle(color: Color.fromARGB(255, 250, 5, 5)))),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  oturn = !oturn;
                  setState(() {
                    for (int i = 0; i < 9; i++) {
                      displayxo[i] = '';
                    }
                  });
                },
                child: const Text(
                  "Rematch",
                  style: TextStyle(color: Color.fromARGB(255, 249, 104, 8)),
                ),
              )
            ],
          );
        });
  }

  draw(BuildContext context) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: Colors.black54,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            title: const Text(
              'Draw',
              style: TextStyle(color: Colors.white),
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    SystemNavigator.pop();
                  },
                  child: const Text("Exit",
                      style: TextStyle(color: Color.fromARGB(255, 250, 5, 5)))),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  oturn = !oturn;
                  setState(() {
                    for (int i = 0; i < 9; i++) {
                      displayxo[i] = '';
                    }
                  });
                },
                child: const Text(
                  "Rematch",
                  style: TextStyle(color: Color.fromARGB(255, 249, 104, 8)),
                ),
              )
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: Column(
        children: [
          Expanded(
              child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 60, 20, 20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Text(
                      "Player x",
                      style: mytextstyle,
                    ),
                    Text(
                      xscore.toString(),
                      style: mytextstyle,
                    )
                  ],
                ),
                const SizedBox(
                  width: 20,
                ),
                Column(
                  children: [
                    Text(
                      'Player o',
                      style: mytextstyle,
                    ),
                    Text(
                      oscore.toString(),
                      style: mytextstyle,
                    )
                  ],
                )
              ],
            ),
          )),
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: GridView.builder(
                  itemCount: 9,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3),
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                        onTap: () {
                          ontapped(index, context);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey)),
                          child: Center(
                            child: Text(
                              displayxo[index].toString(),
                              style: const TextStyle(
                                  fontSize: 30, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ));
                  }),
            ),
          ),
          Expanded(child: Container())
        ],
      ),
    );
  }
}
