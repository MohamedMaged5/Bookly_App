part of 'similar_books_cubit.dart';

sealed class SimilarBooksState extends Equatable {
  const SimilarBooksState();

  @override
  List<Object> get props => [];
}

final class SimilarBooksInitial extends SimilarBooksState {}

final class SimilarBooksLoading extends SimilarBooksState {}

final class SimilarBooksSuccess extends SimilarBooksState {
  final BookModel books;

  const SimilarBooksSuccess({required this.books});
}

final class SimilarBooksFail extends SimilarBooksState {
  final String errmessage;

  const SimilarBooksFail({required this.errmessage});
}
