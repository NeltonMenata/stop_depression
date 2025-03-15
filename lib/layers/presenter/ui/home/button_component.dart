import 'package:flutter/material.dart';

class ButtonComponent extends StatelessWidget {
  const ButtonComponent(
      {super.key,
      this.urlImage = "assets/images/quiz.png",
      this.height = 100,
      this.multiWidth = .36,
      this.fontSize = 14.0,
      this.title = "",
      this.action});

  final String urlImage;
  final double height;
  final double multiWidth;
  final double fontSize;
  final String title;
  final VoidCallback? action;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;

    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        TextButton(
          onPressed: action,
          child: SizedBox(
            height: height,
            width: width * multiWidth,
            child: Image.asset(
              urlImage,
              fit: BoxFit.fitHeight,
            ),
          ),
        ),
        Text(
          title,
          style: TextStyle(
            color: Colors.white,
            fontSize: fontSize,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
