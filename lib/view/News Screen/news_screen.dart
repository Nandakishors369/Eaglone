import 'dart:convert';
import 'dart:developer';

import 'package:eaglone/model/post.dart';
import 'package:eaglone/services/news_services.dart';
import 'package:eaglone/view/const.dart';
import 'package:eaglone/view/widgets/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart' as http;

class NewsScreen extends StatefulWidget {
  const NewsScreen({super.key});

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getNews();
  }

  /* getnewsData() async {
    final result = await getNewsData();
    log(result.title);
  } */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              kheigh20,
              Row(
                children: [
                  kwidth15,
                  appHeadings(content: "Top Tech News"),
                ],
              ),
              kheigh20,
              Visibility(
                /* visible: isLoaded,
                replacement: Center(
                  child: CircularProgressIndicator(),
                ), */
                child: FutureBuilder(
                    future: getNews(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return ListView.separated(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              String? imageUrl = snapshot
                                  .data!.articles![index].urlToImage
                                  .toString();
                              //Newsdata();
                              if (snapshot.data!.articles![index].urlToImage ==
                                  null) {
                                imageUrl =
                                    "https://images.unsplash.com/photo-1488590528505-98d2b5aba04b?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80";
                              }
                              return newsCard(
                                  imageUrl,
                                  snapshot.data!.articles![index].title
                                      .toString());
                            },
                            separatorBuilder: (context, index) {
                              return SizedBox(
                                height: 10.h,
                              );
                            },
                            itemCount: 50);
                      } else {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }

  Padding newsCard(String? newsImage, String newsTitle) {
    String imageLink =
        "https://images.unsplash.com/photo-1488590528505-98d2b5aba04b?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80";
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
      child: SizedBox(
        width: 400.w,
        height: 400.h,
        child: Card(
          elevation: 10,
          child: Column(
            children: [
              Image.network(
                newsImage ?? imageLink,
                fit: BoxFit.cover,
                height: 200,
                width: 400,
              ),
              kheigh20,
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: newsHeadings(content: newsTitle),
              )
            ],
          ),
        ),
      ),
    );
  }

/*   Newsdata() async {
    final _result = await getNewsData();
    log(_result.title);
  } */
}
