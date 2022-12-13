import 'package:eaglone/view/const.dart';
import 'package:eaglone/view/widgets/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class PlaylistScreen extends StatefulWidget {
  const PlaylistScreen({super.key});

  @override
  State<PlaylistScreen> createState() => _PlaylistScreenState();
}

class _PlaylistScreenState extends State<PlaylistScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            kheigh20,
            Row(
              children: [kwidth15, appHeadings(content: "Dart - Fundementals")],
            ),
            kheight10,
            kheigh20,
            ListView.separated(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return newsCard();
                },
                separatorBuilder: (context, index) {
                  return SizedBox(
                    height: 10,
                  );
                },
                itemCount: 6)
          ],
        ),
      )),
    );
  }

  Padding newsCard() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
      child: SizedBox(
        width: 400,
        height: 400,
        child: Card(
          elevation: 10,
          child: Column(
            children: [
              Image.network(
                "https://images.unsplash.com/photo-1488590528505-98d2b5aba04b?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80",
                fit: BoxFit.cover,
              ),
              kheigh20,
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: appHeadings(content: "Heading Will be Displayed Here"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
