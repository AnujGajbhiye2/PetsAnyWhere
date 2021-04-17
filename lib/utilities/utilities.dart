import 'package:flutter/material.dart';

import '../constants.dart';

Widget customText(String text,
    {var fontSize = kTextSizeLargeMedium,
    textColor = kBlack,
    var fontFamily = kFontLight,
    var isCentered = false,
    var maxLine = 1,
    var latterSpacing = 0.25,
    var textAllCaps = false,
    bool isOverFlow = false,
    var overFlow: TextOverflow.ellipsis,
    var isLongText = false}) {
  return Text(textAllCaps ? text.toUpperCase() : text,
      textAlign: isCentered ? TextAlign.center : TextAlign.start,
      maxLines: isLongText ? null : maxLine,
      style: TextStyle(
          fontFamily: fontFamily,
          fontSize: fontSize,
          color: textColor,
          height: 1.5,
          letterSpacing: latterSpacing));
}

Text profile(var label) {
  return Text(label,
      style: TextStyle(
          color: kTextColorPrimary, fontSize: 18, fontFamily: 'Medium'),
      textAlign: TextAlign.center);
}

TextStyle primaryTextStyle({int size = 16, Color textColor = kFullBlack}) {
  return TextStyle(
    fontSize: size.toDouble(),
    color: textColor,
  );
}

TextStyle secondaryTextStyle({int size = 14, Color textColor = kGreyColor}) {
  return TextStyle(
    fontSize: size.toDouble(),
    color: textColor,
  );
}

TextStyle boldTextStyle(
    {int size = 18,
    Color textColor = kFullBlack,
    FontWeight textWeight = FontWeight.bold,
    double letterSpacing,
    double wordSpacing}) {
  return TextStyle(
      fontSize: size.toDouble(),
      color: textColor,
      fontWeight: textWeight,
      letterSpacing: letterSpacing,
      wordSpacing: wordSpacing);
}

Widget counter(String counter, String counterName) {
  return Column(
    children: <Widget>[
      profile(counter),
      customText(counterName,
          textColor: kTextColorPrimary,
          fontSize: kTextSizeMedium,
          fontFamily: kFontMedium)
    ],
  );
}

BoxDecoration boxDecoration(
    {double radius = 2,
    Color color = Colors.transparent,
    Color bgColor = kWhite,
    var showShadow = false}) {
  return BoxDecoration(
    color: bgColor,
    boxShadow: showShadow
        ? [
            BoxShadow(
                color: kTextColorSecondary, blurRadius: 2, spreadRadius: 2)
          ]
        : [BoxShadow(color: Colors.transparent)],
    border: Border.all(color: color),
    borderRadius: BorderRadius.all(Radius.circular(radius)),
  );
}

BoxDecoration boxDecoration2(
    {double radius = 80.0,
    Color backGroundColor = sdPrimaryColor,
    double blurRadius = 8.0,
    double spreadRadius = 8.0,
    Color radiusColor = Colors.black12,
    Gradient gradient}) {
  return BoxDecoration(
      borderRadius: BorderRadius.circular(radius),
      boxShadow: [
        BoxShadow(
          color: radiusColor,
          blurRadius: blurRadius,
          spreadRadius: spreadRadius,
        ),
      ],
      color: backGroundColor,
      gradient: gradient);
}

BoxDecoration boxDecorations(
    {double radius = 8,
    Color color = Colors.transparent,
    Color bgColor = Colors.white,
    var showShadow = false}) {
  return BoxDecoration(
      color: bgColor,
      //gradient: LinearGradient(colors: [bgColor, whiteColor]),
      boxShadow: showShadow
          ? [BoxShadow(color: sdShadowColor, blurRadius: 10, spreadRadius: 2)]
          : [BoxShadow(color: Colors.transparent)],
      border: Border.all(color: color),
      borderRadius: BorderRadius.all(Radius.circular(radius)));
}
