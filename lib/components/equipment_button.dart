import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

enum EquipmentStatus {
  notEquiped(displayName: 'なし', additionalScore: 0),
  sSoubi(displayName: 'S装備', additionalScore: 3),
  saishireisou(displayName: '祭祀礼装', additionalScore: 2),
  ;

  final String displayName;
  final int additionalScore;

  const EquipmentStatus(
      {required this.displayName, required this.additionalScore});
}

// ignore: must_be_immutable
class EquipmentButton extends StatefulWidget {
  EquipmentButton({
    super.key,
    required this.callback,
  });
  final Function callback;
  int additionalScore = 0;

  @override
  State<EquipmentButton> createState() => _EquipmentButtonState();
}

class _EquipmentButtonState extends State<EquipmentButton> {
  void _equipSSoubi() {
    setState(() {
      _unequip();
      widget.additionalScore = 3;
    });
  }

  void _equipSaishireisou() {
    setState(() {
      _unequip();
      widget.additionalScore = 2;
    });
  }

  void _unequip() {
    setState(() {
      widget.additionalScore = 0;
    });
  }

  void _setSelectedButton(int onSelect) {
    if (onSelect == 0 /* S装ボタンが押された */) {
      if (equipmentStatus == EquipmentStatus.sSoubi) {
        equipmentStatus = EquipmentStatus.notEquiped;
        selectedButton = [false, false];
        _unequip();
      } else {
        equipmentStatus = EquipmentStatus.sSoubi;
        selectedButton = [true, false];
        _equipSSoubi();
      }
    } else if (onSelect == 1 /* 祭礼ボタンが押された */) {
      if (equipmentStatus == EquipmentStatus.saishireisou) {
        equipmentStatus = EquipmentStatus.notEquiped;
        selectedButton = [false, false];
        _unequip();
      } else {
        equipmentStatus = EquipmentStatus.saishireisou;
        selectedButton = [false, true];
        _equipSaishireisou();
      }
    }
  }

  EquipmentStatus equipmentStatus = EquipmentStatus.notEquiped;
  List<bool> selectedButton = [false, false];
  // int selectedEquipment = -1;

  @override
  Widget build(BuildContext context) {
    // 装備
    return ToggleButtons(
      isSelected: selectedButton,
      children: const [Text("S装"), Text("祭礼")],
      onPressed: (int index) {
        setState(() {
          _setSelectedButton(index);
        });
        widget.callback(widget.additionalScore);
      },
      borderRadius: const BorderRadius.all(Radius.circular(10)),
    );

    // Visibility(
    //   visible: widget.equipmentButtonVisibility,
    //   child: Align(
    //     alignment: AlignmentDirectional(0, 0),
    //     child: FFButtonWidget(
    //       onPressed: () {
    //         print('Button pressed ...');
    //       },
    //       text: 'S装',
    //       options: FFButtonOptions(
    //         width: 50,
    //         height: 40,
    //         padding: EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
    //         iconPadding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
    //         color: FlutterFlowTheme.of(context).primary,
    //         textStyle: FlutterFlowTheme.of(context).titleSmall.override(
    //               fontFamily: 'Readex Pro',
    //               color: Colors.white,
    //               letterSpacing: 0,
    //             ),
    //         elevation: 3,
    //         borderSide: BorderSide(
    //           color: FlutterFlowTheme.of(context).primaryBackground,
    //           width: 1,
    //         ),
    //         borderRadius: BorderRadius.circular(10),
    //       ),
    //     ),
    //   ),
    // ),
    // Visibility(
    //   visible: widget.equipmentButtonVisibility,
    //   child: Align(
    //     alignment: AlignmentDirectional(0, 0),
    //     child: FFButtonWidget(
    //       onPressed: () {
    //         print('Button pressed ...');
    //       },
    //       text: '祭礼',
    //       options: FFButtonOptions(
    //         width: 50,
    //         height: 40,
    //         padding: EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
    //         iconPadding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
    //         color: FlutterFlowTheme.of(context).primary,
    //         textStyle: FlutterFlowTheme.of(context).titleSmall.override(
    //               fontFamily: 'Readex Pro',
    //               color: Colors.white,
    //               letterSpacing: 0,
    //             ),
    //         elevation: 3,
    //         borderSide: BorderSide(
    //           color: FlutterFlowTheme.of(context).primaryBackground,
    //           width: 1,
    //         ),
    //         borderRadius: BorderRadius.circular(10),
    //       ),
    //     ),
    //   ),
    // ),
  }
}
