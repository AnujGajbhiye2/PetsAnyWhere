// TODO: profile page for user goes here

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:paw/components/TopAppBar.dart';
import 'package:paw/constants.dart';
import 'package:paw/utilities/utilities.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // changeStatusColor(t1_app_background);
    final profileImg = new Container(
      margin: new EdgeInsets.symmetric(horizontal: 16.0),
      alignment: FractionalOffset.center,
      child: new CircleAvatar(
        backgroundImage: CachedNetworkImageProvider(doggoImg),
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
            customText('Anuj Gajbhiye',
                textColor: kTextColorPrimary,
                fontSize: kTextSizeNormal,
                fontFamily: kFontBold),
            customText('anuj@gmail.com',
                textColor: kSecondaryColor,
                fontSize: kTextSizeMedium,
                fontFamily: kFontBold),
            Padding(
              padding: const EdgeInsets.all(16),
              child: LocalDivider(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                counter("0", 'Adopted'),
                counter("0", "Put for Adoption"),
                counter("1", "Favourite"),
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
                          rowHeading("Personal"),
                          SizedBox(height: 16),
                          profileText('Anuj Gajbhiye'),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(16, 10, 16, 10),
                            child: LocalDivider(),
                          ),
                          SizedBox(height: 8),
                          profileText("Male"),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(16, 10, 16, 10),
                            child: LocalDivider(),
                          ),
                          SizedBox(height: 8),
                          profileText(
                              '46 Sanchi suryakiran soc. Indra nagar \nnew narsala road nagpur',
                              maxline: 2),
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
                          rowHeading('Contacts'),
                          SizedBox(height: 16),
                          profileText("+91 8668899045"),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(16, 10, 16, 10),
                            child: LocalDivider(),
                          ),
                          SizedBox(height: 8),
                          profileText("anuj@gmail.com"),
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
          TopAppBar('Profile'),
        ],
      ),
    );
  }
}

class LocalDivider extends StatelessWidget {
  const LocalDivider({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: kDividerColor,
      height: 0.5,
    );
  }
}
