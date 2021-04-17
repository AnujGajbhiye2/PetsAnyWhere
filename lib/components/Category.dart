import 'package:flutter/material.dart';
import 'package:paw/components/CustomBoxDecoration.dart';
import 'package:paw/model/category_,model.dart';

import '../constants.dart';

class Category extends StatefulWidget {
  CategoryModel model;
  int position;

  Category(CategoryModel model, int position) {
    this.model = model;
    this.position = position;
  }

  @override
  _CategoryState createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  var selectedItem = -1;

  @override
  Widget build(BuildContext context) {
    var deviceWidth = MediaQuery.of(context).size.width;
    return GestureDetector(
      // ** do your stuff here
      onTap: () {
        setState(() {
          this.selectedItem = widget.position;
        });
      },
      child: Container(
        margin: EdgeInsets.only(left: 16, right: 4, bottom: 6),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: boxDecoration(
                radius: 10,
                showShadow: true,
              ),
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Image.asset(
                  widget.model.Image,
                  height: deviceWidth * 0.08,
                  width: deviceWidth * 0.08,
                ),
              ),
            ),
            SizedBox(
              height: 8,
            ),
            text(
              widget.model.name,
              fontFamily:
                  selectedItem == widget.position ? kFontBold : kFontLight,
            )
          ],
        ),
      ),
    );
  }

  Widget text(String text,
      {var fontSize = kTextSizeMedium,
      textColor = kBlack,
      var fontFamily = kFontLight,
      var isCentered = false,
      var maxLine = 1,
      var latterSpacing = 0.25,
      var textAllCaps = false,
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
}
