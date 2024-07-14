import 'package:flutter/material.dart';
import 'package:tojitomo_counter/models/character.dart';

class CharacterSelectBox extends StatefulWidget {
  const CharacterSelectBox({
    super.key,
    required this.characterList,
    required this.callback,
    this.doReverse = false,
  });
  final List<Character> characterList;
  final Function callback;
  final bool doReverse;

  @override
  State<CharacterSelectBox> createState() => _CharacterSelectBoxState();
}

class _CharacterSelectBoxState extends State<CharacterSelectBox> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: SizedBox(
        height: 60.0,
        child: Center(
          child: DropdownMenu<Character>(
              width: 200.0,
              menuHeight: 200,
              label: const Text("キャラを選択"),
              onSelected: (Character? character) {
                widget.callback(character);
              },
              dropdownMenuEntries: widget.characterList
                  .map<DropdownMenuEntry<Character>>(
                      (e) => DropdownMenuEntry<Character>(
                            value: e,
                            label: e.name,
                            labelWidget: RotatedBox(
                              quarterTurns: widget.doReverse ? 2 : 0,
                              child: Text(e.name),
                            ),
                          ))
                  .toList()),
        ),
        // FutureBuilder<List<Character>>(
        //   future: widget.characterList,
        //   builder: (context, snapshot) {
        //     if (snapshot.connectionState == ConnectionState.waiting) {
        //       return const Center(child: CircularProgressIndicator());
        //     } else if (snapshot.hasError) {
        //       return Center(child: Text('Error: ${snapshot.error}'));
        //     } else {
        //       return Center(
        //         child: DropdownMenu<Character>(
        //             width: 200.0,
        //             menuHeight: 10,
        //             label: const Text("キャラを選択"),
        //             dropdownMenuEntries: (snapshot.data ?? [])
        //                 .map<DropdownMenuEntry<Character>>((e) =>
        //                     DropdownMenuEntry<Character>(value: e, label: e.name))
        //                 .toList()),
        //       );
        //     }
        //   },
        // ),
      ),
    );
  }
}
