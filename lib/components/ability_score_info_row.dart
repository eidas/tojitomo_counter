import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AbilityScoreInfoRow extends StatelessWidget {
  AbilityScoreInfoRow({
    super.key,
    required this.abilityName,
    required this.initialScore,
  });

  final String abilityName;
  final int initialScore;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        SizedBox(
          width: 30,
          child: Text(
            abilityName,
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: 'Readex Pro',
                  letterSpacing: 0,
                ),
          ),
        ),
        SizedBox(
          width: 30,
          child: Padding(
            padding: EdgeInsets.all(6),
            child: Text(
              initialScore.toString(),
              textAlign: TextAlign.center,
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Readex Pro',
                    letterSpacing: 0,
                  ),
            ),
          ),
        ),
      ],
    );
  }
}
