import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:like_button/like_button.dart';
import 'package:paw/constants.dart';
import 'package:paw/model/petInfo_model.dart';

class PetCard extends StatelessWidget {
  //   You can set the initial value of the count.
  PetCardModel model;

  PetCard(PetCardModel model) {
    this.model = model;
  }

//   Set thr Size of the Button/Icons.
  final double buttonSize = 20.0;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, 'petDetailScreen');
      },
      child: Container(
        height: width / 2.5,
        margin: EdgeInsets.symmetric(horizontal: kDefaultPadding),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 8, 8, 0),
          child: Stack(
            children: [
              // those are our background of the card
              Container(
                height: width / 3.2,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: kSecondaryColor,
                    boxShadow: [kDefaultShadow]),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  margin: EdgeInsets.only(right: 2),
                ),
              ),
              //pet Image will go here
              Column(
                children: [
                  Row(
                    children: [
                      Container(
                        child: ClipRRect(
                          child: CachedNetworkImage(
                            imageUrl: model.image,
                            width: width / 3,
                            height: width / 3.2,
                            fit: BoxFit.fill,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 18.0),
                          child: Column(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      text(model.name,
                                          textColor: kTextColorPrimary,
                                          fontSize: kTextSizeLargeMedium,
                                          fontFamily: kFontBold),
                                      Container(
                                        margin: EdgeInsets.only(right: 10),
                                        alignment: Alignment.centerRight,
                                        child: LikeButton(
                                          size: buttonSize,
                                          onTap: onLikeButtonTapped,
                                        ),
                                      )
                                    ],
                                  ),
                                  text(model.breed,
                                      fontSize: kTextSizeSMedium,
                                      textColor: kTextColorSecondary),
                                  SizedBox(
                                    height: 4,
                                  ),
                                  text(model.yearsOld,
                                      textColor: kTextColorSecondary,
                                      fontSize: kTextSizeSmall,
                                      maxLine: 3),
                                  SizedBox(
                                    height: 4,
                                  ),
                                  text(model.location,
                                      textColor: kTextColorSecondary,
                                      fontSize: kTextSizeSmall,
                                      maxLine: 3),
                                  SizedBox(
                                    height: 4,
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  )
                ],
              )
            ],
          ),
        ),
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

  Widget text(String text,
      {var fontSize = kTextSizeLargeMedium,
      textColor = kAccentColor,
      var fontFamily = kFontLight,
      var isCentered = false,
      var maxLine = 1,
      var latterSpacing = 0.25,
      var textAllCaps = false,
      var isLongText = false}) {
    return Text(textAllCaps ? text.toUpperCase() : text,
        textAlign: isCentered ? TextAlign.center : TextAlign.start,
        maxLines: isLongText ? null : maxLine,
        style: TextStyle(
            fontFamily: fontFamily,
            fontSize: fontSize,
            color: textColor,
            height: 1.5,
            letterSpacing: latterSpacing));
  }
}
