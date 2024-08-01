import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LabeledContainer extends StatelessWidget {
  final Color? color;
  final String label;
  const LabeledContainer({super.key, this.color, required this.label});
//const Color(0xffEF8262)
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50.w,
      height: 20.h,
      decoration: BoxDecoration(
          color: color, borderRadius: BorderRadius.circular(10.r)),
      child: Text(label,
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Colors.black,
              fontSize: 14.sp,
              fontWeight: FontWeight.w700)),
    );
  }
}
