import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:paw/components/BottomWoofButton.dart';
import 'package:paw/components/CustomTextField.dart';
import 'package:paw/constants.dart';

class SignUp extends StatelessWidget {
  final double height = AppBar().preferredSize.height;
  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        elevation: 0,
        title: Text('Sign Up'),
      ),
      body: Form(
        key: _formkey,
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(25.0, 25.0, 25.0, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  CustomTextField(
                    fieldName: 'full name',
                  ),
                  CustomTextField(
                    fieldName: 'email address',
                  ),
                  CustomTextField(
                    fieldName: 'password',
                  ),
                  CustomTextField(
                    fieldName: 'phone number',
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Image.asset(
                      'assets/signupScreen.png',
                      width: 160,
                      height: 160,
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Align(
                      alignment: Alignment.center,
                      child: Text(
                        'human,',
                        style: kBigTextStyle,
                      )),
                  Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 100.0),
                      child: Text(
                        'almost there...',
                        style: kNormalTextStyle.copyWith(
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: BottomWoofButton(
                btnText: 'meow',
                isBack: true,
//                goto: 'otp',
                onPress: () {},
              ),
            )
          ],
        ),
      ),
    );
  }
}
