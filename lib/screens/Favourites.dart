import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:paw/constants.dart';
import 'package:paw/model/petInfo_model.dart';
import 'package:paw/services/PetCardDataGenerator.dart';
import 'package:paw/utilities/utilities.dart';

class Favourites extends StatefulWidget {
  @override
  _FavouritesState createState() => _FavouritesState();
}

class _FavouritesState extends State<Favourites> {
  List<PetCardModel> petCards;

  @override
  void initState() {
    super.initState();
    petCards = getPetListData();
  }

  @override
  Widget build(BuildContext context) {
    final topView = Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Expanded(
          child: Container(
            margin: EdgeInsets.only(left: 16),
            child: customText('Favourites',
                fontFamily: kFontBold, fontSize: kTextSizeNormal),
          ),
        ),
        Padding(
            padding: const EdgeInsets.all(16.0),
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                CachedNetworkImage(
                  imageUrl: doggoImg,
                  width: 40,
                  height: 40,
                ),
                Icon(
                  Icons.search,
                  color: kBlack,
                )
              ],
            )),
      ],
    );

    final cardList = ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: petCards.length,
        itemBuilder: (context, index) {
          return Container(
            decoration:
                boxDecoration(showShadow: true, bgColor: kWhite, radius: 10.0),
            margin: EdgeInsets.only(left: 16, right: 16, bottom: 16),

            // .cornerRadiusWithClipRRect(10.0) .withShadow() .paddingOnly(top: 8,left: 16,right: 16,bottom: 8)
            //     color: t9_white,
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(25.0)),
                    child: CachedNetworkImage(
                        imageUrl: petCards[index].image,
                        height: 50,
                        width: 50,
                        fit: BoxFit.fill),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  customText(
                                    petCards[index].name,
                                    fontFamily: kFontBold,
                                  ),
                                  SizedBox(height: 4),
                                  customText(petCards[index].breed,
                                      textColor: sdSecondaryColorYellow),
                                ],
                              ),
                            ),
                            Icon(Icons.favorite, color: Colors.red, size: 30),
                          ],
                        ),
                        Divider(height: 25),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                customText(
                                  "20",
                                  fontFamily: kFontBold,
                                ),
                                SizedBox(height: 4),
                                customText("Students",
                                    textColor: kSecondaryColor),
                              ],
                            ),
                            SizedBox(width: 10),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  customText(
                                    "51",
                                    fontFamily: kFontBold,
                                  ),
                                  SizedBox(height: 4),
                                  customText("Lectures",
                                      textColor: kSecondaryColor),
                                ],
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                  color: Colors.green,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8))),
                              child: customText(petCards[index].yearsOld,
                                  textColor: kWhite),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });

    return SafeArea(
      child: Scaffold(
          body: ListView(
        shrinkWrap: true,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(left: 8),
            alignment: Alignment.centerLeft,
            width: MediaQuery.of(context).size.width,
            height: 50,
            child: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: kPrimaryColor,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ),
          SingleChildScrollView(
            child: Column(
              children: <Widget>[
                topView,
                cardList,
              ],
            ),
          ),
        ],
      )),
    );
  }

  BoxDecoration boxDecoration(
      {double radius = 2,
      Color color = Colors.transparent,
      Color bgColor = kWhite,
      var showShadow = false}) {
    return BoxDecoration(
        color: bgColor,
        //gradient: LinearGradient(colors: [bgColor, whiteColor]),
        boxShadow: showShadow
            ? [
                BoxShadow(
                    color: Color(0X95E9EBF0), blurRadius: 10, spreadRadius: 2)
              ]
            : [BoxShadow(color: Colors.transparent)],
        border: Border.all(color: color),
        borderRadius: BorderRadius.all(Radius.circular(radius)));
  }
}
