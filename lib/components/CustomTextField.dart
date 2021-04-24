import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:paw/constants.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField(
      {@required this.fieldName,
      this.width,
      this.controllerText,
      this.onChange,
      this.keyboardType = '',
      this.isMultiLine = false,
      this.validator});

  final double width;
  final String fieldName;
  final TextEditingController controllerText;
  final Function onChange;
  final Function validator;
  final String keyboardType;
  final bool isMultiLine;

  TextInputType keyboard;

  setKeyboardType() {
    if (this.keyboardType == '') {
      keyboard = TextInputType.name;
    } else if (this.keyboardType == 'number') {
      keyboard = TextInputType.number;
    } else if (keyboardType == 'email') {
      keyboard = TextInputType.emailAddress;
    } else if (keyboardType == 'password') {
      keyboard = TextInputType.visiblePassword;
    } else if (keyboardType == 'phone') {
      keyboard = TextInputType.phone;
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    setKeyboardType();
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
//      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      width: width ?? size.width * 0.8,

      child: TextFormField(
        textInputAction: TextInputAction.next,
        onEditingComplete: () => FocusScope.of(context).nextFocus(),
        controller: controllerText,
        validator: validator,
        onChanged: onChange,
        style: TextStyle(fontFamily: kFontMedium),
        textCapitalization: keyboardType == ''
            ? TextCapitalization.words
            : TextCapitalization.none,
        keyboardType: keyboard,
        obscureText: keyboardType == 'password' ? true : false,
        maxLines: isMultiLine ? 5 : 1,
        inputFormatters: keyboard == TextInputType.number
            ? [WhitelistingTextInputFormatter.digitsOnly]
            : [],
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
