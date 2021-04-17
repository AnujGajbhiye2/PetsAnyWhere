import 'package:flutter/material.dart';
import 'package:paw/constants.dart';

class BottomWoofButton extends StatelessWidget {
  BottomWoofButton({this.isBack = false, this.onPress, @required this.btnText});
  final bool isBack;
  final Function onPress;
  final String btnText;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomRight,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          (isBack == true)
              ? FlatButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(
                      '< back',
                      style: TextStyle(color: kBlack, fontSize: 20.0),
                    ),
                  ),
                )
              : SizedBox(),
          FlatButton(
            shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.only(topLeft: Radius.circular(12.0))),
            color: kBlack,
            onPressed: onPress,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                '$btnText >',
                style: TextStyle(color: kWhite, fontSize: 25.0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
