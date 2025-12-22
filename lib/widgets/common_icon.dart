import 'package:flutter/material.dart';

class CommonIcon extends StatelessWidget {
  final IconData icon;                        // Required icon
  final double? size;                         // Icon size
  final Color? color;                         // Icon color
  final String? semanticLabel;                // Accessibility label
  final TextDirection? textDirection;         // LTR/RTL
  final List<Shadow>? shadows;                // Apply shadows
  final double? opticalSize;                  // For variable fonts
  final double? grade;                        // Font weight-like adjustment
  final double? fill;                         // How much icon is filled
  final double? weight;                       // Line weight

  // NEW 3 PARAMETERS
  final bool? applyTextScaling;               // Scale the icon with system text scale
  final BlendMode? blendMode;                 // How icon blends with background
  final FontWeight? fontWeight;               // Font weight (Material Symbols)

  const CommonIcon({
    super.key,
    required this.icon,
    this.size,
    this.color,
    this.semanticLabel,
    this.textDirection,
    this.shadows,
    this.opticalSize,
    this.grade,
    this.fill,
    this.weight,
    this.applyTextScaling,
    this.blendMode,
    this.fontWeight,
  });

  @override
  Widget build(BuildContext context) {
    return Icon(
      icon,
      size: size,
      color: color,
      semanticLabel: semanticLabel,
      textDirection: textDirection,
      shadows: shadows,
      opticalSize: opticalSize,
      grade: grade,
      fill: fill,
      weight: weight,

      // Newly added parameters:
      applyTextScaling: applyTextScaling ?? true,
      blendMode: blendMode,
      fontWeight: fontWeight,
    );
  }
}
