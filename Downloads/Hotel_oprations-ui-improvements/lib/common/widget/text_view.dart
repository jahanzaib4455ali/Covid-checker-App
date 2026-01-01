import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class TextView extends StatelessWidget {
  final String text;
  final int? maxLine;
  final TextAlign textAlign;
  final Alignment? alignment;
  final TextStyle? style;
  final double? textScaleFactor;
  final EdgeInsets padding;
  final Function()? onTap;
  final TextOverflow overflow;
  final double? width;
  final WidgetStateProperty<Color>? overlayColor;
  final int? maxLines;
  final bool? softWrap;

  @override
  const TextView(
    this.text, {
    super.key,
    this.maxLine,
    this.textScaleFactor,
    this.textAlign = TextAlign.start,
    this.padding = EdgeInsets.zero,
    this.overflow = TextOverflow.visible,
    this.onTap,
    this.style,
    this.width,
    this.overlayColor,
    this.alignment,
    this.maxLines,
    this.softWrap
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      overlayColor:
          overlayColor ?? WidgetStateProperty.all(Colors.transparent),
      child: Container(
        padding: padding,
        width: width,
        alignment: alignment,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
        child: Text(
          text,
          maxLines: maxLines,
          textAlign: textAlign,
          //textScaler:TextScaler.linear(textScaleFactor!),
          overflow: overflow,
          style: style,
          softWrap: softWrap,
        ),
      ),
    );
  }
}

class MyRichText extends StatelessWidget {
  const MyRichText({
    super.key,
    this.text1 = '',
    this.text2 = '',
    this.text3 = '',
    this.text4 = '',
    this.text5 = '',
    this.textAlign = TextAlign.start,
    this.style1,
    this.style2,
    this.style3,
    this.style4,
    this.style5,
    this.onTap2,
    this.onTap3,
    this.onTap4,
    this.margin = EdgeInsets.zero,
  });
  final String text1, text2, text3, text4, text5;
  final TextStyle? style1, style2, style3, style4, style5;
  final TextAlign textAlign;
  final void Function()? onTap3, onTap2, onTap4;
  final EdgeInsets margin;

  // final TapGestureRecognizer _tapGestureRecognizer1 = TapGestureRecognizer();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin,
      child: RichText(
        textAlign: textAlign,
        text: TextSpan(
          text: text1,
          style: style1,
          children: [
            TextSpan(
              text: text2,
              style: style2,
              recognizer: TapGestureRecognizer()..onTap = onTap2,
            ),
            TextSpan(
              text: text3,
              style: style3,
              recognizer: TapGestureRecognizer()..onTap = onTap3,
            ),
            TextSpan(
              text: text4,
              style: style4,
              recognizer: TapGestureRecognizer()..onTap = onTap4,
            ),
            TextSpan(
              text: text5,
              style: style5,
            ),
          ],
        ),
      ),
    );
  }
}
