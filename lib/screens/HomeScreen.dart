import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:geocoder/geocoder.dart';
import 'package:geolocator/geolocator.dart';
import 'package:paw/components/Categories.dart';
import 'package:paw/components/Category.dart';
import 'package:paw/components/PetCard.dart';
import 'package:paw/components/TopBar.dart';
import 'package:paw/constants.dart';
import 'package:paw/model/category_,model.dart';
import 'package:paw/model/petInfo_model.dart';
import 'package:paw/screens/sideMenu/SideMenu.dart';
import 'package:paw/screens/sideMenu/drawerConstants.dart';
import 'package:paw/services/CategoryDataDenerator.dart';
import 'package:paw/services/PetCardDataGenerator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String state = '';
  String city = '';
  List<CategoryModel> category;
  List<PetCardModel> petCards;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    category = getData();
    petCards = getPetListData();
  }

  @override
  Widget build(BuildContext context) {
    getLocation();
    return Scaffold(
      key: _scaffoldKey,
      body: Container(
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child:
                    TopBar(scaffoldKey: _scaffoldKey, city: city, state: state),
              ),
              Container(
                margin: EdgeInsets.all(kDefaultPadding),
                padding: EdgeInsets.symmetric(
                    horizontal: kDefaultPadding, vertical: kDefaultPadding / 4),
                decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.4),
                    borderRadius: BorderRadius.circular(20)),
                child: TextField(
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                      icon: SvgPicture.asset(k2_search),
                      focusedBorder: InputBorder.none,
                      hintText: 'Search',
                      hintStyle: TextStyle(color: Colors.black),
                      enabledBorder: InputBorder.none),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.3,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: category.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Category(category[index], index);
                  },
                ),
              ),
              SizedBox(
                height: kDefaultPadding,
              ),
              Expanded(
                child: Stack(
                  children: [
                    // this is the background on which cards will be displayed
                    Container(
                      decoration: BoxDecoration(
                          color: kWhite,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(40),
                            topRight: Radius.circular(40),
                          )),
                      margin: EdgeInsets.only(top: 70),
                    ),
                    ListView.builder(
                        itemCount: petCards.length,
                        itemBuilder: (context, index) =>
                            PetCard(petCards[index]))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      drawer: SideMenuDrawer(),
    );
  }

  Future getLocation() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var _state = prefs.getString(state);
    var _city = prefs.getString(city);
    if (_city == null || _state == null || _city == '' || _state == '') {
      var position = await Geolocator()
          .getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
      var coordinates = Coordinates(position.latitude, position.longitude);
      var addresses =
          await Geocoder.local.findAddressesFromCoordinates(coordinates);
      var first = addresses.first;
      setState(() {
        this.city = first.locality;
        this.state = first.adminArea;
        prefs.setString(city, first.locality);
        prefs.setString(state, first.adminArea);
        // saveLocationToPrefs(city, state);
      });
    } else {
      this.state = _state;
      this.city = _city;
    }

//    print(' ${first.locality}, ${first.adminArea},${first.subLocality}, ${first.subAdminArea},${first.addressLine}, ${first.featureName},${first.thoroughfare}, ${first.subThoroughfare}');
  }
}
