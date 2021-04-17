import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';
import 'package:paw/components/AppButton.dart';
import 'package:paw/components/TopAppBar.dart';
import 'package:paw/constants.dart';
import 'package:paw/utilities/utilities.dart';

class PetDetailSccreen2 extends StatefulWidget {
  @override
  _PetDetailSccreen2State createState() => _PetDetailSccreen2State();
}

class _PetDetailSccreen2State extends State<PetDetailSccreen2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Stack(
        children: [
          SingleChildScrollView(
            physics: ScrollPhysics(),
            child: Container(
              child: Column(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.width * 0.8,
                    child: CachedNetworkImage(
                      imageUrl: doggoImg,
                      width: double.infinity,
                      height: MediaQuery.of(context).size.width * 0.5,
                      fit: BoxFit.fill,
                    ),
                  ),
                  // expanded was here
                  Container(
                    color: kFullWhite,
                    // height: MediaQuery.of(context).size.height -
                    //     MediaQuery.of(context).size.width * 1.1,
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(18.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  customText("Little Darlene",
                                      textColor: kTextColorPrimary,
                                      fontSize: kTextSizeLarge,
                                      fontFamily: kFontBold),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 18.0),
                                    child: customText(
                                        "Labrador retriever puppy",
                                        fontSize: kTextSizeSMedium,
                                        textColor: kTextColorSecondary),
                                  ),
                                ],
                              ),
                              Container(
                                margin: EdgeInsets.only(right: 20),
                                alignment: Alignment.centerRight,
                                child: LikeButton(
                                  size: 25.0,
                                  onTap: onLikeButtonTapped,
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            PetDescriptionPills(
                              attribute: "Age",
                              value: "2",
                            ),
                            PetDescriptionPills(
                              attribute: "Sex",
                              value: "Female",
                            ),
                            PetDescriptionPills(
                              attribute: "Color",
                              value: "Black",
                            ),
                            PetDescriptionPills(
                              attribute: "Weight",
                              value: "2 Kg",
                            )
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 25, left: 15),
                          child: Container(
                            padding: EdgeInsets.fromLTRB(10, 15, 10, 15),
                            decoration: BoxDecoration(
                                // color: Color(0XFF5959fc),
                                color: Color(0XFFFEF2D1),
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(20.0),
                                    topLeft: Radius.circular(20.0))),
                            child: Row(
                              children: [
                                CircleAvatar(
                                  backgroundImage: NetworkImage(kNetworkImg),
                                  radius: 20,
                                ),
                                SizedBox(width: 16),
                                Expanded(
                                  child: Container(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        customText('Anuj Gajbhiye',
                                            textColor: kTextColorPrimary,
                                            fontFamily: kFontBold,
                                            fontSize: kTextSizeLargeMedium),
                                        SizedBox(height: 4),
                                        customText('Owner',
                                            textColor: kSecondaryColor,
                                            fontFamily: kFontBold,
                                            fontSize: kTextSizeSmall),
                                      ],
                                    ),
                                  ),
                                ),
                                customText("1.64 Km ",
                                    textColor: kSecondaryColor,
                                    fontFamily: kFontBold,
                                    fontSize: kTextSizeMedium)
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(
                              kDefaultPadding * 1.2,
                              kDefaultPadding * 1.2,
                              kDefaultPadding * 1.2,
                              0),
                          child: customText(kDemoText,
                              isLongText: true,
                              fontSize: kTextSizeMedium,
                              textColor: kTextColorPrimary,
                              fontFamily: kFontMedium),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(kDefaultPadding * 1.2),
                          child: AppButton(
                            onPressed: () {
                              Navigator.pushNamed(context, 'messages');
                            },
                            textContent: "Adopt Now",
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          TopAppBar('')
        ],
      ),
    );
  }

  Future<bool> onLikeButtonTapped(bool isLiked) async {
    /// send your request here
    // final bool success= await sendRequest();

    /// if failed, you can do nothing
    // return success? !isLiked:isLiked;

    return !isLiked;
  }
}

class PetDescriptionPills extends StatelessWidget {
  PetDescriptionPills({@required this.attribute, @required this.value});

  final String attribute;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(
              horizontal: kDefaultPadding, vertical: kDefaultPadding / 5),
          decoration: BoxDecoration(
              color: Color.fromRGBO(226, 226, 226, 0.5),
              borderRadius: BorderRadius.all(Radius.circular(10)),
              boxShadow: [kDefaultShadow]),
          child: Column(
            children: [
              customText(attribute,
                  textColor: kSecondaryColor,
                  fontFamily: kFontBold,
                  fontSize: kTextSizeSMedium),
              SizedBox(
                height: 2,
              ),
              customText(value,
                  textColor: kTextColorPrimary,
                  fontFamily: kFontBold,
                  fontSize: kTextSizeMedium),
            ],
          ),
        ),
      ],
    );
  }
}
