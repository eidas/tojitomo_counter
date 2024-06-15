import 'package:flutter/material.dart';
import 'package:tojitomo_counter/components/ability_score_row.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'package:tojitomo_counter/components/equipment_button.dart';
import 'package:tojitomo_counter/models/character.dart';

// ignore: must_be_immutable
class CharacterSheet extends StatelessWidget {
  CharacterSheet({
    super.key,
    required this.character,
    required this.playerNumber,
  }) {
    offeseAbilityKey =
        GlobalObjectKey<AbilityScoreRowState>("p${playerNumber}offense");
    defenseAbilityKey =
        GlobalObjectKey<AbilityScoreRowState>("p${playerNumber}defense");
    agilityAbilityKey =
        GlobalObjectKey<AbilityScoreRowState>("p${playerNumber}agility");
  }
  final Character character;
  final int playerNumber;
  int additionalScore = 0;
  GlobalObjectKey<AbilityScoreRowState>? offeseAbilityKey;
  GlobalObjectKey<AbilityScoreRowState>? defenseAbilityKey;
  GlobalObjectKey<AbilityScoreRowState>? agilityAbilityKey;

  void updateAdditionalScore(int additionalScore) {
    offeseAbilityKey!.currentState!.updateAddtionalScore(additionalScore);
    defenseAbilityKey!.currentState!.updateAddtionalScore(additionalScore);
    agilityAbilityKey!.currentState!.updateAddtionalScore(additionalScore);
    this.additionalScore = additionalScore;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: SafeArea(
        top: true,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              width: MediaQuery.sizeOf(context).width,
              height: MediaQuery.sizeOf(context).height * 1,
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
                        padding: EdgeInsets.all(4),
                        child: Text(
                          character.characterName,
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Readex Pro',
                                    fontSize: 18,
                                    letterSpacing: 0,
                                  ),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(0, 0),
                        child: Text(
                          character.characterNameRomeji,
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Readex Pro',
                                    fontSize: 12,
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
                        padding: EdgeInsets.all(2),
                        child: Text(
                          character.shozoku,
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Readex Pro',
                                    fontSize: 12,
                                    letterSpacing: 0,
                                  ),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(0, 0),
                        child: Padding(
                          padding: EdgeInsets.all(4),
                          child: Text(
                            character.seiryoku,
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Readex Pro',
                                  fontSize: 14,
                                  letterSpacing: 0,
                                ),
                          ),
                        ),
                      ),
                      Container(
                        width: 20,
                      ),
                      EquipmentButton(callback: updateAdditionalScore),
                    ],
                  ),

                  // *** 攻勢 ***
                  AbilityScoreRow(
                    key: offeseAbilityKey,
                    abilityName: "攻勢",
                    initialScore: character.offenseScore,
                    additionalScore: 0,
                  ),

                  // *** 守勢 ***
                  AbilityScoreRow(
                    key: defenseAbilityKey,
                    abilityName: "守勢",
                    initialScore: character.defenseScore,
                    additionalScore: 0,
                  ),

                  // *** 敏捷 ***
                  AbilityScoreRow(
                    key: agilityAbilityKey,
                    abilityName: "敏捷",
                    initialScore: character.agilityScore,
                    additionalScore: 0,
                  ),

                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        character.secretArtsName,
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
                              minHeight: 10, minWidth: double.infinity),
                          child: Text(
                            character.secretArtsDescription,
                            maxLines: 10,
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Readex Pro',
                                  fontSize: 10,
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
      ),
    );
  }
}
