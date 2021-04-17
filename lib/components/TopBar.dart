import 'package:flutter/material.dart';
import 'package:paw/utilities/utilities.dart';

import '../constants.dart';

class TopBar extends StatelessWidget {
  const TopBar(
      {Key key,
      @required GlobalKey<ScaffoldState> scaffoldKey,
      @required this.city,
      @required this.state,
      this.isNormalTopBar = false})
      : _scaffoldKey = scaffoldKey,
        super(key: key);

  final GlobalKey<ScaffoldState> _scaffoldKey;
  final String city;
  final String state;
  final bool isNormalTopBar;

  @override
  Widget build(BuildContext context) {
    if (!isNormalTopBar) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //TODO: change the navigation bars here
          IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {
              _scaffoldKey.currentState.openDrawer();
            },
          ),
          Row(
            children: [
              //TODO: change the location marker here
              Image.asset('assets/icons/location.png', height: 18, width: 18),
              SizedBox(
                width: 8,
              ),
              Text('$city, $state')
            ],
          ),
          CircleAvatar(
            backgroundImage: NetworkImage(kNetworkImg),
            radius: 20,
          )
        ],
      );
    } else {
      return Container();
    }
  }
}
