import 'dart:ui';

import 'package:eaglone/view/Domain%20Screen/domain_screen.dart';
import 'package:eaglone/view/Domain%20Search/Dsearch_screen.dart';
import 'package:eaglone/view/Home%20Screen/premium_screen.dart';
import 'package:eaglone/view/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../widgets/common_widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SlidingUpPanel(
          backdropEnabled: true,
          color: Color.fromRGBO(0, 0, 0, 0),
          minHeight: 335.h,
          maxHeight: 470.h,
          panel: Container(
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(20)),
              child: Column(
                children: [
                  kheight10,
                  DragIndicator(),
                  kheigh20,
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DomainScreen(),
                                ));
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(10)),
                            height: 124.h,
                            width: 190.w,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Align(
                                alignment: Alignment.bottomLeft,
                                child: Text(
                                  "Flutter",
                                  style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                      color: Color.fromARGB(255, 255, 255, 255),
                                      fontWeight: FontWeight.w500,
                                      fontSize: 35.sp,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: Color(0xFFEAD41C),
                              borderRadius: BorderRadius.circular(10)),
                          height: 124.h,
                          width: 190.w,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Align(
                              alignment: Alignment.bottomLeft,
                              child: Text(
                                "MERN",
                                style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                    color: Color.fromARGB(255, 255, 255, 255),
                                    fontWeight: FontWeight.w500,
                                    fontSize: 35.sp,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  kheigh20,
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 58, 58, 58),
                              borderRadius: BorderRadius.circular(10)),
                          height: 124.h,
                          width: 190.w,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Align(
                              alignment: Alignment.bottomLeft,
                              child: Text(
                                "Golang",
                                style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 35.sp,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: Color(0xFF2E6490),
                              borderRadius: BorderRadius.circular(10)),
                          height: 124.h,
                          width: 190.w,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Align(
                              alignment: Alignment.bottomLeft,
                              child: Text(
                                "Python",
                                style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 35.sp,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  kheigh20,
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DSearchScreen(),
                          ));
                    },
                    child: Container(
                      height: 60.h,
                      width: 380.w,
                      decoration: BoxDecoration(
                          color: themeGreen,
                          borderRadius: BorderRadius.circular(10)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                          child: Text(
                            "Explore All Courses",
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 25.sp,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              )),
          body: HomeBody(),
        ));
  }
}

class HomeBody extends StatelessWidget {
  const HomeBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(
      children: [
        kheigh20,
        Padding(
          padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CircleAvatar(
                backgroundColor: themeGreen,
                radius: 25.r,
              ),
              CircleAvatar(
                backgroundColor: themeGreen,
                radius: 25.r,
              )
            ],
          ),
        ),
        kheigh20,
        Row(
          children: [
            kwidth15,
            appHeadings(content: "Good Morning , Malik"),
          ],
        ),
        kheigh20,
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PremiumScreen(),
                  ));
            },
            child: Container(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    "Explore Premium \nCourses",
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 30.sp,
                      ),
                    ),
                  ),
                ),
              ),
              height: 168.h,
              width: 400.w,
              decoration: BoxDecoration(
                color: themeGreen,
                borderRadius: BorderRadius.circular(10.r),
              ),
            ),
          ),
        ),
        kheigh20,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 10,
            ),
            Container(
              height: 148.h,
              width: 190.w,
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: themeGreen, width: 2),
                  borderRadius: BorderRadius.circular(10.r)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    "Nothing \nHere",
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                        color: themeGreen,
                        fontWeight: FontWeight.w600,
                        fontSize: 30.sp,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            //kwidth15,
            Container(
              height: 148.h,
              width: 190,
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: themeGreen, width: 2),
                  borderRadius: BorderRadius.circular(10.r)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    "Nothing \nHere",
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                        color: themeGreen,
                        fontWeight: FontWeight.w600,
                        fontSize: 30.sp,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 10,
            )
          ],
        ),
        kheigh20,
        Row(
          children: [
            kwidth15,
            appHeadings(content: "Start Learning Now"),
          ],
        )
      ],
    ));
  }
}

class DragIndicator extends StatelessWidget {
  const DragIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey,
      height: 3.h,
      width: 40.w,
    );
  }
}
