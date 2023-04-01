import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:login_app/utils/text_style.dart';

class PrimaryButton extends StatelessWidget {
  final VoidCallback? function;
  Color foregroundColor;
  Color backgroundColor;

  String title;
  PrimaryButton({
    super.key,
    this.function,
    required this.foregroundColor,
    required this.backgroundColor,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
        onPressed: function,
        style: ButtonStyle(
          splashFactory: NoSplash.splashFactory,
          shadowColor: MaterialStateProperty.all<Color>(Colors.transparent),
          foregroundColor: MaterialStateProperty.all<Color>(foregroundColor),
          backgroundColor: MaterialStateProperty.all<Color>(backgroundColor),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24.0),
            ),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(14.0),
          child: Text(
            title,
          ),
        ),
      ),
    );
  }
}
