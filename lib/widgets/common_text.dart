import 'package:flutter/material.dart';

class CommonText extends StatelessWidget {
  final String data;
  final TextStyle? style;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextOverflow? overflow;
  final StrutStyle? strutStyle;
  final TextWidthBasis? textWidthBasis;
  final TextHeightBehavior? textHeightBehavior;
  final Locale? locale;
  final bool? softWrap;
  final TextDirection? textDirection;
  final double? textScaleFactor;
  final Color? selectionColor;
  final String? semanticsIdentifier;
  final String? semanticsLabel;
  final TextScaler? textScaler;

  const CommonText({
    super.key,
    required this.data,
    this.style,
    this.textAlign,
    this.maxLines,
    this.overflow,
    this.strutStyle,
    this.textWidthBasis,
    this.textHeightBehavior,
    this.locale,
    this.softWrap,
    this.textDirection,
    this.textScaleFactor,
    this.selectionColor,
    this.semanticsIdentifier,
    this.semanticsLabel,
    this.textScaler,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: style,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
      strutStyle: strutStyle,
      textWidthBasis: textWidthBasis,
      textHeightBehavior: textHeightBehavior,
      locale: locale,
      softWrap: softWrap,
      textDirection: textDirection,
      textScaleFactor: textScaleFactor,
      selectionColor: selectionColor,
      semanticsIdentifier: semanticsIdentifier,
      semanticsLabel: semanticsLabel,
      textScaler: textScaler,

    );
  }
}
