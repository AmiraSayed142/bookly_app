import 'package:bookly_app/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BookRatting extends StatelessWidget {
  const BookRatting({
    super.key,
    this.mainAxisAlignment = MainAxisAlignment.start, required this.count,
  });
  final MainAxisAlignment mainAxisAlignment;
  final int count;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      children: [
        Icon(FontAwesomeIcons.solidStar, color: Color(0xffFFDD4F), size: 14),
        const SizedBox(width: 6.3),
        Text("4.7", style: Styles.textStyles16),
        const SizedBox(width: 5),
        Opacity(
          opacity: 0.7,
          child: Text( count.toString(), style: Styles.textStyles14.copyWith()),
        ),
      ],
    );
  }
}
