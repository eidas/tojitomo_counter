import 'dart:math';

import 'package:flutter/material.dart';
// import 'package:tojitomo_counter/components/ability_score_row.dart';
import 'package:tojitomo_counter/components/charater_sheet.dart';
import 'package:tojitomo_counter/models/character.dart';

class CharacterSheetScreen extends StatelessWidget {
  const CharacterSheetScreen({
    Key? key,
  }) : super(key: key);

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
    final character2 = Character(
      characterName: '衛藤 可奈美',
      characterNameRomeji: 'ETO KANAMI',
      shozoku: '美濃関',
      seiryoku: '刀使',
      offenseScore: 5,
      defenseScore: 5,
      agilityScore: 1,
      secretArtsName: '【奥義：無双神鳴斬】',
      secretArtsDescription: """自分の帰還エリアにカードが3枚以上ある場合使用でき、どちらか1つを選び適用する。
・【コスト：自分の写シを4枚隠世へ送る】
相手キャラクターを1体選びこのキャラクターの [攻勢] [守勢] を合計した数と同じ数のダメージを与える。
・【コスト：自分の写シを3枚隠世へ送る】
相手キャラクターを1体選び、そのキャラクターの奥義と同じ効果を得る（コストも含む）。""",
    );
    return Column(
      children: [
        Container(
          height: 350,
          child: Transform.scale(
            scale: 0.8,
            child: Transform.rotate(
              angle: pi,
              child: CharacterSheet(
                character: character2,
              ),
            ),
          ),
        ),
        Container(
          height: 350,
          child: Transform.scale(
            scale: 0.8,
            child: Transform.rotate(
              angle: 0,
              child: CharacterSheet(
                character: character1,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
