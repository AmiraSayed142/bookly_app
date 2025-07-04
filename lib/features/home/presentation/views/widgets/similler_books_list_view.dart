import 'package:bookly_app/core/widgets/custome_error_msg.dart';
import 'package:bookly_app/core/widgets/custome_loading_indecator.dart';
import 'package:bookly_app/features/home/presentation/manager/similar_books_cubit/similar_books_cubit.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/custom_book_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SimilarBooksListView extends StatelessWidget {
  const SimilarBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SimilarBooksCubit, SimilarBooksState>(
      builder: (context, state) {
        if (state is SimilarBooksSuccess) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * .15,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: CustomBookImage(
                    imgUrl:
                        "https://imgs.search.brave.com/8tkFTScVxKWirAuvAF-tlLT3oTc8cW28uGcs0E22dbQ/rs:fit:500:0:0:0/g:ce/aHR0cHM6Ly9pLnBp/bmltZy5jb20vb3Jp/Z2luYWxzLzdhL2Rh/L2YwLzdhZGFmMDNh/YmRiMDMzNzYxNzZj/YTg3ODkyZmE1OWMx/LmpwZw",
                  ),
                );
              },
            ),
          );
        } else if (state is SimilarBooksFailure) {
          return CustomeErrorMsg(errorMsg: state.errorMsg);
        } else {
          return CustomeLoadingIndecator();
        }
      },
    );
  }
}
