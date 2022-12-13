import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class PaidCourseScreen extends StatefulWidget {
  const PaidCourseScreen({super.key});

  @override
  State<PaidCourseScreen> createState() => _PaidCourseScreenState();
}

class _PaidCourseScreenState extends State<PaidCourseScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Text("hello")),
    );
  }
}
