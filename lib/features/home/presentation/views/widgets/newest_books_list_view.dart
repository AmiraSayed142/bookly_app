import 'package:bookly_app/core/widgets/custome_error_msg.dart';
import 'package:bookly_app/core/widgets/custome_loading_indecator.dart';
import 'package:bookly_app/features/home/presentation/manager/newest_books_cubit/cubit/newest_books_cubit.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/newest_books_list_view_item.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewestBooksListView extends StatelessWidget {
  const NewestBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewestBooksCubit, NewestBooksState>(
      builder: (context, state) {
        if (state is NewestBooksSucces) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              padding: EdgeInsets.zero,
              itemBuilder: ((context, index) {
                return Padding(
                  padding:const EdgeInsets.symmetric(vertical: 10),
                  child: NewestBookListViewItem(bookModel: state.books[index]),
                );
              }),
              itemCount: state.books.length,
            ),
          );
        } else if (state is NewestBooksFailure) {
          return CustomeErrorMsg(errorMsg: state.errorMessage);
        } else {
          return CustomeLoadingIndecator();
        }
      },
    );
  }
}
