import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:paw/constants.dart';
import 'package:paw/utilities/utilities.dart';

import 'DrawerConstants.dart';

class SideMenuDrawer extends StatefulWidget {
  @override
  _SideMenuDrawerState createState() => _SideMenuDrawerState();
}

GoogleSignIn _googleSignIn = GoogleSignIn(
  // Optional clientId
  // clientId: '479882132969-9i9aqik3jfjd7qhci1nqf0bm2g71rm1u.apps.googleusercontent.com',
  scopes: <String>[
    'email',
  ],
);

class _SideMenuDrawerState extends State<SideMenuDrawer> {
  var selectedItem = -1;
  String email = '';
  String name = '';
  String photoUrl = '';

  Future checkUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      name = jsonDecode(prefs.getString('user'))['name'];
      email = jsonDecode(prefs.getString('user'))['email'];
      photoUrl = jsonDecode(prefs.getString('user'))['photoUrl'];
      print(photoUrl);
    });
  }

  @override
  Widget build(BuildContext context) {
    if (email == "") {
      checkUser();
    }
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.85,
      height: MediaQuery.of(context).size.height,
      child: Drawer(
        elevation: 8,
        child: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            color: kWhite,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 70, right: 20),
                  child: Container(
                    padding: EdgeInsets.fromLTRB(20, 40, 20, 40),
                    decoration: BoxDecoration(
                        // color: Color(0XFF5959fc),
                        color: kSecondaryColor,
                        borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(24.0),
                            topRight: Radius.circular(24.0))),
                    child: Row(
                      children: [
                        CircleAvatar(
                          backgroundImage: NetworkImage(photoUrl ??
                              kNetworkImg + name.replaceAll(' ', '+')),
                          radius: 40,
                        ),
                        SizedBox(width: 16),
                        Expanded(
                          child: Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                customText(name,
                                    textColor: kWhite,
                                    fontFamily: kFontBold,
                                    fontSize: kTextSizeNormal),
                                SizedBox(height: 8),
                                customText(email,
                                    textColor: kWhite,
                                    fontFamily: kFontBold,
                                    fontSize: kTextSizeSmall),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 30),
                getDrawerItem(k2_paw, k2_lbl_adoption, 1),
                getDrawerItem(k2_plus, k2_lbl_addPost, 2),
                getDrawerItem(k2_heart, k2_lbl_favourites, 3),
                getDrawerItem(k2_chat, k2_lbl_messages, 4),
                getDrawerItem(k2_user, k2_lbl_profile, 5),
                getDrawerItem(k2_logout, k2_lbl_signOut, 6),
                SizedBox(height: 30),
                Divider(color: kDividerColor, height: 1),
                SizedBox(height: 30),
                getDrawerItem(k2_share, k2_lbl_share, 7),
                getDrawerItem(k2_help, k2_lbl_help, 8),
                SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget getDrawerItem(String icon, String name, int pos) {
    return GestureDetector(
      onTap: () {
        setState(() {
          this.selectedItem = pos;
          var currentRoute = ModalRoute.of(context).settings.name;
          print(name);
          switch (name) {
            case 'Adoption':
              if (currentRoute != 'homeScreen') {
                Navigator.pushNamed(context, 'homeScreen');
              } else {
                Navigator.of(context).pop();
              }
              break;
            case 'Add post':
              if (currentRoute != 'addPost') {
                Navigator.pushNamed(context, 'addPost');
              } else {
                Navigator.of(context).pop();
              }
              break;
            case 'Favourites':
              if (currentRoute != 'favourites') {
                Navigator.pushNamed(context, 'favourites');
              } else {
                Navigator.of(context).pop();
              }
              break;
            case 'Messages':
              if (currentRoute != 'messages') {
                Navigator.pushNamed(context, 'messages');
              } else {
                Navigator.of(context).pop();
              }
              break;
            case 'Profile':
              if (currentRoute != 'Profile') {
                Navigator.pushNamed(context, 'profile');
              } else {
                Navigator.of(context).pop();
              }
              break;
            case 'Sign Out':
              _googleSignIn.disconnect();
              Navigator.pushNamed(context, 'auth');
              break;
            case 'Help and Feedback':
              if (currentRoute != 'helpAndSupport') {
                Navigator.pushNamed(context, 'helpAndSupport');
              } else {
                Navigator.of(context).pop();
              }
              break;

            default:
          }
        });
      },
      child: Container(
        color: selectedItem == pos ? kPrimaryColor : kWhite,
        padding: EdgeInsets.fromLTRB(20, 16, 20, 16),
        child: Row(
          children: <Widget>[
            SvgPicture.asset(icon, width: 20, height: 20),
            SizedBox(width: 20),
            customText(name,
                textColor: selectedItem == pos ? kSecondaryColor : kBlack,
                fontSize: kTextSizeLargeMedium,
                fontFamily: kFontMedium)
          ],
        ),
      ),
    );
  }
}
