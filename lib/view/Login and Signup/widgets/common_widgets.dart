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

Padding textField(
    {required String hint, required TextEditingController controller}) {
  return Padding(
    padding: const EdgeInsets.fromLTRB(20, 15, 20, 0),
    child: TextFormField(
      validator: (value) {
        if (value == null || value.trim().isEmpty) {
          return 'Field is required';
        }

        return null;
      },
      controller: controller,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      cursorColor: kblack, //
      decoration: InputDecoration(
        hintText: "$hint",
        hintStyle: GoogleFonts.karla(
          textStyle: TextStyle(),
        ),
        focusColor: kblack,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: kgrey),
          borderRadius: BorderRadius.circular(10.r),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: kgrey),
          borderRadius: BorderRadius.circular(10.r),
        ),
      ),
    ),
  );
}
