import 'package:bookly_app/core/widgets/custom_error_widget.dart';
import 'package:bookly_app/core/widgets/custom_loading_indicator.dart';
import 'package:bookly_app/features/home/presentation/view_models/newest_books_cubit/newest_books_cubit.dart';
import 'package:bookly_app/features/home/presentation/views/book_details_view.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/books_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NewestBooksListview extends StatelessWidget {
  const NewestBooksListview({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewestBooksCubit, NewestBooksState>(
      builder: (context, state) {
        if (state is NewestBooksSuccess) {
          return ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            physics: const NeverScrollableScrollPhysics(),
            itemCount: state.books.items!.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.symmetric(vertical: 4.h),
                child: BookListItem(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return BookDetailsView(
                          cate: state.books.items?[index].volumeInfo
                                  ?.categories?[0] ??
                              "fiction",
                          author:
                              state.books.items?[index].volumeInfo?.authors?[0],
                          genre: state
                              .books.items?[index].volumeInfo?.categories?[0],
                          imgURL: state.books.items?[index].volumeInfo
                              ?.imageLinks?.thumbnail,
                          lang: state.books.items?[index].volumeInfo?.language,
                          title: state.books.items?[index].volumeInfo?.title,
                          pages:
                              state.books.items?[index].volumeInfo?.pageCount,
                          description:
                              state.books.items?[index].volumeInfo?.description,
                          readTheBook:
                              state.books.items?[index].volumeInfo?.previewLink,
                        );
                      },
                    ));
                  },
                  imageURL: state
                      .books.items?[index].volumeInfo?.imageLinks?.thumbnail,
                  title: state.books.items?[index].volumeInfo?.title,
                  genre: state.books.items?[index].volumeInfo?.categories?[0],
                  author: state.books.items?[index].volumeInfo?.authors?[0],
                  lang: state.books.items?[index].volumeInfo?.language,
                ),
              );
            },
          );
        } else if (state is NewestBooksFail) {
          return Align(
              alignment: const Alignment(0, -0.6),
              child: CustomErrorWidget(errmessage: state.errmessage));
        } else {
          return const Align(
              alignment: Alignment(0, -0.6), child: CustomLoadingIndicator());
        }
      },
    );
  }
}
