import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AbilityScoreRow extends StatefulWidget {
  AbilityScoreRow({
    super.key,
    required this.abilityName,
    required this.initialScore,
    required this.additionalScore,
  }) {
    score = initialScore + additionalScore;
  }

  final String abilityName;
  final int initialScore;
  int additionalScore;

  late int score;
  int get currentScore => score;

  @override
  State<AbilityScoreRow> createState() => AbilityScoreRowState();
}

class AbilityScoreRowState extends State<AbilityScoreRow> {
  void resetScore() {
    setState(() {
      widget.score = widget.initialScore + widget.additionalScore;
    });
  }

  void updateAddtionalScore(int newAdditionalScore) {
    setState(() {
      widget.score -= widget.additionalScore;
      if (widget.score < 0) {
        widget.score = 0;
      }
      widget.additionalScore = newAdditionalScore;
      widget.score += widget.additionalScore;
    });
  }

  void _incrementCounter() {
    setState(() {
      if (widget.score < 99) {
        widget.score++;
      }
    });
  }

  void _decrementCounter() {
    setState(() {
      if (widget.score > 0) {
        widget.score--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        SizedBox(
          width: 30,
          child: Text(
            widget.abilityName,
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
              widget.initialScore.toString(),
              textAlign: TextAlign.center,
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Readex Pro',
                    letterSpacing: 0,
                  ),
            ),
          ),
        ),
        Align(
          alignment: AlignmentDirectional(0, 0),
          child: FFButtonWidget(
            onPressed: () {
              _decrementCounter();
            },
            text: '-',
            options: FFButtonOptions(
              width: 50,
              height: 40,
              padding: EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
              iconPadding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
              color: FlutterFlowTheme.of(context).primary,
              textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                    fontFamily: 'Readex Pro',
                    color: Colors.white,
                    letterSpacing: 0,
                  ),
              elevation: 3,
              borderSide: BorderSide(
                color: FlutterFlowTheme.of(context).primaryBackground,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        SizedBox(
          width: 60,
          child: Padding(
            padding: EdgeInsets.all(6),
            child: Text(
              widget.currentScore.toString(),
              textAlign: TextAlign.center,
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Readex Pro',
                    fontSize: 28,
                    letterSpacing: 0,
                    fontWeight: FontWeight.normal,
                  ),
            ),
          ),
        ),
        Align(
          alignment: AlignmentDirectional(0, 0),
          child: FFButtonWidget(
            onPressed: () {
              _incrementCounter();
            },
            text: '+',
            options: FFButtonOptions(
              width: 50,
              height: 40,
              padding: EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
              iconPadding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
              color: FlutterFlowTheme.of(context).primary,
              textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                    fontFamily: 'Readex Pro',
                    color: Colors.white,
                    letterSpacing: 0,
                  ),
              elevation: 3,
              borderSide: BorderSide(
                color: FlutterFlowTheme.of(context).primaryBackground,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ],
    );
  }
}
