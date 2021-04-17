import 'package:flutter/material.dart';
import 'package:paw/constants.dart';
import 'package:paw/components/BottomWoofButton.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 1,
              child: Container(),
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Image.asset(
                    'assets/welcome.png',
                    height: 300,
                  ),
                ),
                Text('hi pal,', style: kBigTextStyle),
                Text('are you ready to be my new family ?',
                    style: kNormalTextStyle),
              ],
            ),
            Expanded(
              child: BottomWoofButton(
                btnText: 'woof',
                isBack: false,
                onPress: () {
                  Navigator.pushNamed(context, 'auth');
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
