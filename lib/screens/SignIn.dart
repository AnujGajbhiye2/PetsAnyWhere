import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;
import 'package:nb_utils/nb_utils.dart';
import 'package:paw/components/BottomWoofButton.dart';
import 'package:paw/components/CustomTextField.dart';
import 'package:paw/environment/Strings.dart' as env;
import 'package:paw/model/signIn_model.dart';

import '../constants.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _formKey = GlobalKey<FormState>();

  UserIdPass user = UserIdPass('', '');

  Future save() async {
    const spinkit = SpinKitRotatingCircle(
      color: Colors.white,
      size: 50.0,
    );
    var res = await http.post(env.dev_API_LINK + '/signIn',
        headers: <String, String>{
          'Context-Type': 'application/json;charSet=UTF-8'
        },
        body: <String, String>{
          'email': user.email,
          'password': user.password
        });
    print(res.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        elevation: 0,
        title: Text('Login'),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Container(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 80.0,
                        ),
                        CustomTextField(
                          fieldName: 'Email',
                          onChange: (value) {
                            user.email = value;
                          },
                          controllerText:
                              TextEditingController(text: user.email),
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
                          },
                        ),
                        CustomTextField(
                          fieldName: 'password',
                          keyboardType: 'password',
                          onChange: (value) {
                            user.password = value;
                          },
                          controllerText:
                              TextEditingController(text: user.password),
                          validator: (String value) {
                            if (value.trim().isEmpty) {
                              return 'you would need a password to login 🐹';
                            } else {
                              return null;
                            }
                          },
                        ),
                        SizedBox(
                          height: 25.0,
                        ),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Container(
                            margin: EdgeInsets.only(right: 30.0),
                            child: Image.asset(
                              'assets/signInScreen.png',
                              height: 180.0,
                              width: 180.0,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 25.0,
                        ),
                        Align(
                            alignment: Alignment.topLeft,
                            child: Container(
                              margin: EdgeInsets.only(left: 55.0),
                              child: Text(
                                'human,',
                                style: kBigTextStyle,
                              ),
                            )),
                        Align(
                          alignment: Alignment.center,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 70.0),
                            child: Text(
                              "that's all you need\n to sign in",
                              style: kNormalTextStyle.copyWith(
                                  fontWeight: FontWeight.bold, fontSize: 25),
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
                onPress: () {
                  if (_formKey.currentState.validate()) {
//                      save();
                    // Navigator.pushNamed(context, 'homeScreen');
                  } else {
                    toast('galat hain be');
                  }
                }),
          )
        ],
      ),
    );
  }
}
