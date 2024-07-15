import 'dart:math';

import 'package:flutter/material.dart';
// import 'package:tojitomo_counter/components/ability_score_row.dart';
import 'package:tojitomo_counter/components/charater_sheet.dart';
import 'package:tojitomo_counter/components/turn_bar.dart';
import 'package:tojitomo_counter/models/character.dart';

// ignore: must_be_immutable
class CharacterSheetScreen extends StatelessWidget {
  CharacterSheetScreen({
    super.key,
    required this.character1,
    required this.character2,
  }) {
    player1Key = const GlobalObjectKey('p1');
    player2Key = const GlobalObjectKey('p2');
  }
  Character character1;
  Character character2;

  GlobalObjectKey<CharacterSheetState>? player1Key;
  GlobalObjectKey<CharacterSheetState>? player2Key;

  void newTurn() {
    player1Key!.currentState!.resetScore();
    player2Key!.currentState!.resetScore();
  }

  @override
  Widget build(BuildContext context) {
    // レイアウト
    // CharacterSheet2 H=360
    // TurnBar H=50
    // CharacterSheet1 H=360
    const double turnbarHeight = 50.0;
    const double characterSheetHeight = 360.0;
    double scaledCharacterSheetHeight = characterSheetHeight;
    double assumedHeight = turnbarHeight + characterSheetHeight * 2;
    final displayHeight = MediaQuery.sizeOf(context).height;
    if (displayHeight < assumedHeight) {
      scaledCharacterSheetHeight = (displayHeight - turnbarHeight) / 2;
    }

    return MaterialApp(
      title: '刀使盤カウンター',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Column(
        children: [
          Expanded(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 0.0),
              child: Transform.scale(
                scale: scaledCharacterSheetHeight / characterSheetHeight,
                child: Transform.rotate(
                  angle: pi,
                  child: CharacterSheet(
                    key: player2Key,
                    character: character2,
                    playerNumber: 2,
                  ),
                ),
              ),
            ),
          ),
          TurnBar(
            newTurnCallback: newTurn,
            gameEndCallback: () {
              Navigator.of(context).pop(false);
            },
          ),
          Expanded(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 0.0),
              child: Transform.scale(
                scale: scaledCharacterSheetHeight / characterSheetHeight,
                child: Transform.rotate(
                  angle: 0,
                  child: CharacterSheet(
                    key: player1Key,
                    character: character1,
                    playerNumber: 1,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
