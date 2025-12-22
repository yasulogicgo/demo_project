import 'package:flutter/material.dart';

class CommonContainer extends StatelessWidget {
  final Widget? child;                           // The widget inside the container
  final AlignmentGeometry? alignment;            // Aligns the child inside the container
  final EdgeInsetsGeometry? padding;             // Space INSIDE container around child
  final Color? color;                            // Background color (can't be used with decoration color)
  final Decoration? decoration;                  // Full styling: border, radius, gradient, shadow
  final Decoration? foregroundDecoration;        // Decoration ABOVE child (overlay)
  final double? width;                           // Container width
  final double? height;                          // Container height
  final BoxConstraints? constraints;             // Min/max width & height control
  final EdgeInsetsGeometry? margin;              // Space OUTSIDE the container
  final Matrix4? transform;                      // 2D/3D transformations (rotate, scale)
  final AlignmentGeometry? transformAlignment;   // Pivot point for transformation
  final Clip clipBehavior;                       // How to clip child overflow (none, hardEdge, antiAlias)

  const CommonContainer({
    super.key,
    this.child,                                  // Insert widget inside container
    this.alignment,                              // Position child (center, left, right)
    this.padding,                                // Inner spacing
    this.color,                                  // Background color only if no decoration color
    this.decoration,                             // BoxDecoration for styling
    this.foregroundDecoration,                   // Overlay decoration
    this.width,                                  // Set width of container
    this.height,                                 // Set height of container
    this.constraints,                            // Min/Max size rules
    this.margin,                                 // Outer spacing
    this.transform,                              // Apply rotation/scale/translation
    this.transformAlignment,                     // Pivot point of transform
    this.clipBehavior = Clip.none,               // Clip overflow content
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: alignment,                      // Apply alignment to child
      padding: padding,                          // Apply inner padding
      color: color,                              // Background color
      decoration: decoration,                    // Background + border + shadow style
      foregroundDecoration: foregroundDecoration,// Overlay decoration above child
      width: width,                              // Container width
      height: height,                            // Container height
      constraints: constraints,                  // Min/Max width & height
      margin: margin,                            // Outer margin
      transform: transform,                      // Apply matrix transformation
      transformAlignment: transformAlignment,    // Transform pivot
      clipBehavior: clipBehavior,                // Clip overflow if needed
      child: child,                              // Add child widget
    );
  }
}
