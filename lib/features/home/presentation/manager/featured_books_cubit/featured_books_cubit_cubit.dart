// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:bookly_app/features/home/data/home_repo/home_repo.dart';
import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:equatable/equatable.dart';

part 'featured_books_cubit_state.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBooksState> {
  FeaturedBooksCubit(this.homeRepo) : super(FeaturedBooksInitialState());

  final HomeRepo homeRepo;

  Future<void> fetchFeaturedBooks() async {
    emit(FeaturedBooksLoadingState());
    var result = await homeRepo.fetchFeaturedBooks();
    result.fold(
      (failure) {
        emit(
          FeaturedBooksFailureState.featuredBooksFailureState(
            failure.errorMessage,
          ),
        );
      },
      (books) {
        emit(FeaturedBooksSuccessState(books));
      },
    );
  }
}
