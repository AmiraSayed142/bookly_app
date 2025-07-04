import 'package:bookly_app/core/widgets/custome_error_msg.dart';
import 'package:bookly_app/features/home/presentation/manager/featured_books_cubit/featured_books_cubit_cubit.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/custom_book_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FeaturedBookesListView extends StatelessWidget {
  const FeaturedBookesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedBooksCubit, FeaturedBooksState>(
      builder: (context, state) {
        if (state is FeaturedBooksSuccessState) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * .28,
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: state.books.length,
              itemBuilder: (context, index) {
                return Padding( 
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: CustomBookImage(
                    imgUrl: state.books[index].volumeInfo.imageLinks.thumbnail,                      
                  ),
                );
              },
            ),
          );
        } else if (state is FeaturedBooksFailureState) {
          return CustomeErrorMsg(errorMsg: state.errorMessage);
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
