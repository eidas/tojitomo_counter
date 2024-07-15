import 'package:flutter/material.dart';
import 'package:tojitomo_counter/screens/character_select_screen.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

// ignore: must_be_immutable
class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '刀使盤カウンター',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: //TestScreen(),
          CharacterSelectScreen(),
    );
  }
}
