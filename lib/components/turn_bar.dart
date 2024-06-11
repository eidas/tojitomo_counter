import 'package:flutter/material.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';

class TurnBar extends AppBar {
  TurnBar({
    Key? key,
  }) : super(key: key);
  int turn = 1;

  @override
  State<TurnBar> createState() => _TurnBarState();
}

class _TurnBarState extends State<TurnBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: FlutterFlowTheme.of(context).primary,
      automaticallyImplyLeading: false,
      title: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Text(
            'ターン',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Outfit',
                  color: Colors.white,
                  fontSize: 14,
                  letterSpacing: 0,
                  fontWeight: FontWeight.normal,
                ),
          ),
          Align(
            alignment: AlignmentDirectional(0, 0),
            child: Text(
              widget.turn.toString(),
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Readex Pro',
                    color: Colors.white,
                    fontSize: 28,
                    letterSpacing: 0,
                  ),
            ),
          ),
        ],
      ),
      actions: [
        FFButtonWidget(
          onPressed: () {
            print('Button pressed ...');
          },
          text: '',
          icon: Icon(
            Icons.next_plan,
            size: 30,
          ),
          options: FFButtonOptions(
            width: 50,
            height: 40,
            padding: EdgeInsets.all(0),
            iconPadding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
            color: FlutterFlowTheme.of(context).primary,
            textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                  fontFamily: 'Readex Pro',
                  color: Colors.white,
                  letterSpacing: 0,
                ),
            elevation: 3,
            borderSide: BorderSide(
              color: Colors.transparent,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ],
      centerTitle: false,
      elevation: 2,
    );
  }
}
