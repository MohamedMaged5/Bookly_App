part of 'featured_books_cubit.dart';

sealed class FeaturedBooksState extends Equatable {
  const FeaturedBooksState();

  @override
  List<Object> get props => [];
}

final class FeaturedBooksInitial extends FeaturedBooksState {}

final class FeaturedBooksLoading extends FeaturedBooksState {}

final class FeaturedBooksSuccess extends FeaturedBooksState {
  final BookModel books;

  const FeaturedBooksSuccess({required this.books});
}

final class FeaturedBooksFail extends FeaturedBooksState {
  final String errmessage;

  const FeaturedBooksFail({required this.errmessage});
}
