import 'package:flutter/material.dart';

class CommonImage extends StatelessWidget {
  // ---------------------------
  // MAIN REQUIRED PROPERTIES
  // ---------------------------
  final String src; // Image path or asset name
  final double? width; // Image width
  final double? height; // Image height
  final BoxFit? fit; // How the image should fit inside its box
  final Color? color; // Apply color filter on image
  final AlignmentGeometry alignment; // Alignment inside its box
  final ImageProvider<Object>? imageProvider; // Replace asset with NetworkImage / FileImage

  // ---------------------------
  // FULL IMAGE PARAMETERS
  // ---------------------------
  final Rect? centerSlice; // Used for 9-slice scaling (stretch middle area)
  final BlendMode? colorBlendMode; // Blend mode for color filter
  final ImageErrorWidgetBuilder? errorBuilder; // Show UI when image fails to load
  final bool? excludeFromSemantics; // Remove from accessibility semantics
  final FilterQuality? filterQuality; // Image rendering quality
  final ImageFrameBuilder? frameBuilder; // Custom animation for each image frame
  final bool? gaplessPlayback; // Keep old image while new one loads
  final bool? isAntiAlias; // Smooth edges (costs performance)
  final ImageLoadingBuilder? loadingBuilder; // Loading progress builder
  final bool? matchTextDirection; // Flip image in RTL languages
  final Animation<double>? opacity; // Animate image opacity
  final ImageRepeat? repeat; // Repeat image (x/y)
  final String? semanticLabel; // Accessibility label

  const CommonImage({
    super.key,
    required this.src,
    this.width,
    this.height,
    this.fit,
    this.color,
    this.alignment = Alignment.center,
    this.imageProvider,

    // full params
    this.centerSlice,
    this.colorBlendMode,
    this.errorBuilder,
    this.excludeFromSemantics,
    this.filterQuality,
    this.frameBuilder,
    this.gaplessPlayback,
    this.isAntiAlias,
    this.loadingBuilder,
    this.matchTextDirection,
    this.opacity,
    this.repeat,
    this.semanticLabel,
  });

  @override
  Widget build(BuildContext context) {
    return Image(
      image: imageProvider ?? AssetImage(src), // use custom provider or asset

      width: width, // width of image
      height: height, // height of image
      fit: fit, // scale behavior
      color: color, // apply color filter
      alignment: alignment, // image alignment

      centerSlice: centerSlice, // used for scalable backgrounds
      colorBlendMode: colorBlendMode, // blend color and image
      errorBuilder: errorBuilder, // custom error widget
      excludeFromSemantics: excludeFromSemantics ?? false, // accessibility removal
      filterQuality: filterQuality ?? FilterQuality.low, // rendering quality
      frameBuilder: frameBuilder, // custom frame animation
      gaplessPlayback: gaplessPlayback ?? false, // previous image stays until new loads
      isAntiAlias: isAntiAlias ?? false, // smoother edges
      loadingBuilder: loadingBuilder, // show loading UI
      matchTextDirection: matchTextDirection ?? false, // RTL mirror image
      opacity: opacity, // opacity animation controller
      repeat: repeat ?? ImageRepeat.noRepeat, // repeat x/y
      semanticLabel: semanticLabel, // screen reader label
    );
  }
}
