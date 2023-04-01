import 'package:flutter/material.dart';
import 'package:login_app/utils/text_style.dart';

class MySnackBar {
  mySnackBarWidget({
    required String textToShow,
    required BuildContext context,
  }) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(textToShow, style: AppFonts.w400white14),
        backgroundColor: Color.fromARGB(255, 53, 53, 53),
      ),
    );
  }
}
