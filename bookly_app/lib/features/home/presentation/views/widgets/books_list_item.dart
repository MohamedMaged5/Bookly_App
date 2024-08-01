import 'package:bookly_app/features/home/presentation/views/widgets/book_cover.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/labed_details_comp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BookListItem extends StatelessWidget {
  final String? title;
  final String? imageURL;
  final String? genre;
  final String? author;
  final String? lang;
  final Function()? onTap;
  const BookListItem(
      {super.key,
      this.title,
      this.imageURL,
      this.genre,
      this.author,
      this.lang,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          BookCover(
            imageURL: imageURL ?? "",
            height: 120.h,
            width: 78.w,
          ),
          SizedBox(
            width: 20.w,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title ?? "unknown",
                  softWrap: true,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 19.sp,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                ),
                Text(author ?? "unknown",
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                    )),
                SizedBox(height: 6.h),
                LabelDetailsComp(
                  label: "Genre",
                  labelDetail: genre,
                  color: Colors.cyan,
                  overflow: TextOverflow.ellipsis,
                  mainAxisAlignment: MainAxisAlignment.start,
                ),
                SizedBox(
                  height: 4.h,
                ),
                LabelDetailsComp(
                  label: "Lang",
                  labelDetail: lang,
                  color: Colors.yellow,
                  mainAxisAlignment: MainAxisAlignment.start,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
