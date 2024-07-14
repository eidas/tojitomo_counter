import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
// import 'package:tojitomo_counter/components/ability_score_row.dart';
import 'package:tojitomo_counter/components/charater_sheet.dart';
import 'package:tojitomo_counter/components/turn_bar.dart';
import 'package:tojitomo_counter/models/character.dart';
import 'package:tojitomo_counter/screens/character_select_screen.dart';

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
    // return Scaffold(
    //   appBar: AppBar(
    //     title: Text("次の画面"),
    //   ),
    //   body: Center(
    //     child: AbilityScoreRow(
    //       abilityName: "守勢",
    //       initialScore: 5,
    //       hasEquipmentButton: true,
    //     ),
    //   ),
    // );
//     final character1 = Character(
//       characterName: '安桜 美炎',
//       characterNameRomeji: 'ASAKURA MIHONO',
//       shozoku: '美濃関',
//       seiryoku: '刀使',
//       offenseScore: 6,
//       defenseScore: 4,
//       agilityScore: 1,
//       secretArtsName: '【奥義：神居弐式】',
//       secretArtsDescription: """自分の帰還エリアにカードが4枚以上ある場合使用できる。
// 【コスト：自分の写シを4枚隠世へ送る】
// 相手キャラクターを1体選びサイコロを1回振る。出た目の数だけその相手キャラクターにこのキャラクターの [攻勢] と同じ数のダメージを与える。""",
//     );
//     final character2 = Character(
//       characterName: '衛藤 可奈美',
//       characterNameRomeji: 'ETO KANAMI',
//       shozoku: '美濃関',
//       seiryoku: '刀使',
//       offenseScore: 5,
//       defenseScore: 5,
//       agilityScore: 1,
//       secretArtsName: '【奥義：無双神鳴斬】',
//       secretArtsDescription: """自分の帰還エリアにカードが3枚以上ある場合使用でき、どちらか1つを選び適用する。
// ・【コスト：自分の写シを4枚隠世へ送る】
// 相手キャラクターを1体選びこのキャラクターの [攻勢] [守勢] を合計した数と同じ数のダメージを与える。
// ・【コスト：自分の写シを3枚隠世へ送る】
// 相手キャラクターを1体選び、そのキャラクターの奥義と同じ効果を得る（コストも含む）。""",
//     );

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
