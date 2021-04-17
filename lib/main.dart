import 'package:flutter/material.dart';
import 'package:paw/constants.dart';
import 'package:paw/screens/AddPost.dart';
import 'package:paw/screens/Authenticate.dart';
import 'package:paw/screens/Favourites.dart';
import 'package:paw/screens/HelpAndSupport.dart';
import 'package:paw/screens/HomeScreen.dart';
import 'package:paw/screens/Messages/Messages.dart';
import 'package:paw/screens/OtpScreen.dart';
import 'package:paw/screens/PetDetailScreen.dart';
import 'package:paw/screens/PetDetailScreen2.dart';
import 'package:paw/screens/Profile.dart';
import 'package:paw/screens/SignIn.dart';
import 'package:paw/screens/SignUp.dart';
import 'package:paw/screens/SplashScreen.dart';
import 'package:paw/screens/WelcomeScreen.dart';

void main() {
  runApp(Paws());
}

class Paws extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primaryColor: kPrimaryColor,
          scaffoldBackgroundColor: Color(0xFFF4E3E3),
          cursorColor: kBlack,
          fontFamily: 'VisbyCF'),
      initialRoute: '/',
      routes: {
        '/': (context) => SplashScreen(),
        'welcome': (context) => WelcomeScreen(),
        'auth': (context) => Authenticate(),
        'signIn': (context) => SignIn(),
        'signUp': (context) => SignUp(),
        'otp': (context) => OtpScreen(),

        // drawer navigation
        'homeScreen': (context) => HomeScreen(),
        'addPost': (context) => AddPost(),
        'favourites': (context) => Favourites(),
        'messages': (context) => Messages(),
        'profile': (context) => Profile(),

        // pet details
        'petDetailScreen': (context) => PetDetailSccreen2(),
        'helpAndSupport': (context) => HelpAndSupport()
      },
    );
  }
}
