import 'package:flutter/material.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';

// ignore: must_be_immutable
class TurnBar extends AppBar {
  TurnBar({
    super.key,
    required this.newTurnCallback,
    required this.gameEndCallback,
  });
  final Function newTurnCallback;
  final Function gameEndCallback;
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
            alignment: const AlignmentDirectional(0, 0),
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
          onPressed: () async {
            // print('Button pressed ...');
            final reslut = await _showCommonDialog(
                context, '次のターン', '次のターンに進みますか？', 'OK', 'キャンセル');
            if (reslut ?? false) {
              setState(() {
                widget.turn++;
              });
              widget.newTurnCallback();
            }
          },
          text: '',
          icon: const Icon(
            Icons.restart_alt,
            size: 30,
          ),
          options: FFButtonOptions(
            width: 50,
            height: 40,
            padding: const EdgeInsets.all(0),
            iconPadding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
            color: FlutterFlowTheme.of(context).primary,
            textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                  fontFamily: 'Readex Pro',
                  color: Colors.white,
                  letterSpacing: 0,
                ),
            elevation: 3,
            borderSide: const BorderSide(
              color: Colors.transparent,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        FFButtonWidget(
          onPressed: () async {
            final reslut = await _showCommonDialog(
                context, 'ゲーム終了', 'このゲームを終了しますか？\n(最初の画面に戻ります)', 'OK', 'キャンセル');
            if (reslut ?? false) {
              for (int i = 0; i < 10; i++) {
                if (context.mounted) {
                  widget.gameEndCallback();
                }
                await Future.delayed(const Duration(milliseconds: 500));
              }
            }
          },
          text: '',
          icon: const Icon(
            Icons.exit_to_app,
            size: 30,
          ),
          options: FFButtonOptions(
            width: 50,
            height: 40,
            padding: const EdgeInsets.all(0),
            iconPadding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
            color: FlutterFlowTheme.of(context).primary,
            textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                  fontFamily: 'Readex Pro',
                  color: Colors.white,
                  letterSpacing: 0,
                ),
            elevation: 3,
            borderSide: const BorderSide(
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

  bool? showCommonDialog(BuildContext context, String title, String message,
      String yesText, String noText) {
    Future<bool?> result =
        _showCommonDialog(context, title, message, yesText, noText);
    result.then((value) => value);
  }

  Future<bool?> _showCommonDialog(BuildContext context, String title,
      String message, String yesText, String noText) async {
    return await showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(
            message,
          ),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: Text(noText),
              onPressed: () {
                Navigator.pop(context, false);
              },
            ),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: Text(yesText),
              onPressed: () {
                Navigator.pop(context, true);
              },
            ),
          ],
        );
      },
    );
  }
}
