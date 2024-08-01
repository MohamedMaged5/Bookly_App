import 'package:bookly_app/core/widgets/custom_error_widget.dart';
import 'package:bookly_app/core/widgets/custom_loading_indicator.dart';
import 'package:bookly_app/features/search/presentation/view_models/search_books_cubit/search_books_cubit.dart';
import 'package:bookly_app/features/home/presentation/views/book_details_view.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/books_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchResaultListview extends StatelessWidget {
  const SearchResaultListview({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBooksCubit, SearchBooksState>(
      builder: (context, state) {
        if (state is SearchBooksInitial) {
          return Center(
            child: Text(
              'Search for a book',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w600),
            ),
          );
        } else if (state is SearchBooksSuccess) {
          return ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: state.books.items?.length ?? 0,
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
                        .books.items?[index].volumeInfo?.imageLinks?.thumbnail,
                    title: state.books.items?[index].volumeInfo?.title,
                    genre: state.books.items?[index].volumeInfo?.categories?[0],
                    author: state.books.items?[index].volumeInfo?.authors?[0],
                    lang: state.books.items?[index].volumeInfo?.language,
                  ),
                );
              });
        } else if (state is SearchBooksFail) {
          return Center(
            child: CustomErrorWidget(
              errmessage: state.errmessage,
            ),
          );
        } else {
          return const Center(
            child: CustomLoadingIndicator(),
          );
        }
      },
    );
  }
}
