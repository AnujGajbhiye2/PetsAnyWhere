import 'package:flutter/material.dart';
import 'package:paw/components/TopAppBar.dart';
import 'package:paw/model/messages_model.dart';
import 'package:paw/constants.dart';
import 'package:paw/utilities/utilities.dart';

import 'ChatRoom.dart';

class Messages extends StatefulWidget {
  @override
  _MessagesState createState() => _MessagesState();
}

class _MessagesState extends State<Messages> {
  List<MessagesModel> personalChats = [
    MessagesModel(
      profileImage:
          'https://i.insider.com/5de6dd81fd9db241b00c04d3?width=1100&format=jpeg&auto=webp',
      name: 'Sabella Dinna Paul',
      message: 'Can you help me ?',
      time: '2:11 PM',
      pendingMessages: '8',
    ),
    MessagesModel(
      profileImage:
          'https://cdn.fastly.picmonkey.com/contentful/h6goo9gw1hh6/2sNZtFAWOdP1lmQ33VwRN3/24e953b920a9cd0ff2e1d587742a2472/1-intro-photo-final.jpg?w=800&q=70',
      name: 'Andy Anthony',
      message: 'All the best for exam',
      time: '1:11 PM',
      pendingMessages: '1',
    ),
    MessagesModel(
      profileImage:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTMio5UHQKuvdPkvHD4wLt8lJbf6f4JQCUUQA&usqp=CAU',
      name: 'Sita Rodisa',
      message: 'it\'s cool bro',
      time: '12:11 PM',
      pendingMessages: '5',
    ),
    MessagesModel(
      profileImage: 'https://miro.medium.com/max/785/0*Ggt-XwliwAO6QURi.jpg',
      name: 'Kevin Liu',
      message: 'Can you help me ?',
      time: '11:11 PM',
    ),
    MessagesModel(
      profileImage:
          'https://www.best4geeks.com/wp-content/uploads/2018/08/21-smart-lady-profile-pic-2.jpg',
      name: 'Bob Julis',
      message: 'me: Okay',
      time: '10:11 PM',
    ),
    MessagesModel(
      profileImage:
          'https://cdn.fastly.picmonkey.com/contentful/h6goo9gw1hh6/6R0kusgfZmQv1jNcHSL9GU/f4c9517962f99704c3a0df849061b380/linkedIN-profile-FB.jpg',
      name: 'Erwin Jose',
      message: 'Can you help me ?',
      time: '9:11 PM',
    ),
  ];

  List<MessagesModel> groupChats = [
    MessagesModel(
      profileImage:
          'https://www.best4geeks.com/wp-content/uploads/2018/08/21-smart-lady-profile-pic-2.jpg',
      name: 'English Group',
      message: 'Can you help me ?',
      time: '2:11 PM',
      pendingMessages: '5',
    ),
    MessagesModel(
      profileImage:
          'https://www.best4geeks.com/wp-content/uploads/2018/08/21-smart-lady-profile-pic-2.jpg',
      name: 'Revision Group',
      message: 'Can you help me ?',
      time: '1:11 PM',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              padding: EdgeInsets.only(top: 70, left: 2, right: 2),
              child: Column(
                children: [
                  ListView.builder(
                      itemCount:
                          personalChats == null ? 0 : personalChats.length,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (BuildContext context, int index) {
                        return Row(
                          children: <Widget>[
                            Expanded(
                              child: Column(
                                children: [
                                  ListTile(
                                    leading: CircleAvatar(
                                      radius: 20,
                                      backgroundImage: NetworkImage(
                                          personalChats[index].profileImage),
                                    ),
                                    title: customText(personalChats[index].name,
                                        fontFamily: kFontBold,
                                        fontSize: kTextSizeLargeMedium),
                                    subtitle: customText(
                                        personalChats[index].message,
                                        isOverFlow: true,
                                        maxLine: 1,
                                        fontFamily: kFontMedium,
                                        fontSize: kTextSizeSMedium),
                                    trailing: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        customText(personalChats[index].time,
                                            fontSize: kTextSizeSMedium),
                                        personalChats[index].pendingMessages !=
                                                null
                                            ? Container(
                                                margin: const EdgeInsets.only(
                                                    top: 5.0),
                                                height: 22,
                                                width: 22,
                                                decoration: BoxDecoration(
                                                    color: sdSecondaryColorRed,
                                                    borderRadius:
                                                        BorderRadius.all(
                                                      Radius.circular(25.0),
                                                    )),
                                                child: Center(
                                                  child: Text(
                                                    personalChats[index]
                                                        .pendingMessages,
                                                    style: primaryTextStyle(
                                                        size: 11,
                                                        textColor:
                                                            Colors.white),
                                                  ),
                                                ),
                                              )
                                            : SizedBox(),
                                      ],
                                    ),
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => ChatRoom(
                                            name: personalChats[index].name,
                                            profileImages: personalChats[index]
                                                .profileImage,
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                  Divider(
                                    color: kDividerColor,
                                    height: 2,
                                  )
                                ],
                              ),
                            )
                          ],
                        );
                      })
                ],
              ),
            ),
            TopAppBar('Messages')
          ],
        ),
      ),
    );
  }
}
