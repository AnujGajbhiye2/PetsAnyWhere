import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:paw/components/BottomWoofButton.dart';
import 'package:paw/components/CustomTextField.dart';
import 'package:paw/constants.dart';
import 'package:paw/model/signup_model.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final double height = AppBar().preferredSize.height;

  final _formkey = GlobalKey<FormState>();
  RegisterModel reg = RegisterModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        elevation: 0,
        title: Text('Sign Up'),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Form(
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
                          onChange: (value) {
                            reg.name = value;
                          },
                          controllerText: TextEditingController(text: reg.name),
                          validator: (String value) {
                            if (value.trim().isEmpty) {
                              return 'you must be having a name 🐱';
                            } else if (value.length < 4) {
                              return 'please enter your full name 😸';
                            } else {
                              return null;
                            }
                          },
                        ),
                        CustomTextField(
                            fieldName: 'email address',
                            keyboardType: 'email',
                            onChange: (value) {
                              reg.email = value;
                            },
                            controllerText:
                                TextEditingController(text: reg.email),
                            validator: (String value) {
                              if (value.trim().isEmpty) {
                                return 'looks like you forgot to enter your email 😼';
                              } else if (RegExp(
                                      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                  .hasMatch(value)) {
                                return null;
                              } else {
                                return "that's not a right email, pal 🙊";
                              }
                            }),
                        CustomTextField(
                          fieldName: 'password',
                          keyboardType: 'password',
                          onChange: (value) {
                            reg.password = value;
                          },
                          controllerText:
                              TextEditingController(text: reg.password),
                          validator: (String value) {
                            if (value.trim().isEmpty) {
                              return 'you would need a password to login 🐹';
                            } else if (value.trim().length < 5) {
                              return 'enter a stronger password 💪';
                            } else {
                              return null;
                            }
                          },
                        ),
                        CustomTextField(
                          fieldName: 'phone number',
                          keyboardType: 'phone',
                          onChange: (value) {
                            reg.phone = value;
                          },
                          controllerText:
                              TextEditingController(text: reg.phone),
                          validator: (String value) {
                            if (value.trim().isEmpty) {
                              return 'phone number is required for easy contact ☎️';
                            } else if (value.length < 10 || value.length > 10) {
                              return 'seems like a wrong number, pal 🐻';
                            } else {
                              return null;
                            }
                          },
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Image.asset(
                            'assets/signupScreen.png',
                            width: 160,
                            height: 120,
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
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
                ],
              ),
            ),
          ),
          Expanded(
            child: BottomWoofButton(
              btnText: 'meow',
              isBack: true,
//                goto: 'otp',
              onPress: () {
                if (_formkey.currentState.validate()) {
                  // truthy condition
                  registerUser();
                } else {
                  //falsy condition
                }
              },
            ),
          )
        ],
      ),
    );
  }

  registerUser() {}
}
