import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tojitomo_counter/components/ability_score_info_row.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'package:tojitomo_counter/models/character.dart';

// ignore: must_be_immutable
class CharacterInfo extends StatefulWidget {
  CharacterInfo({
    super.key,
    required this.character,
    required this.playerNumber,
  });
  Character character;
  final int playerNumber;

  @override
  State<CharacterInfo> createState() => CharacterInfoState();
}

class CharacterInfoState extends State<CharacterInfo> {
  void changeCharacter(Character character) {
    setState(() {
      widget.character = character;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            width: MediaQuery.sizeOf(context).width,
            height: 250, // MediaQuery.sizeOf(context).height * 1,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(4),
                      child: Text(
                        widget.character.characterName,
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Readex Pro',
                              fontSize: 14,
                              letterSpacing: 0,
                            ),
                      ),
                    ),
                    Align(
                      alignment: const AlignmentDirectional(0, 0),
                      child: Text(
                        widget.character.characterNameRomeji,
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Readex Pro',
                              fontSize: 9,
                              letterSpacing: 0,
                            ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(2),
                      child: Text(
                        widget.character.shozoku,
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Readex Pro',
                              fontSize: 9,
                              letterSpacing: 0,
                            ),
                      ),
                    ),
                    Align(
                      alignment: const AlignmentDirectional(0, 0),
                      child: Padding(
                        padding: const EdgeInsets.all(4),
                        child: Text(
                          widget.character.seiryoku,
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Readex Pro',
                                    fontSize: 11,
                                    letterSpacing: 0,
                                  ),
                        ),
                      ),
                    ),
                  ],
                ),

                // *** 攻勢 ***
                AbilityScoreInfoRow(
                  abilityName: "攻勢",
                  initialScore: widget.character.offenseScore,
                ),

                // *** 守勢 ***
                AbilityScoreInfoRow(
                  abilityName: "守勢",
                  initialScore: widget.character.defenseScore,
                ),

                // *** 敏捷 ***
                AbilityScoreInfoRow(
                  abilityName: "敏捷",
                  initialScore: widget.character.agilityScore,
                ),

                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      widget.character.secretArtsName,
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Readex Pro',
                            letterSpacing: 0,
                          ),
                    ),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Flexible(
                      child: Container(
                        constraints: const BoxConstraints(
                            minHeight: 5, minWidth: double.infinity),
                        height: 60,
                        child: Text(
                          widget.character.secretArtsDescription,
                          maxLines: 5,
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Readex Pro',
                                    fontSize: 9,
                                    letterSpacing: 0,
                                  ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
