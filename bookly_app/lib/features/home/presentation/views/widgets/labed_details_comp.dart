import 'package:bookly_app/features/home/presentation/views/widgets/labeled_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LabelDetailsComp extends StatelessWidget {
  final String label;
  final String? labelDetail;
  final MainAxisAlignment mainAxisAlignment;
  final Color? color;
  final TextOverflow? overflow;
  const LabelDetailsComp(
      {super.key,
      this.labelDetail,
      required this.mainAxisAlignment,
      this.color,
      required this.label,
      this.overflow});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      children: [
        LabeledContainer(
          label: label,
          color: color,
        ),
        SizedBox(
          width: 4.w,
        ),
        Text(labelDetail ?? "unknown",
            overflow: overflow,
            maxLines: 1,
            style: TextStyle(
                color: Colors.white,
                fontSize: 15.sp,
                fontWeight: FontWeight.w700)),
      ],
    );
  }
}
