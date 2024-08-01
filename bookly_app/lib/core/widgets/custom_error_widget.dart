import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomErrorWidget extends StatelessWidget {
  final String errmessage;
  const CustomErrorWidget({
    super.key,
    required this.errmessage,
  });

  @override
  Widget build(BuildContext context) {
    return Text(errmessage,
        style: TextStyle(
            color: Colors.white, fontSize: 15.sp, fontWeight: FontWeight.bold));
  }
}
