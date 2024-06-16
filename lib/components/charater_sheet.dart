import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tojitomo_counter/components/ability_score_row.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'package:tojitomo_counter/components/equipment_button.dart';
import 'package:tojitomo_counter/models/character.dart';

// ignore: must_be_immutable
class CharacterSheet extends StatefulWidget {
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
    belongToToji = character.seiryoku.startsWith('刀使');
  }
  final Character character;
  final int playerNumber;
  late bool belongToToji;
  GlobalObjectKey<AbilityScoreRowState>? offeseAbilityKey;
  GlobalObjectKey<AbilityScoreRowState>? defenseAbilityKey;
  GlobalObjectKey<AbilityScoreRowState>? agilityAbilityKey;

  @override
  State<CharacterSheet> createState() => CharacterSheetState();
}

class CharacterSheetState extends State<CharacterSheet> {
  int additionalScore = 0;

  void updateAdditionalScore(int additionalScore) {
    widget.offeseAbilityKey!.currentState!
        .updateAddtionalScore(additionalScore);
    widget.defenseAbilityKey!.currentState!
        .updateAddtionalScore(additionalScore);
    widget.agilityAbilityKey!.currentState!
        .updateAddtionalScore(additionalScore);
    this.additionalScore = additionalScore;
  }

  void resetScore() {
    widget.offeseAbilityKey!.currentState!.resetScore();
    widget.defenseAbilityKey!.currentState!.resetScore();
    widget.agilityAbilityKey!.currentState!.resetScore();
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
                          widget.character.characterName,
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
                          widget.character.characterNameRomeji,
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
                          widget.character.shozoku,
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
                            widget.character.seiryoku,
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
                      Visibility(
                          visible: widget.belongToToji,
                          child:
                              EquipmentButton(callback: updateAdditionalScore)),
                    ],
                  ),

                  // *** 攻勢 ***
                  AbilityScoreRow(
                    key: widget.offeseAbilityKey,
                    abilityName: "攻勢",
                    initialScore: widget.character.offenseScore,
                    additionalScore: 0,
                  ),

                  // *** 守勢 ***
                  AbilityScoreRow(
                    key: widget.defenseAbilityKey,
                    abilityName: "守勢",
                    initialScore: widget.character.defenseScore,
                    additionalScore: 0,
                  ),

                  // *** 敏捷 ***
                  AbilityScoreRow(
                    key: widget.agilityAbilityKey,
                    abilityName: "敏捷",
                    initialScore: widget.character.agilityScore,
                    additionalScore: 0,
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
                              minHeight: 10, minWidth: double.infinity),
                          child: Text(
                            widget.character.secretArtsDescription,
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
