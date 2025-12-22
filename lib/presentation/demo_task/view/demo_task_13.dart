
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class DemoTask13 extends StatefulWidget {
  const DemoTask13({super.key});

  @override
  State<DemoTask13> createState() => _DemoTask13State();
}

class _DemoTask13State extends State<DemoTask13> {
  bool isBig = false;
  bool isVisible = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(),
      body: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedContainer(
                duration: const Duration(seconds: 1),
                width: isBig ? 200.w : 100.w,
                height: isBig ? 200.h : 100.h,
                color: isBig
                    ? theme.colorScheme.primary
                    : theme.colorScheme.secondary,
              ),

              ElevatedButton(
                onPressed: () => setState(() => isBig = !isBig),
                child: const Text("Animate"),
              ),

              AnimatedOpacity(
                opacity: isVisible ? 1 : 0,
                duration: const Duration(milliseconds: 300),
                child: Text(
                  "Hello Flutter",
                  style: theme.textTheme.headlineSmall,
                ),
              ),

              ElevatedButton(
                onPressed: () => setState(() => isVisible = !isVisible),
                child: const Text("Fade"),
              ),
              AnimatedAddToCartButton(),
            ],
          ),
        ),
      ),
    );
  }
}


class AnimatedAddToCartButton extends StatefulWidget {
  const AnimatedAddToCartButton({super.key});

  @override
  State<AnimatedAddToCartButton> createState() =>
      _AnimatedAddToCartButtonState();
}

class _AnimatedAddToCartButtonState extends State<AnimatedAddToCartButton> {
  bool isAdded = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return GestureDetector(
      onTap: () => setState(() => isAdded = !isAdded),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 400),
        curve: Curves.fastEaseInToSlowEaseOut,
        width: isAdded ? 60.w : 200.w,
        height: 50.h,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: isAdded
              ? theme.colorScheme.primary
              : theme.colorScheme.secondary,
          borderRadius: BorderRadius.circular(30.r),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            AnimatedOpacity(
              opacity: isAdded ? 0.0 : 1.0,
              duration: const Duration(milliseconds: 200),
              child: Text(
                "Add to Cart",
                style: theme.textTheme.labelLarge?.copyWith(
                  color: theme.colorScheme.onPrimary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            AnimatedOpacity(
              opacity: isAdded ? 1.0 : 0.0,
              duration: const Duration(milliseconds: 300),
              child: Icon(
                Icons.check,
                color: theme.colorScheme.onPrimary,
                size: 28.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }
}