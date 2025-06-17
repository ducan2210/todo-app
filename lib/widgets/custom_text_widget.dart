import 'package:flutter/material.dart';
import 'package:todo_app/configs/app_color_config.dart';
import 'package:todo_app/constants/app_localizations.dart';

class CustomTextWidget extends StatefulWidget {
  final String text;
  final TextStyle? style;
  final int? maxLines;
  final FontWeight? fontWeight;
  final double? fontSize;
  final TextAlign? textAlign;
  final TextOverflow? overflow;
  final Color? color;
  final String? fontFamily;
  final bool isUpperCase;

  const CustomTextWidget({
    required this.text,
    super.key,
    this.style,
    this.maxLines,
    this.textAlign = TextAlign.center,
    this.overflow,
    this.isUpperCase = false,
    this.fontWeight = FontWeight.normal,
    this.fontSize = 14,
    this.color = AppColorConfig.white,
    this.fontFamily = 'Lato',
  });

  @override
  _CustomTextWidgetState createState() => _CustomTextWidgetState();
}

class _CustomTextWidgetState extends State<CustomTextWidget> {
  @override
  Widget build(BuildContext context) {
    String translatedText = AppLocalizations.of(context).translate(widget.text);

    // Nếu `isUpperCase` là `true`, thì chuyển thành chữ in hoa
    if (widget.isUpperCase) {
      translatedText = translatedText.toUpperCase();
    }

    return Text(
      translatedText,
      style: TextStyle(
        fontSize: widget.fontSize,
        fontWeight: widget.fontWeight,
        color: widget.color,
        fontFamily: widget.fontFamily,
      ),
      maxLines: widget.maxLines,
      textAlign: widget.textAlign,
      overflow: widget.overflow,
    );
  }
}
