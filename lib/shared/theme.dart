import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:supercharged/supercharged.dart';

const double defaultMargin = 24;

Color greyColor = "8D92A3".toColor();
Color mainColor = "FFC700".toColor();
TextStyle greyFontStyle = GoogleFonts.poppins().copyWith(color: greyColor);
TextStyle blackFontStyle1 = GoogleFonts.poppins()
    .copyWith(color: Colors.black, fontSize: 22, fontWeight: FontWeight.w500);
TextStyle blackFontStyle2 = GoogleFonts.poppins()
    .copyWith(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w500);
TextStyle blackFontStyle3 = GoogleFonts.poppins().copyWith(color: Colors.black);

Widget loadingIndicator = SpinKitFadingCircle(
  size: 45,
  color: mainColor,
);

String emailValidator(String value) {
  //Toast.show(value, context, duration: 3, gravity: Toast.BOTTOM);
  if (value.length == 0) {
    // Toast.show("Email Tidak Boleh Kosong", context,
    //     duration: 3, gravity: Toast.BOTTOM);
    return "Email is Required";
  } else if (!value.contains('@')) {
    return "Email is Invalid";
  } else {
    return null;
  }
}

String nameValidator(String value) {
  if (value.length < 4) {
    return "name must be length 4";
  } else {
    return null;
  }
}
