import 'package:flutter/material.dart';

class StrokeTextField extends StatelessWidget {
  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final double strokeWidth;
  final Color textColor;
  final Color strokeColor;
  final TextAlign textAlign;
  final int maxLines;

  const StrokeTextField({
    super.key,
    required this.text,
    this.fontSize = 15.0,
    this.fontWeight = FontWeight.w500,
    this.strokeWidth = 2,
    this.textColor = Colors.white,
    this.strokeColor = Colors.black,
    this.textAlign = TextAlign.center,
    this.maxLines = 2,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Text(
          text,
          maxLines: maxLines,
          textAlign: textAlign,
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                fontSize: fontSize,
                fontWeight: fontWeight,
                foreground: Paint()
                  ..style = PaintingStyle.stroke
                  ..strokeWidth = strokeWidth
                  ..color = strokeColor,
                overflow: TextOverflow.ellipsis,
              ),
        ),
        Text(
          text,
          maxLines: maxLines,
          textAlign: textAlign,
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                fontSize: fontSize,
                fontWeight: fontWeight,
                color: textColor,
                overflow: TextOverflow.ellipsis,
              ),
        ),
      ],
    );
  }
}
