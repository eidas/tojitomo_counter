import 'dart:math';

import 'package:flutter/material.dart';
import 'package:tojitomo_counter/components/character_select_box.dart';
import 'package:tojitomo_counter/components/charater_info.dart';
import 'package:tojitomo_counter/components/charater_sheet.dart';
import 'package:tojitomo_counter/components/turn_bar.dart';
import 'package:tojitomo_counter/models/character.dart';
import 'package:tojitomo_counter/screens/character_sheet_screen.dart';

class TestScreen extends StatelessWidget {
  const TestScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final character1 = Character(
      characterName: '安桜 美炎',
      characterNameRomeji: 'ASAKURA MIHONO',
      shozoku: '美濃関',
      seiryoku: '刀使',
      offenseScore: 6,
      defenseScore: 4,
      agilityScore: 1,
      secretArtsName: '【奥義：神居弐式】',
      secretArtsDescription: """自分の帰還エリアにカードが4枚以上ある場合使用できる。
【コスト：自分の写シを4枚隠世へ送る】
相手キャラクターを1体選びサイコロを1回振る。出た目の数だけその相手キャラクターにこのキャラクターの [攻勢] と同じ数のダメージを与える。""",
    );

    final GlobalKey _sheetKey = GlobalKey();
    final sheet =
        CharacterInfo(key: _sheetKey, character: character1, playerNumber: 1);
    final RenderBox? renderBox =
        _sheetKey.currentContext?.findRenderObject() as RenderBox?;
    print(renderBox?.size.toString()); // Size(600.0, 600.0)

    GlobalObjectKey<CharacterSheetState>? player1Key =
        const GlobalObjectKey('p1');
    GlobalObjectKey<CharacterSheetState>? player2Key =
        const GlobalObjectKey('p2');
    final List<Character> characterList = [character1];
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Transform.scale(
              scale: 0.9,
              child: Transform.rotate(
                angle: pi,
                child:
                    // CharacterSelectBox(characterList: characterList),
                    CharacterInfo(
                  character: character1,
                  playerNumber: 2,
                ),
              ),
            ),
          ),
          Transform.rotate(
            angle: pi,
            child: CharacterSelectBox(
              characterList: characterList,
              callback: () {},
            ),
          ),
          Center(
            child: ElevatedButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('ゲーム開始'),
              onPressed: () async {
                final result = await Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => CharacterSheetScreen(
                          character1: character1, character2: character1)),
                );
                // setState(() {});
              },
            ),
          ),
          Transform.rotate(
            angle: 0,
            child: CharacterSelectBox(
              characterList: characterList,
              callback: () {},
            ),
          ),
          Expanded(
            child: Transform.scale(
              scale: 0.9,
              child: Transform.rotate(
                angle: 0,
                child: CharacterInfo(
                  character: character1,
                  playerNumber: 1,
                ),
              ),
            ),
          ),
        ],
      ),
    );

    // return Column(
    //   children: [
    //     Expanded(
    //       child: Transform.scale(
    //         scale: 0.9,
    //         child: Transform.rotate(
    //           angle: pi,
    //           child: CharacterSheet(
    //             key: player2Key,
    //             character: character1,
    //             playerNumber: 2,
    //           ),
    //         ),
    //       ),
    //     ),
    //     TurnBar(callback: (() {})),
    //     Expanded(
    //       child: Transform.scale(
    //         scale: 0.9,
    //         child: Transform.rotate(
    //           angle: 0,
    //           child: CharacterSheet(
    //             key: player1Key,
    //             character: character1,
    //             playerNumber: 1,
    //           ),
    //         ),
    //       ),
    //     ),
    //   ],
    // );
  }
}
