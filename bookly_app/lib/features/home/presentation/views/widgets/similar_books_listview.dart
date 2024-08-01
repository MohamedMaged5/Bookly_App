import 'package:bookly_app/core/widgets/custom_error_widget.dart';
import 'package:bookly_app/core/widgets/custom_loading_indicator.dart';
import 'package:bookly_app/features/home/presentation/view_models/similar_books_cubit/similar_books_cubit.dart';
import 'package:bookly_app/features/home/presentation/views/book_details_view.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/book_cover.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SimilarBooksListview extends StatelessWidget {
  const SimilarBooksListview({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SimilarBooksCubit, SimilarBooksState>(
      builder: (context, state) {
        if (state is SimilarBooksSuccess) {
          return SizedBox(
            height: 150.h,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: state.books.items?.length ?? 0,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 4.w),
                  child: BookCover(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return BookDetailsView(
                            cate: state.books.items?[index].volumeInfo
                                    ?.categories?[0] ??
                                "fiction",
                            author: state
                                .books.items?[index].volumeInfo?.authors?[0],
                            genre: state
                                .books.items?[index].volumeInfo?.categories?[0],
                            imgURL: state.books.items?[index].volumeInfo
                                ?.imageLinks?.thumbnail,
                            lang:
                                state.books.items?[index].volumeInfo?.language,
                            title: state.books.items?[index].volumeInfo?.title,
                            pages:
                                state.books.items?[index].volumeInfo?.pageCount,
                            description: state
                                .books.items?[index].volumeInfo?.description,
                            readTheBook: state
                                .books.items?[index].volumeInfo?.previewLink,
                          );
                        },
                      ));
                    },
                    imageURL: state
                        .books.items![index].volumeInfo!.imageLinks!.thumbnail!,
                    height: 150.h,
                    width: 100.w,
                  ),
                );
              },
            ),
          );
        } else if (state is SimilarBooksFail) {
          return CustomErrorWidget(errmessage: state.errmessage);
        } else {
          return const CustomLoadingIndicator();
        }
      },
    );
  }
}
