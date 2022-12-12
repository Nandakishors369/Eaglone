import 'package:eaglone/view/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

Row subHeading(String heading) {
  return Row(
    children: [
      SizedBox(
        width: 25.w,
      ),
      Text(
        "$heading",
        style: GoogleFonts.karla(
            textStyle: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w600)),
      ),
    ],
  );
}

Padding textField(String hint) {
  return Padding(
    padding: const EdgeInsets.fromLTRB(20, 15, 20, 0),
    child: TextFormField(
      cursorColor: Color.fromARGB(255, 0, 0, 0),
      decoration: InputDecoration(
          hintText: "$hint",
          hintStyle: GoogleFonts.karla(textStyle: TextStyle()),
          focusColor: Colors.black,
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: kgrey),
              borderRadius: BorderRadius.circular(10.r)),
          border: OutlineInputBorder(
              borderSide: BorderSide(color: kgrey),
              borderRadius: BorderRadius.circular(10.r))),
    ),
  );
}
