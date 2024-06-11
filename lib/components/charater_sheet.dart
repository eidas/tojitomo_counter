import 'package:flutter/material.dart';
import 'package:tojitomo_counter/components/ability_score_row.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'package:tojitomo_counter/components/equipment_button.dart';
import 'package:tojitomo_counter/components/turn_bar.dart';
import 'package:tojitomo_counter/models/character.dart';

class CharacterSheet extends StatelessWidget {
  const CharacterSheet({
    Key? key,
    required Character this.character,
  }) : super(key: key);
  final Character character;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      // appBar: TurnBar(),
      // appBar: AppBar(
      //   backgroundColor: FlutterFlowTheme.of(context).primary,
      //   automaticallyImplyLeading: false,
      //   title: Row(
      //     mainAxisSize: MainAxisSize.max,
      //     children: [
      //       Text(
      //         'ターン',
      //         style: FlutterFlowTheme.of(context).headlineMedium.override(
      //               fontFamily: 'Outfit',
      //               color: Colors.white,
      //               fontSize: 14,
      //               letterSpacing: 0,
      //               fontWeight: FontWeight.normal,
      //             ),
      //       ),
      //       Align(
      //         alignment: AlignmentDirectional(0, 0),
      //         child: Text(
      //           '1',
      //           style: FlutterFlowTheme.of(context).bodyMedium.override(
      //                 fontFamily: 'Readex Pro',
      //                 color: Colors.white,
      //                 fontSize: 28,
      //                 letterSpacing: 0,
      //               ),
      //         ),
      //       ),
      //     ],
      //   ),
      //   actions: [
      //     FFButtonWidget(
      //       onPressed: () {
      //         print('Button pressed ...');
      //       },
      //       text: '',
      //       icon: Icon(
      //         Icons.next_plan,
      //         size: 30,
      //       ),
      //       options: FFButtonOptions(
      //         width: 50,
      //         height: 40,
      //         padding: EdgeInsets.all(0),
      //         iconPadding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
      //         color: FlutterFlowTheme.of(context).primary,
      //         textStyle: FlutterFlowTheme.of(context).titleSmall.override(
      //               fontFamily: 'Readex Pro',
      //               color: Colors.white,
      //               letterSpacing: 0,
      //             ),
      //         elevation: 3,
      //         borderSide: BorderSide(
      //           color: Colors.transparent,
      //           width: 1,
      //         ),
      //         borderRadius: BorderRadius.circular(8),
      //       ),
      //     ),
      //   ],
      //   centerTitle: false,
      //   elevation: 2,
      // ),
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
                      EquipmentButton(),
                    ],
                  ),

                  // *** 攻勢 ***
                  AbilityScoreRow(
                    abilityName: "攻勢",
                    initialScore: character.offenseScore,
                    additionalScore: 0,
                  ),

                  // *** 守勢 ***
                  AbilityScoreRow(
                    abilityName: "守勢",
                    initialScore: character.defenseScore,
                    additionalScore: 0,
                  ),

                  // *** 敏捷 ***
                  AbilityScoreRow(
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
                        child: Text(
                          character.secretArtsDescription,
                          maxLines: 20,
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Readex Pro',
                                    fontSize: 10,
                                    letterSpacing: 0,
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
