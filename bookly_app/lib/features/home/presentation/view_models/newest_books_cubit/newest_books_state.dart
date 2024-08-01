part of 'newest_books_cubit.dart';

sealed class NewestBooksState extends Equatable {
  const NewestBooksState();

  @override
  List<Object> get props => [];
}

final class NewestBooksInitial extends NewestBooksState {}

final class NewestBooksLoading extends NewestBooksState {}

final class NewestBooksSuccess extends NewestBooksState {
  final BookModel books;

  const NewestBooksSuccess({required this.books});
}

final class NewestBooksFail extends NewestBooksState {
  final String errmessage;

  const NewestBooksFail({required this.errmessage});
}
