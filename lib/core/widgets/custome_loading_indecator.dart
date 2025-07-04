import 'package:flutter/material.dart';

class CustomeLoadingIndecator extends StatelessWidget {
  const CustomeLoadingIndecator({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
         child: CircularProgressIndicator(),
    );
  }
}