import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:nb_utils/nb_utils.dart';
import 'package:paw/environment/Strings.dart' as env;
import 'package:paw/components/BottomWoofButton.dart';
import 'package:paw/components/CustomTextField.dart';
import 'package:paw/constants.dart';
import 'package:paw/model/signup_model.dart';
import 'package:paw/services/Globals.dart';
import 'package:paw/utilities/loader.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool _isLoading = false;
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
                            reg.name = value.trim();
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
                              reg.email = value.trim();
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
                            reg.password = value.trim();
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
                            reg.phone = value.trim();
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
          BottomWoofButton(
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
          )
        ],
      ),
    );
  }

  Future registerUser() async {
    try {
      LoadingOverlay.of(context).show();
      final response = await http.post(env.register, headers: <String, String>{
        'Context-Type': 'application/json;charSet=UTF-8'
      }, body: <String, String>{
        'name': reg.name,
        'email': reg.email,
        'password': reg.password,
        'phone': reg.phone
      }).catchError((error) => toast(error.toString()));

      Map<String, dynamic> responseJson = json.decode(response.body);
      if (responseJson['success']) {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        var userData = new Map<String, dynamic>();
        userData['name'] = responseJson['user']['name'];
        userData['_id'] = responseJson['user']['_id'];
        userData['email'] = responseJson['user']['email'];
        userData['phone'] = responseJson['user']['phone'];
        g_email = responseJson['user']['email'];
        g_userId = responseJson['user']['_id'];

        await prefs.setString('user', json.encode(userData));
        LoadingOverlay.of(context).hide();
        Navigator.pushNamed(context, 'homeScreen');
      } else {
        toast(responseJson['errMessage']);
        LoadingOverlay.of(context).hide();
      }
    } catch (e) {
      LoadingOverlay.of(context).hide();

      print(e);
      toast(e);
    }
  }
}
