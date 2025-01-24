import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

mixin AppNotice {
  void showError({required String errorText}) {
    Fluttertoast.showToast(
        msg: errorText,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.TOP,
        timeInSecForIosWeb: 3,
        backgroundColor: Colors.red.withOpacity(0.8),
        textColor: Colors.white,
        fontSize: 16.0);
  }

  void showSuccess({required String message}) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.TOP,
        timeInSecForIosWeb: 3,
        backgroundColor: Colors.green.withOpacity(0.8),
        textColor: Colors.white,
        fontSize: 16.0);
  }
}
