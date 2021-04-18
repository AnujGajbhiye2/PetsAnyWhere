import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:paw/constants.dart';

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool isSuccess = false;
  String name = 'UserName';
  String email = 'EmailId';
  var photoUrl = '';

  void onSignInTap() async {
    GoogleSignIn googleSignIn = GoogleSignIn(scopes: ['email']);

    await googleSignIn.signIn().then((res) async {
      await res.authentication.then((accessToken) async {
        setState(() {
          isSuccess = true;
          name = res.displayName;
          email = res.email;
          photoUrl = res.photoUrl;
          print(email);
        });
        print('Access Token : ${accessToken.accessToken.toString()}');
      }).catchError((error) {
        isSuccess = false;
        toast(error.toString());
        setState(() {});
        throw (error.toString());
      }).catchError((error) {
        isSuccess = false;
        toast(error.toString());
        setState(() {});
        throw (error.toString());
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 160.0,
          ),
          Expanded(
            child: Column(
              children: [
                AuthButtons(
                  alignment: Alignment.centerLeft,
                  buttonColor: kBlack,
                  topRight: 12.0,
                  bottomRight: 12.0,
                  topLeft: 0.0,
                  bottomLeft: 0.0,
                  buttonName: 'sign in',
                  onTap: () {
                    Navigator.pushNamed(context, 'signIn');
                  },
                ),
                AuthButtons(
                  alignment: Alignment.centerRight,
                  buttonColor: kSecondaryColor,
                  topRight: 0.0,
                  bottomRight: 0.0,
                  topLeft: 12.0,
                  bottomLeft: 12.0,
                  buttonName: 'sign up',
                  onTap: () {
                    Navigator.pushNamed(context, 'signUp');
                  },
                ),
              ],
            ),
          ),
          Expanded(
              child: Image.asset(
            'assets/authScreen.png',
            height: 300.0,
            width: 400.0,
          )),
          Padding(
            padding: const EdgeInsets.only(top: 18),
            child: Text(
              'hi human',
              style: kBigTextStyle,
            ),
          ),
          Expanded(
            child: Text(
              'do you want to sign up or sign in\n to have me ?',
              style: kNormalTextStyle,
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 38.0),
              child: Row(
                children: [
                  SizedBox(
                    width: size.width * 0.3,
                  ),
                  Text(
                    'or login with',
                    style: kNormalTextStyle,
                  ),
                  SizedBox(
                    width: 25.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ButtonTheme(
                        minWidth: 50,
                        height: 50,
                        child: FlatButton(
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(7.0))),
                          child: Icon(
                            FontAwesomeIcons.google,
                            color: kWhite,
                          ),
                          color: Color.fromRGBO(219, 68, 55, 1),
                          onPressed: () {
                            onSignInTap();
                          },
                        ),
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      ButtonTheme(
                        minWidth: 50,
                        height: 50,
                        child: FlatButton(
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(7.0))),
                          child: Icon(
                            FontAwesomeIcons.facebook,
                            color: kWhite,
                          ),
                          color: Color.fromRGBO(66, 103, 178, 1),
                          onPressed: () {},
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class AuthButtons extends StatelessWidget {
  AuthButtons(
      {this.alignment,
      this.onTap,
      this.buttonColor,
      this.topLeft,
      this.topRight,
      this.bottomRight,
      this.bottomLeft,
      this.buttonName});

  final AlignmentGeometry alignment;
  final Function onTap;
  final Color buttonColor;
  final double topLeft;
  final double topRight;
  final double bottomRight;
  final double bottomLeft;
  final String buttonName;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment,
      child: Container(
        margin: EdgeInsets.only(top: 3.0, bottom: 3.0),
        width: MediaQuery.of(context).size.width * 0.51,
        child: FlatButton(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(topRight),
                  bottomRight: Radius.circular(bottomRight),
                  topLeft: Radius.circular(topLeft),
                  bottomLeft: Radius.circular(bottomLeft))),
          onPressed: onTap,
          color: buttonColor,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text(
              buttonName,
              style: TextStyle(color: kWhite, fontSize: 25.0),
            ),
          ),
        ),
      ),
    );
  }
}
