import 'package:bookly_app/core/utils/styles.dart';
import 'package:bookly_app/features/search/presentation/views/widgets/custom_search_text_feild.dart';
import 'package:flutter/material.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomSearchTextFeild(),
          const SizedBox(height: 16),
          Text("Search Result", style: Styles.textStyles18),
          const SizedBox(height: 16),
          Expanded(child: 
          SearchResultListView()),
        ],
      ),
    );
  }
}

class SearchResultListView extends StatelessWidget {
  const SearchResultListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      itemBuilder: ((context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
        //  child: BookListViewItem(),
        );
      }),
      itemCount: 10,
    );
  }
}
