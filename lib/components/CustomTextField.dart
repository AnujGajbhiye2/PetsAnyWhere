import 'package:flutter/material.dart';
import 'package:paw/constants.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField(
      {@required this.fieldName,
      this.width,
      this.controllerText,
      this.onChange,
      this.validator});

  final double width;
  final String fieldName;
  final TextEditingController controllerText;
  final Function onChange;
  final Function validator;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
//      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      width: width ?? size.width * 0.8,

      child: TextFormField(
        textInputAction: TextInputAction.next,
        controller: controllerText,
        validator: validator,
        onChanged: onChange,
        style: TextStyle(fontFamily: kFontMedium),
        decoration: InputDecoration(
          hintText: fieldName,
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: kBlack)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: kBlack)),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.red)),
          focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.red)),
        ),
      ),
    );
  }
}
