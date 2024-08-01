import 'package:bookly_app/core/errors/failure.dart';
import 'package:bookly_app/core/utils/api_service.dart';
import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/features/home/data/repos/home_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeRepoImpl implements HomeRepo {
  final ApiService apiService;
  HomeRepoImpl(this.apiService);
  @override
  Future<Either<Failure, BookModel>> fetchNewestBooks() async {
    try {
      var data = await apiService.get(
          endpoint:
              "volumes?q=subject:science&filter=free-ebooks&orderBy=newest&langRestrict=en");
      return Right(BookModel.fromJson(data));
    } on Exception catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      }
      return Left(ServerFailure(errmessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, BookModel>> fetchFeaturedBooks() async {
    try {
      var data = await apiService.get(
          endpoint:
              "volumes?q=subject:nature&filter=free-ebooks&langRestrict=en");
      return Right(BookModel.fromJson(data));
    } on Exception catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      }
      return Left(ServerFailure(errmessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, BookModel>> fetchSimilarBooks(
      {required String category}) async {
    try {
      var data = await apiService.get(
          endpoint:
              "volumes?q=subject:$category&filter=free-ebooks&orderBy=relevance&langRestrict=en");
      return Right(BookModel.fromJson(data));
    } on Exception catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      }
      return Left(ServerFailure(errmessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, BookModel>> fetchSearchBooks(
      {required String bookTitle}) async {
    try {
      var data = await apiService.get(endpoint: "volumes?q=intitle:$bookTitle");
      return Right(BookModel.fromJson(data));
    } on Exception catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      }
      return Left(ServerFailure(errmessage: e.toString()));
    }
  }
}
