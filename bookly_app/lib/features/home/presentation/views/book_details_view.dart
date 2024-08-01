import 'package:bookly_app/core/utils/service_locator.dart';
import 'package:bookly_app/features/home/data/repos/home_repo_impl.dart';
import 'package:bookly_app/features/home/presentation/view_models/similar_books_cubit/similar_books_cubit.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/book_details_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookDetailsView extends StatelessWidget {
  final String cate;
  final String? imgURL;
  final String? title;
  final String? author;
  final String? genre;
  final String? lang;
  final String? description;
  final int? pages;
  final String? readTheBook;
  const BookDetailsView(
      {super.key,
      required this.cate,
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
    return SafeArea(
      child: BlocProvider(
        create: (context) => SimilarBooksCubit(getIt.get<HomeRepoImpl>())
          ..fetchSimilarBooks(cate: cate),
        child: Scaffold(
          body: BookDetailsViewBody(
            author: author,
            genre: genre,
            imgURL: imgURL,
            lang: lang,
            title: title,
            pages: pages,
            description: description,
            readTheBook: readTheBook,
          ),
        ),
      ),
    );
  }
}
