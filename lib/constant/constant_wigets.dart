
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';


Future<bool?> showToast({ required String message}){
   return Fluttertoast.showToast(
       msg: message ,
       fontSize: 24 ,
       textColor: Colors.black ,
       gravity: ToastGravity.TOP ,
       toastLength: Toast.LENGTH_LONG
   );

}