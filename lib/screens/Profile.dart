// TODO: profile page for user goes here

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:paw/constants.dart';
import 'package:paw/screens/sideMenu/drawerConstants.dart';
import 'package:paw/utilities/utilities.dart';

import 'PetDetailScreen2.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // changeStatusColor(t1_app_background);
    final profileImg = new Container(
      margin: new EdgeInsets.symmetric(horizontal: 16.0),
      alignment: FractionalOffset.center,
      child: new CircleAvatar(
        backgroundImage: CachedNetworkImageProvider(k2_user),
        radius: 50,
      ),
    );
    final profileContent = new Container(
      margin: new EdgeInsets.only(top: 55.0),
      decoration: boxDecoration(radius: 10, showShadow: true),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            SizedBox(height: 50),
            customText('anuj',
                textColor: kTextColorPrimary,
                fontSize: kTextSizeNormal,
                fontFamily: kFontMedium),
            customText('anuj@gmail.com',
                textColor: kPrimaryColor,
                fontSize: kTextSizeMedium,
                fontFamily: kFontMedium),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Divider(
                color: kAccentColor,
                height: 0.5,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                counter("100", 'aaa'),
                counter("50", "Photos"),
                counter("60", "Videos"),
              ],
            ),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Stack(
        children: <Widget>[
          SingleChildScrollView(
            padding: EdgeInsets.only(top: 90, left: 2, right: 2),
            physics: ScrollPhysics(),
            child: Container(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  SizedBox(height: 16),
                  Container(
                    margin: const EdgeInsets.fromLTRB(16, 16, 16, 8),
                    child: Stack(
                      children: <Widget>[profileContent, profileImg],
                    ),
                  ),
                  SizedBox(height: 8),
                  Container(
                    margin: const EdgeInsets.fromLTRB(16, 8, 16, 8),
                    decoration: boxDecoration(radius: 10, showShadow: true),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: <Widget>[
                          SizedBox(height: 8),
                          // rowHeading(t1_lbl_personal),
                          SizedBox(height: 16),
                          // profilecustomText(t1_user_name),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(16, 10, 16, 10),
                            // child: view(),
                          ),
                          SizedBox(height: 8),
                          // profilecustomText("Male"),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(16, 10, 16, 10),
                            // child: view(),
                          ),
                          SizedBox(height: 8),
                          // profilecustomText(t1_profile_address, maxline: 2),
                          SizedBox(height: 16),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 8),
                  Container(
                    margin: const EdgeInsets.fromLTRB(16, 8, 16, 8),
                    decoration: boxDecoration(radius: 10, showShadow: true),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: <Widget>[
                          SizedBox(height: 8),
                          customText('t1_lbl_contacts'),
                          SizedBox(height: 16),
                          customText("+91 36982145"),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(16, 10, 16, 10),
                            // child: view(),
                          ),
                          SizedBox(height: 8),
                          customText("Astoncina@gmail.com"),
                          SizedBox(height: 8),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                ],
              ),
            ),
          ),
          // TopBar(t1_profile_title),
        ],
      ),
    );
  }
}
