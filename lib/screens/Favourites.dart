import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';
import 'package:paw/components/TopAppBar.dart';
import 'package:paw/constants.dart';
import 'package:paw/model/petInfo_model.dart';
import 'package:paw/services/PetCardDataGenerator.dart';
import 'package:paw/utilities/utilities.dart';

import 'PetDetailScreen.dart';

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
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Padding(
            padding: const EdgeInsets.all(16.0),
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
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
              child: Column(
                children: [
                  Row(
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
                      Expanded(
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        customText(
                                          petCards[index].name,
                                          fontSize: kTextSizeNormal,
                                          fontFamily: kFontBold,
                                        ),
                                        SizedBox(height: 4),
                                        customText(
                                          petCards[index].breed,
                                          textColor: kGreyColor,
                                        ),
                                      ],
                                    ),
                                  ),
                                  LikeButton(
                                    size: 25.0,
                                    isLiked: true,
                                    onTap: onLikeButtonTapped,
                                  )
                                ],
                              ),
                            ),
                            Divider(height: 25),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        PetDescriptionPills(label: 'Age', value: '2'),
                        PetDescriptionPills(label: 'Sex', value: 'Male'),
                        PetDescriptionPills(label: 'Color', value: 'Black'),
                        PetDescriptionPills(label: 'Length', value: '2.2m'),
                      ])
                ],
              ),
            ),
          );
        });

    return SafeArea(
      child: Scaffold(
          body: Stack(
        children: [
          SingleChildScrollView(
            padding: EdgeInsets.only(top: 30, left: 2, right: 2),
            physics: ScrollPhysics(),
            child: ListView(
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
            ),
          ),
          TopAppBar('Favourites')
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

  Future<bool> onLikeButtonTapped(bool isLiked) async {
    /// send your request here
    // final bool success= await sendRequest();

    /// if failed, you can do nothing
    // return success? !isLiked:isLiked;

    return !isLiked;
  }
}
