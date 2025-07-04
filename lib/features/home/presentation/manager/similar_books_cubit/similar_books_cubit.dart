import 'package:bloc/bloc.dart';
import 'package:bookly_app/features/home/data/home_repo/home_repo.dart';
import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:equatable/equatable.dart';

part 'similar_books_state.dart';

class SimilarBooksCubit extends Cubit<SimilarBooksState> {
  SimilarBooksCubit(this.homeRepo) : super(SimilarBooksInitial());
  final HomeRepo homeRepo;
  Future<void> fethedSimilarBooks({required final String category}) async {
    emit(SimilarBooksLoding());
    var result = await homeRepo.fetchSimilarBooks(category: category);
    result.fold(
      (failure) {
        emit(SimilarBooksFailure(failure.errorMessage));
      },
      (books) {
        emit(SimilarBooksSuccess(books));
      },
    );
  }
}
