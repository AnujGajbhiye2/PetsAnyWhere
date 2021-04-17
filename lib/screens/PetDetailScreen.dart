import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:paw/constants.dart';

class PetDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
      ),
      body: Body(),
    );
  }
}

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        Stack(
          children: [
            CachedNetworkImage(
              height: size.height * 0.25,
              width: double.infinity,
              fit: BoxFit.cover,
              imageUrl: doggo2Img,
            ),
            Container(
              width: size.width,
              margin: EdgeInsets.fromLTRB(
                  kDefaultPadding, size.height * 0.22, kDefaultPadding, 0),
              padding: EdgeInsets.all(kDefaultPadding),
              decoration: BoxDecoration(
                  color: kWhite,
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  boxShadow: [kDefaultShadow]),
              child: SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        text("Logan",
                            textColor: kTextColorPrimary,
                            fontSize: kTextSizeLargeMedium,
                            fontFamily: kFontBold),
                        Icon(FontAwesomeIcons.mars)
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image.asset(
                          'assets/icons/dog.png',
                          height: 18,
                          width: 18,
                        ),
                        Text(' : Indie Breed')
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image.asset(
                          'assets/icons/birthdayCake.png',
                          height: 18,
                          width: 18,
                        ),
                        Text(' : 2 year old')
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image.asset(
                          'assets/icons/location.png',
                          height: 18,
                          width: 18,
                        ),
                        Text(
                            ' : 46, Sanchi, Suryakiran Soc. Indra nagar, Nagpur\n   - 440034')
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: kDefaultPadding,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            PetDescriptionPills(label: 'Age', value: '2'),
            PetDescriptionPills(label: 'Sex', value: 'Male'),
            PetDescriptionPills(label: 'Color', value: 'Black'),
            PetDescriptionPills(label: 'Length', value: '2.2m'),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: kDefaultPadding * 2, vertical: kDefaultPadding),
          child: Divider(
            color: Colors.grey[800].withOpacity(0.7),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://api.adorable.io/avatars/285/abott@adorable.png'),
                radius: 30,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Anuj Gajbhiye',
                  style: kBigTextStyle.copyWith(
                      fontSize: 18, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.left,
                ),
                Text(
                  'Owner',
                  style: TextStyle(
                    color: kBlack.withOpacity(0.4),
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.start,
                )
              ],
            ),
            Spacer(),
            Container(
              margin: EdgeInsets.only(
                  bottom: kDefaultPadding * 1.5, right: kDefaultPadding),
              child: Text(
                '17 Oct 2020',
                style: TextStyle(color: kBlack.withOpacity(0.4), fontSize: 13),
              ),
            )
          ],
        ),
        Container(
            padding: EdgeInsets.symmetric(
                horizontal: kDefaultPadding, vertical: kDefaultPadding),
            child: Text(
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised luding versions of Lorem Ipsum.")),
        Spacer(),

        //      TODO: Set a standard theme for buttons
        ButtonTheme(
          minWidth: size.width * 0.9,
          child: FlatButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18.0),
              side: BorderSide(color: Colors.red),
            ),
            color: kSecondaryColor,
            onPressed: () {},
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Adoption',
                style:
                    TextStyle(letterSpacing: 1.3, color: kWhite, fontSize: 20),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 12,
        )
      ],
    );
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

class PetDescriptionPills extends StatelessWidget {
  PetDescriptionPills({@required this.label, @required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            child: Text(
          label,
          style: TextStyle(fontWeight: FontWeight.bold),
        )),
        SizedBox(
          height: kDefaultPadding / 4,
        ),
        Container(
          padding: EdgeInsets.symmetric(
              horizontal: kDefaultPadding, vertical: kDefaultPadding / 5),
          decoration: BoxDecoration(
              color: kWhite,
              borderRadius: BorderRadius.all(Radius.circular(10)),
              boxShadow: [kDefaultShadow]),
          child: Text(
            value,
            style: TextStyle(color: kSecondaryColor),
          ),
        ),
      ],
    );
  }
}
