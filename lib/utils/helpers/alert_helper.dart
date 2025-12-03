import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';

class AlertHelper {
  // show a dialog
  static void showAlert(BuildContext context, String desc,
      {DialogType type = DialogType.error}) {
    AwesomeDialog(
      context: context,
      dialogType: type,
      animType: AnimType.scale,
      title: 'Incomplete Fields',
      desc: 'Please fill all the fields',
      btnOkOnPress: () {},
      btnCancelOnPress: () {},
    ).show();
  }
}
