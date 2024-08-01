import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FadedText extends StatelessWidget {
  final Animation<double> fadeAnimation;
  const FadedText({super.key, required this.fadeAnimation});

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: fadeAnimation,
      builder: (context, _) {
        return FadeTransition(
          opacity: fadeAnimation,
          child: Text(
            "Free Books",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20.sp, color: Colors.white),
          ),
        );
      },
    );
  }
}
