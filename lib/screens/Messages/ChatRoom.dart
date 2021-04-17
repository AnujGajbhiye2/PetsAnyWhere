import 'package:flutter/material.dart';
import 'package:paw/utilities/utilities.dart';

import '../../constants.dart';

class ChatRoom extends StatefulWidget {
  ChatRoom({this.name, this.profileImages});

  final String name;
  final String profileImages;
  @override
  _ChatRoomState createState() => _ChatRoomState();
}

class _ChatRoomState extends State<ChatRoom> {
  TextEditingController _text = new TextEditingController();
  ScrollController _scrollController = ScrollController();
  var childList = <Widget>[];

  @override
  void initState() {
    super.initState();
    childList.add(Align(
        alignment: Alignment(0, 0),
        child: FittedBox(
          child: Container(
            padding: EdgeInsets.fromLTRB(10, 4, 10, 4),
            margin: const EdgeInsets.only(top: 5.0),
            decoration: boxDecorations(bgColor: sdViewColor),
            child: Center(
                child: Text(
              "Today",
              style: TextStyle(fontSize: 11),
            )),
          ),
        )));
    childList.add(Align(
      alignment: Alignment(1, 0),
      child: SentMessageWidget(
        content: 'Hello ${widget.name}',
        time: '01:36 PM',
      ),
    ));
    childList.add(Align(
      alignment: Alignment(1, 0),
      child: SentMessageWidget(
        content: 'How are you? What are you doing?',
        time: '01:36 PM',
      ),
    ));
    childList.add(Align(
      alignment: Alignment(-1, 0),
      child: ReceivedMessageWidget(
        content: 'Hello, Mark.I am fine. How are you?',
        time: '01:40 PM',
      ),
    ));
    childList.add(Align(
      alignment: Alignment(1, 0),
      child: SentMessageWidget(
        content: 'I am good. Can you do something for me? I need your help.',
        time: '01:40 PM',
      ),
    ));
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 65,
                    color: kSecondaryColor,
                    child: Row(
                      children: [
                        IconButton(
                          icon: Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                          ),
                          onPressed: () => {Navigator.pop(context)},
                        ),
                        Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          height: 40,
                          width: 40,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(40),
                            child: FadeInImage(
                              fit: BoxFit.cover,
                              placeholder: AssetImage(
                                'Loading',
                              ),
                              image: Image.network(
                                widget.profileImages == null
                                    ? 'https://i.insider.com/5de6dd81fd9db241b00c04d3?width=1100&format=jpeg&auto=webp'
                                    : widget.profileImages,
                                height: 35,
                                width: 10,
                              ).image,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              customText(
                                  widget.name == null
                                      ? 'Anuj Gajbhiye'
                                      : widget.name,
                                  fontSize: kTextSizeMedium,
                                  fontFamily: kFontBold,
                                  textColor: kFullWhite),
                              Container(
                                margin: EdgeInsets.only(top: 2),
                                child: customText("online",
                                    textColor: kFullWhite,
                                    fontFamily: kFontMedium,
                                    fontSize: kTextSizeSMedium),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Flexible(
                    fit: FlexFit.tight,
                    child: SingleChildScrollView(
                      controller: _scrollController,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [...childList],
                      ),
                    ),
                  ),
                  Divider(height: 0, color: Colors.black26),
                  Container(
                      padding: EdgeInsets.only(
                        top: 5,
                      ),
                      height: 75,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.only(top: 5),
                              margin: EdgeInsets.only(
                                  bottom: 10, left: 15, right: 5),
                              decoration: boxDecoration2(
                                  radius: 5,
                                  backGroundColor: Colors.white60,
                                  blurRadius: 0,
                                  spreadRadius: 0),
                              child: TextField(
                                style: TextStyle(fontSize: 20),
                                controller: _text,
                                maxLines: 15,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Type your message',
                                  hintStyle: secondaryTextStyle(),
                                  suffixIcon: Icon(Icons.attach_file),
                                  prefixIcon: Icon(Icons.insert_emoticon),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(right: 10, bottom: 15),
                            child: CircleAvatar(
                              radius: 30,
                              backgroundColor: sdPrimaryColor,
                              child: IconButton(
                                icon: Icon(
                                  Icons.send,
                                  color: Colors.white,
                                  size: 20,
                                ),
                                onPressed: () {},
                              ),
                            ),
                          ),
                        ],
                      )),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

Widget ReceivedMessageWidget({String content, String time}) {
  return Container(
      child: Padding(
    padding:
        const EdgeInsets.only(right: 75.0, left: 8.0, top: 8.0, bottom: 8.0),
    child: Container(
      decoration: boxDecorations(showShadow: true, radius: 6),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Container(
              child: Padding(
                padding: const EdgeInsets.only(
                    right: 8.0, left: 8.0, top: 8.0, bottom: 15.0),
                child: customText(content,
                    fontFamily: kFontMedium,
                    fontSize: kTextSizeMedium,
                    textColor: kFullBlack),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Text(
              time,
              style: TextStyle(fontSize: 10, color: Colors.black),
            ),
          ),
        ],
      ),
    ),
  ));
}

// ignore: non_constant_identifier_names
Widget SentMessageWidget({String content, String time}) {
  return Container(
    child: Padding(
      padding:
          const EdgeInsets.only(right: 8.0, left: 50.0, top: 4.0, bottom: 4.0),
      child: ClipRRect(
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(5),
            bottomRight: Radius.circular(5),
            topLeft: Radius.circular(5),
            topRight: Radius.circular(5)),
        child: Container(
          color: kSecondaryColor,
          // margin: const EdgeInsets.only(left: 10.0),
          child: Stack(children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(
                  right: 12.0, left: 12.0, top: 8.0, bottom: 16.0),
              child: customText(content,
                  fontSize: kTextSizeMedium.toDouble(),
                  fontFamily: kFontMedium,
                  textColor: kFullWhite),
              // ** this contains the formula for multiline
              //     Text(
              //   content,
              //   style: primaryTextStyle(size: 14, textColor: Colors.white),
              // ),
            ),
            Positioned(
              bottom: 2,
              right: 10,
              child: Text(
                time,
                style:
                    TextStyle(fontSize: 10, color: Colors.white.withOpacity(1)),
              ),
            )
          ]),
        ),
      ),
    ),
  );
}
