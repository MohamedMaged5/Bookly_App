import 'package:bloc/bloc.dart';
import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/features/home/data/repos/home_repo.dart';
import 'package:equatable/equatable.dart';

part 'search_books_state.dart';

class SearchBooksCubit extends Cubit<SearchBooksState> {
  SearchBooksCubit(this.homeRepo) : super(SearchBooksInitial());

  final HomeRepo homeRepo;
  Future<void> fetchSearchBooks({required String booktitle}) async {
    emit(SearchBooksLoading());
    var result = await homeRepo.fetchSearchBooks(bookTitle: booktitle);
    result.fold((failure) {
      emit(SearchBooksFail(errmessage: failure.errmessage));
    }, (books) {
      emit(SearchBooksSuccess(books: books));
    });
  }
}
