import 'dart:html';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:tojitomo_counter/components/character_select_box.dart';
import 'package:tojitomo_counter/components/charater_info.dart';
import 'package:tojitomo_counter/models/character.dart';
import 'package:tojitomo_counter/models/character_list.dart';
import 'package:tojitomo_counter/screens/character_sheet_screen.dart';

class CharacterSelectScreen extends StatefulWidget {
  CharacterSelectScreen({
    super.key,
  });

  final Map<int, GlobalObjectKey<CharacterInfoState>> objectKeyMap = {
    1: const GlobalObjectKey('p1info'),
    2: const GlobalObjectKey('p2info')
  };

  final List<Character> characterList = CharacterList().characterList;

  @override
  State<CharacterSelectScreen> createState() => _CharacterSelectScreenState();
}

class _CharacterSelectScreenState extends State<CharacterSelectScreen> {
  bool rebuild = false;

  void changeCharacter(int playerNumber, Character character) {
    widget.objectKeyMap[playerNumber]!.currentState!.changeCharacter(character);
  }

  @override
  Widget build(BuildContext context) {
    Character character1 = widget.characterList[0];
    Character character2 = widget.characterList[1];

    // レイアウト
    // CharacterInfo2 H=250
    // CharacterSelectBox2 H=50
    // padding H=10
    // GameStartButton H=50
    // padding H=10
    // CharacterSelectBox1 H=50
    // CharacterInfo1 H=250
    const double gameStartButtonHeight = 70.0;
    const double characterSelectBoxHeight = 60.0;
    const double characterInfoHeight = 250.0;
    double scaledCharacterSelectboxAndInfoHeight = characterInfoHeight;
    double assumedHeight = gameStartButtonHeight +
        characterSelectBoxHeight * 2 +
        characterInfoHeight * 2;
    final displayHeight = MediaQuery.sizeOf(context).height;
    if (displayHeight < assumedHeight) {
      scaledCharacterSelectboxAndInfoHeight = (displayHeight -
              gameStartButtonHeight -
              characterSelectBoxHeight * 2) /
          2;
    }

    // List<Character> clist = [character1, character2];
    List<Character> characterList = widget.characterList;
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 0.0),
            child: SizedBox(
              height: scaledCharacterSelectboxAndInfoHeight,
              child: Transform.scale(
                scale:
                    scaledCharacterSelectboxAndInfoHeight / characterInfoHeight,
                child: Transform.rotate(
                  angle: pi,
                  child: CharacterInfo(
                    key: widget.objectKeyMap[2],
                    character: character2,
                    playerNumber: 2,
                  ),
                ),
              ),
            ),
          ),
          Transform.rotate(
            angle: pi,
            child: CharacterSelectBox(
              characterList: characterList,
              callback: (Character character) {
                character2 = character;
                changeCharacter(2, character);
              },
              doReverse: true,
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                style: TextButton.styleFrom(
                  textStyle: Theme.of(context).textTheme.labelLarge,
                ),
                child: const Text('ゲーム開始'),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (context) => CharacterSheetScreen(
                              character1: character1,
                              character2: character2,
                            )),
                  );
                },
              ),
            ),
          ),
          Transform.rotate(
            angle: 0,
            child: CharacterSelectBox(
              characterList: characterList,
              callback: (Character character) {
                character1 = character;
                changeCharacter(1, character);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 0.0),
            child: SizedBox(
              height: scaledCharacterSelectboxAndInfoHeight,
              child: Transform.scale(
                scale:
                    scaledCharacterSelectboxAndInfoHeight / characterInfoHeight,
                child: Transform.rotate(
                  angle: 0,
                  child: CharacterInfo(
                    key: widget.objectKeyMap[1],
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
