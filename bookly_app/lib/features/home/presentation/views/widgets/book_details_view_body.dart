import 'package:bookly_app/core/widgets/custom_button.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/book_cover.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/custom_appbar_bookdetails.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/labed_details_comp.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/similar_books_listview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

class BookDetailsViewBody extends StatelessWidget {
  final String? imgURL;
  final String? title;
  final String? author;
  final String? genre;
  final String? lang;
  final String? description;
  final int? pages;
  final String? readTheBook;
  const BookDetailsViewBody(
      {super.key,
      this.imgURL,
      this.title,
      this.author,
      this.genre,
      this.lang,
      this.pages,
      this.description,
      this.readTheBook});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Padding(
            padding: EdgeInsets.only(
                left: 20.w, right: 20.w, top: 10.h, bottom: 30.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const CustomAppBarBookDetails(),
                SizedBox(height: 27.h),
                BookCover(
                    imageURL: imgURL ??
                        "https://images-na.ssl-images-amazon.com/images/I/51ZQj5jJNHL._SX331_BO1,204,203,200_.jpg",
                    height: 262.h,
                    width: 192.w),
                SizedBox(height: 30.h),
                Text(
                  title ?? "Unknown",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 27.sp,
                      color: Colors.white,
                      fontWeight: FontWeight.w400),
                ),
                SizedBox(height: 3.h),
                Text(author ?? "Unknown",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 18.sp,
                        color: Colors.grey,
                        fontWeight: FontWeight.w400)),
                SizedBox(height: 15.h),
                LabelDetailsComp(
                  mainAxisAlignment: MainAxisAlignment.center,
                  labelDetail: genre,
                  label: "Genre",
                  color: Colors.cyan,
                ),
                SizedBox(height: 5.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    LabelDetailsComp(
                      label: "Lang",
                      labelDetail: lang,
                      color: Colors.yellow,
                      mainAxisAlignment: MainAxisAlignment.center,
                    ),
                    SizedBox(width: 10.w),
                    LabelDetailsComp(
                      label: "Pages",
                      labelDetail: pages.toString(),
                      color: Colors.green,
                      mainAxisAlignment: MainAxisAlignment.center,
                    ),
                  ],
                ),
                SizedBox(height: 30.h),
                CustomButton(
                  onPressed: () async {
                    Uri uri = Uri.parse(readTheBook ?? "");
                    if (readTheBook != null && readTheBook != "") {
                      if (await canLaunchUrl(uri)) {
                        await launchUrl(uri);
                      }
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text("The book is not available"),
                      ));
                    }
                  },
                  child: Text("Read the book",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w600)),
                ),
                SizedBox(height: 30.h),
                Text(
                  description ?? "No description available",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400),
                ),
                Expanded(child: SizedBox(height: 30.h)),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "You can also like",
                    style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                        fontFamily: "Montserrat-SemiBold"),
                  ),
                ),
                SizedBox(height: 12.h),
                const SimilarBooksListview(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
