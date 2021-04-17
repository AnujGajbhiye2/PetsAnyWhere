import 'package:flutter/material.dart';
import 'package:paw/constants.dart';

// ** not to use anymore
// ** discarding this category as of 31 - 01 - 2021

class Categories extends StatelessWidget {
  Categories({this.iconPath, this.name});

  final String iconPath;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 60,
          width: 60,
          decoration: BoxDecoration(
              color: kWhite,
              borderRadius: BorderRadius.circular(6),
              boxShadow: [
                BoxShadow(
                  offset: Offset(0, 15),
                  blurRadius: 22,
                  color: kPrimaryColor.withOpacity(0.22),
                ),
                BoxShadow(
                    offset: Offset(-15, -15),
                    blurRadius: 20,
                    color: kPrimaryColor.withOpacity(0.22)),
                kDefaultShadow
              ]),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(8),
                child: Image.asset(
                  iconPath,
                  height: 40.0,
                  width: 40.0,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: kDefaultPadding / 4,
        ),
        Text(
          name,
          style: TextStyle(fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}
