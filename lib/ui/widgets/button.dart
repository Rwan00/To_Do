import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../theme.dart';

class MyButton extends StatelessWidget {

  final String label;
  final Function() onTap;

  const MyButton(this.label,this.onTap,{super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        width: width * 0.25,
        height: height*0.05,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Get.isDarkMode? secondaryClr : primaryClr,
        ),
        child: Text(label,style: GoogleFonts.lato(color: Colors.white),textAlign: TextAlign.center,),
      ),
    );
  }
}
