import 'package:demo_app/theme/app_textStyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CommonTextfield extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final String? labelText;
  final TextInputType? keyboardType;
  final ValueChanged<String?>? onChanged;
  final List<TextInputFormatter>? textFormatter;
  final bool? obscureText;
  final Widget? suffixWidget;
  final Widget? prefixWidget;
  final Color? textColor;
  final Color? hintColor;
  final Color? fillColor;
  final Color? borderColor;
  final Color? cursorColor;

  const CommonTextfield({
    super.key,
    required this.controller,
    required this.hintText,
    this.onChanged,
    this.textFormatter,
    this.suffixWidget,
    this.prefixWidget,
    this.textColor,
    this.hintColor,
    this.fillColor,
    this.borderColor,
    this.cursorColor,
    this.keyboardType,
    this.obscureText,
    this.labelText,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onChanged: onChanged,
      obscureText: obscureText ?? false,
      inputFormatters: textFormatter,
      autocorrect: false,
      cursorColor: cursorColor ?? Colors.black,
      cursorWidth: 2.5,
      keyboardType: keyboardType ?? TextInputType.text,
      style: AppTextStyle.googleFont(),

      decoration: InputDecoration(
        prefixIcon: prefixWidget,
        suffixIcon: suffixWidget,
        hintText: hintText,
        labelText: labelText,

        hintStyle: TextStyle(
          color: hintColor ?? Colors.grey,
        ),

        filled: true,
        fillColor: fillColor ?? Colors.grey.shade200,

        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: borderColor ?? Colors.transparent,
          ),
        ),

        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: borderColor ?? Colors.transparent,
          ),
        ),

        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}

class AppInputField extends StatelessWidget {
  final TextEditingController? controller;
  final String? label;
  final String? hint;
  final bool obscureText;
  final TextInputType keyboardType;
  final Widget? prefix;
  final Widget? suffix;
  final int maxLines;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final bool enabled;

  const AppInputField({
    super.key,
    this.controller,
    this.label,
    this.hint,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.prefix,
    this.suffix,
    this.maxLines = 1,
    this.validator,
    this.onChanged,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      obscureText: obscureText,
      keyboardType: keyboardType,
      maxLines: maxLines,
      enabled: enabled,
      onChanged: onChanged,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        prefixIcon: prefix,
        suffixIcon: suffix,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}


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

    );
  }
}
