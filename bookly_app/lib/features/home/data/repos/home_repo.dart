import 'package:bookly_app/core/errors/failure.dart';
import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo {
  Future<Either<Failure, BookModel>> fetchFeaturedBooks();
  Future<Either<Failure, BookModel>> fetchNewestBooks();
  Future<Either<Failure, BookModel>> fetchSimilarBooks(
      {required String category});
  Future<Either<Failure, BookModel>> fetchSearchBooks(
      {required String bookTitle});
}
