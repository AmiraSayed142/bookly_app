import 'package:bookly_app/core/utils/styles.dart';
import 'package:flutter/material.dart';

class CustomeErrorMsg extends StatelessWidget {
  const CustomeErrorMsg({super.key, required this.errorMsg});
  final String errorMsg;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        
        errorMsg,
        textAlign: TextAlign.center,
        style: Styles.textStyles18,
      ),
    );
  }
}
