import 'dart:html';

import 'package:flutter/material.dart';
import 'package:tojitomo_counter/models/character.dart';
import 'package:tojitomo_counter/models/character_list.dart';
import 'package:tojitomo_counter/screens/character_sheet_screen.dart';
import 'package:tojitomo_counter/screens/character_select_screen.dart';
import 'package:tojitomo_counter/screens/test_screen.dart';

void main() {
  // final characterDataCSVReader = CharacterDataCSVReader();
  // final characterList = await characterDataCSVReader.getCsvData();
  runApp(
    const MyApp(
        // characterList: characterList,
        ),
  );
  // runApp(const CharacterSelectScreen());
}

// ignore: must_be_immutable
class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
    // required this.characterList,
  });

  @override
  Widget build(BuildContext context) {
    // final characterReader = CharacterList();
    // characterList = characterReader.getSampleData();

    // characterReader.getCsvData().then((list) => {
    //       setState(() {
    //         characterList = list;
    //       })
    //     });

    // print("main.dart: characterList.lenghth = ${characterList.length}");
    return MaterialApp(
      title: '刀使盤カウンター',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: //TestScreen(),
          CharacterSelectScreen(),
      // initialRoute: '/',
      // routes: {
      //   '/': (context) => CharacterSelectScreen(),
      //   '/test': (context) => TestScreen(),
      // },
      // onGenerateRoute: (settings) {
      //   if (settings.name == '/game') {
      //     return MaterialPageRoute(
      //         builder: (context) => CharacterSheetScreen(
      //               character1: (settings.arguments as List<Character>)[0],
      //               character2: (settings.arguments as List<Character>)[1],
      //             ));
      //   }
      //   return null;
      // },
    );
  }
}
