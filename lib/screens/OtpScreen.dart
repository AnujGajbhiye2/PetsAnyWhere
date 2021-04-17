import 'package:flutter/material.dart';
import 'package:paw/components/BottomWoofButton.dart';
import 'package:paw/components/CustomTextField.dart';
import 'package:paw/constants.dart';

class OtpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.all(25),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
//                    CustomTextField(
//                      child: TextField(
//                        decoration: InputDecoration(
//                          border: InputBorder.none,
//                        ),
//                      ),
//                      width: 65.0,
//                    ),
//                    CustomTextField(
//                      width: 65.0,
//                      child: TextField(
//                        decoration: InputDecoration(border: InputBorder.none),
//                      ),
//                    ),
//                    CustomTextField(
//                      width: 65.0,
//                      child: TextField(
//                        decoration: InputDecoration(border: InputBorder.none),
//                      ),
//                    ),
//                    CustomTextField(
//                      width: 65.0,
//                      child: TextField(
//                        decoration: InputDecoration(border: InputBorder.none),
//                      ),
//                    ),
                  ],
                ),
                SizedBox(
                  height: 100.0,
                ),
                Row(
                  children: [
                    Expanded(
                        flex: 1,
                        child: Image.asset(
                          'assets/otp.png',
                          width: 250,
                          height: 250.0,
                        )),
                    Expanded(
                        child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'hey, hey, hey..\n I send your phone a code',
                        style: kNormalTextStyle,
                      ),
                    ))
                  ],
                ),
                Text(
                  'pal, \n enter the code...',
                  style: kNormalTextStyle,
                ),
              ],
            ),
          ),
          Expanded(
            child: BottomWoofButton(
              btnText: 'woof',
              isBack: true,
//              goto: 'homeScreen',
            ),
          )
        ],
      ),
    );
  }
}
