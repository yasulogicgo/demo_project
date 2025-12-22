
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

enum Status { error, success }

void toastInfo({required String msg, required Status status}) {
  Fluttertoast.showToast(
    msg: msg,
    backgroundColor: status == Status.error ? Colors.red : Colors.green,
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.TOP,
  );
}