import 'package:bookly_app/core/utils/styles.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/book_ratting.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/books_action.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/custom_book_image.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/custome_book_details_app_bar.dart';
import 'package:flutter/material.dart';

class BookDetailsSection extends StatelessWidget {
  const BookDetailsSection({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return Column(
      children: [
        CustomBookDetailsAppBar(),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.2),
          child: CustomBookImage(
            imgUrl: "https://imgs.search.brave.com/5mjwXImTtN3_TrQ0m87bNDORjsT5oPTzhjkkmMluBcY/rs:fit:500:0:0:0/g:ce/aHR0cHM6Ly9pbWcu/ZnJlZXBpay5jb20v/ZnJlZS1waG90by9j/cmVhdGl2ZS1hc3Nv/cnRtZW50LXdpdGgt/ZGlmZmVyZW50LWJv/b2tzXzIzLTIxNDg4/NTEwMjAuanBnP3Nl/bXQ9YWlzX2h5YnJp/ZCZ3PTc0MA",
          ), // for image
        ),
        SizedBox(height: 43),
        Text(
          "The Jungle Book",
          style: Styles.textStyles30.copyWith(fontWeight: FontWeight.normal),
        ),
        const SizedBox(height: 6),
        Opacity(
          opacity: 0.7,
          child: Text(
            "Rudyard Kipling",
            style: Styles.textStyles18.copyWith(
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        const SizedBox(height: 18),
        BookRatting(mainAxisAlignment: MainAxisAlignment.center , count: 10,),
        const SizedBox(height: 37),
        BooksAction(),
      ],
    );
  }
}

