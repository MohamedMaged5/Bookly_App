import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BookCover extends StatelessWidget {
  final double height;
  final double width;
  final String imageURL;
  final Function()? onTap;
  const BookCover(
      {super.key,
      required this.height,
      required this.width,
      required this.imageURL,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        height: height,
        width: width,
        child: CachedNetworkImage(
          imageBuilder: (context, imageProvider) => Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.r),
              image: DecorationImage(
                image: imageProvider,
                fit: BoxFit.fill,
              ),
            ),
          ),
          imageUrl: imageURL,
          errorWidget: (context, url, error) => Icon(
            Icons.error,
            size: 50.r,
          ),
        ),
      ),
    );
  }
}
