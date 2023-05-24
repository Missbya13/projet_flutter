import 'package:flutter/material.dart';

class HomeScreenText extends StatelessWidget {
  const HomeScreenText({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 42,
        decoration: TextDecoration.underline,
        decorationThickness: .3,
      ),
    );
  }
}
