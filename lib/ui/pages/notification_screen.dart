import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../theme.dart';

class NotificationScreen extends StatefulWidget {
  final String payload;

  const NotificationScreen( {required this.payload,super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  String _payload = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _payload = widget.payload;
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: context.theme.colorScheme.background,
      appBar: AppBar(
        title: Text(
            (_payload.split("|")[0]).toUpperCase(),
            style: headingStyle.copyWith(fontStyle: FontStyle.italic)
        ),
        centerTitle: true,
        backgroundColor: context.theme.colorScheme.background.withOpacity(0.7),
        elevation: 10,
        shadowColor:_getBGClr(int.parse(_payload.split("|")[3])),
        leading: IconButton(
          icon:  Icon(Icons.arrow_back,color: Get.isDarkMode? Colors.white : primaryClr,size: 30,),
          onPressed: () => Get.back(),
        ),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: height * 0.045,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Hello, Welcome Back",
                    style: subHeadingStyle,
                  ),
                  SizedBox(
                    height: height*0.01,
                  ),
                  Text(
                    "You Have a New Reminder",
                    style: subTitleStyle.copyWith(color: Colors.grey[500]),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: height*0.02,
            ),
            Container(
              height: height*0.35,
              padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 20),
              margin: const EdgeInsets.symmetric(horizontal: 30),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color:_getBGClr(int.parse(_payload.split("|")[3])),
              ),
              child: SingleChildScrollView(
                child: Column(
                  //crossAxisAlignment: CrossAxisAlignment.start,
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Icon(
                          Icons.title,
                          size: 30,
                          color:Get.isDarkMode? secondaryClr :Colors.white,
                        ),
                        SizedBox(
                          width: width*0.03,
                        ),
                        Text(
                          "Title",
                          style:
                          headingStyle.copyWith(color:Get.isDarkMode? secondaryClr : Colors.white),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: height*0.02,
                    ),
                    Text(
                        _payload.split("|")[0],
                        style: subTitleStyle
                    ),
                    SizedBox(
                      height: height*0.035,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Icon(
                          Icons.article,
                          size: 30,
                          color:Get.isDarkMode? secondaryClr :Colors.white,
                        ),
                        SizedBox(
                          width: width*0.03,
                        ),
                        Text(
                          "Description",
                          style:
                          headingStyle.copyWith(color: Get.isDarkMode? secondaryClr :Colors.white),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: height*0.01,
                    ),
                    Text(
                      _payload.split("|")[1],
                      style: subTitleStyle,
                      textAlign: TextAlign.justify,
                    ),
                    SizedBox(
                      height: height*0.04,
                    ),
                    Row(
                      children: <Widget>[
                        Icon(
                          Icons.calendar_month_outlined,
                          size: 30,
                          color: Get.isDarkMode? secondaryClr :Colors.white,
                        ),
                        SizedBox(
                          width: width*0.03,
                        ),
                        Text(
                          "Date",
                          style:
                          headingStyle.copyWith(color: Get.isDarkMode? secondaryClr :Colors.white),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: height*0.01,
                    ),
                    Text(
                      _payload.split("|")[2],
                      style: subTitleStyle,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: height*0.01,
            ),
          ],
        ),
      ),
    );
  }
  _getBGClr(int? color) {
    switch (color) {
      case 0:
        return primaryClr;
      case 1:
        return pinkClr;
      case 2:
        return orangeClr;
      default:
        return primaryClr;
    }
  }
}
