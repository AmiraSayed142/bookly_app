// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:bookly_app/features/home/data/home_repo/home_repo.dart';
import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:equatable/equatable.dart';

part 'newest_books_state.dart';

class NewestBooksCubit extends Cubit<NewestBooksState> {
  NewestBooksCubit(this.homeRepo) : super(NewestBooksInitial());

  final HomeRepo homeRepo;
  Future<void> fethedNewestBooks() async {
    emit(NewestBooksLoading());
    var result = await homeRepo.fetchNewestBooks();
    result.fold(
      (failure) {
        emit(NewestBooksFailure(failure.errorMessage));
      },
      (books) {
        emit(NewestBooksSucces(books));
      },
    );
  }
}
