import 'package:flutter/material.dart';

class CustomSnackbar extends SnackBar {
  CustomSnackbar(
      {Key? key,
      required String message,
      String btnLabel = 'OK',
      Duration duration = const Duration(seconds: 2),
      VoidCallback? onOK
      //super.key, required super.content//
      })
      : super(
            key: key,
            content: Text(message),
            duration: duration,
            action: SnackBarAction(
                label: btnLabel,
                onPressed: () {
                  if (onOK != null) {
                    onOK;
                  }
                }));
}
