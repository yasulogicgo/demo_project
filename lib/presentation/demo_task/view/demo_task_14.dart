import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DemoTask14 extends StatefulWidget {
  const DemoTask14({super.key});

  @override
  State<DemoTask14> createState() => _DemoTask14State();
}

class _DemoTask14State extends State<DemoTask14>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _rotationAnimation;
  late Animation<Color?> _colorAnimation;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );

    /// Curved animation
    final curved = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOutBack,
      reverseCurve: Curves.easeIn,
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 1),
      end: Offset.zero,
    ).animate(curved);

    _rotationAnimation = Tween<double>(
      begin: -10 * pi / 180,
      end: 0,
    ).animate(curved);

    _colorAnimation = ColorTween(
      begin: Colors.transparent, // resolved in build via theme
      end: Colors.transparent,
    ).animate(curved);

    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeOut,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onTap() {
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Slide + Rotate + Color",
          style: theme.textTheme.titleMedium,
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            /// 🔘 ANIMATED BUTTON
            GestureDetector(
              onTap: _onTap,
              child: AnimatedBuilder(
                animation: _animation,
                builder: (context, child) {
                  return Container(
                    width: 220.w,
                    height: 55.h,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.r),
                      gradient: RadialGradient(
                        radius: _animation.value * 6.2,
                        colors: [
                          theme.colorScheme.surface,
                          theme.colorScheme.primary,
                        ],
                        stops: const [0.0, 0.6],
                      ),
                    ),
                    child: Text(
                      'CLICK ME',
                      style: theme.textTheme.labelLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: theme.colorScheme.onPrimary,
                      ),
                    ),
                  );
                },
              ),
            ),

            SizedBox(height: 30.h),

            /// 🧩 ANIMATED CARD
            AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                return SlideTransition(
                  position: _slideAnimation,
                  child: Transform.rotate(
                    angle: _rotationAnimation.value,
                    child: Container(
                      width: 260.w,
                      height: 140.h,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Color.lerp(
                          theme.colorScheme.secondary,
                          theme.colorScheme.primary,
                          _controller.value,
                        ),
                        borderRadius: BorderRadius.circular(20.r),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 10,
                            color: theme.shadowColor.withOpacity(0.25),
                          ),
                        ],
                      ),
                      child: Text(
                        "Welcome!",
                        style: theme.textTheme.headlineSmall?.copyWith(
                          color: theme.colorScheme.onPrimary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),

            SizedBox(height: 40.h),

            /// 🎮 CONTROL BUTTON
            ElevatedButton(
              onPressed: () {
                if (_controller.status == AnimationStatus.completed) {
                  _controller.reverse();
                } else {
                  _controller.forward();
                }
              },
              child: const Text("Play / Reverse"),
            ),
          ],
        ),
      ),
    );
  }
}
