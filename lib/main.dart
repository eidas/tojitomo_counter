import 'dart:html';

import 'package:flutter/material.dart';
import 'package:tojitomo_counter/models/character.dart';
import 'package:tojitomo_counter/models/character_data_csv_reader.dart';
import 'package:tojitomo_counter/screens/character_sheet_screen.dart';
import 'package:tojitomo_counter/screens/character_select_screen.dart';
import 'package:tojitomo_counter/screens/test_screen.dart';

void main() async {
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
class MyApp extends StatefulWidget {
  const MyApp({
    super.key,
    // required this.characterList,
  });
  // final List<Character> characterList;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Character> characterList = [];

  @override
  Widget build(BuildContext context) {
    final characterReader = CharacterDataCSVReader();
    characterList = characterReader.getSampleData();

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
          CharacterSelectScreen(
        characterList: characterList,
      ),
    );
  }
}

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});

//   final String title;

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;

//   void _incrementCounter() {
//     setState(() {
//       _counter++;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Theme.of(context).colorScheme.inversePrimary,
//         title: Text(widget.title),
//       ),
//       body: Transform.rotate(
//         angle: 0,
//         child: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               const Text(
//                 'You have pushed the button this many times:',
//               ),
//               Text(
//                 '$_counter',
//                 style: Theme.of(context).textTheme.headlineMedium,
//               ),
//               ElevatedButton(
//                 onPressed: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                         builder: (context) => CharacterSheetScreen()),
//                   );
//                 },
//                 child: Text("次の画面へ"),
//               ),
//             ],
//           ),
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: const Icon(Icons.add),
//       ),
//     );
//   }
// }
