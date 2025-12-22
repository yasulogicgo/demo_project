
import 'package:flutter/material.dart';

ElevatedButton  commonButton({
   required void Function() onPressed,
   required void Function() onLongPress,
   Widget? child,
   double? buttonWidth,
   double? buttonHeight,
   Color? backgroundColor,
   Color? color,

 }) => ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(  8),
          side: BorderSide(color: backgroundColor ?? Color(0xff344343)),
        ),
        backgroundColor: color ?? Color(0xFF000000),
        elevation:9,
        padding: EdgeInsets.symmetric(horizontal: 23 ,vertical: 23),
        fixedSize:
        (buttonWidth != null || buttonHeight != null)
            ? Size(buttonWidth ?? double.infinity, buttonHeight ?? 10)
            : null,
        minimumSize:
        (buttonWidth != null || buttonHeight != null)
            ? Size(buttonWidth ?? double.infinity, buttonHeight ?? 10)
            : null,
      ),

      onPressed: onPressed,
      onLongPress: onLongPress,
      child: child );