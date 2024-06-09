import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'package:flutter/material.dart';

class EquipmentButton extends StatefulWidget {
  EquipmentButton({
    super.key,
  });
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
    if (onSelect == 0) {
      if (selectedButton[0]) {
        selectedButton = [false, false];
        _unequip();
      } else {
        selectedButton = [true, false];
        _equipSSoubi();
      }
    } else if (onSelect == 1) {
      if (selectedButton[1]) {
        selectedButton = [false, false];
        _unequip();
      } else {
        selectedButton = [false, true];
        _equipSaishireisou();
      }
    }
  }

  List<bool> selectedButton = [false, false];
  int selectedEquipment = -1;

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
