import 'package:flutter/animation.dart';

class ProductModel {
  String heading;
  String inHead1;
  String img1;
  String inHead1Des;
  String inHead2;
  String img2;
  String inHead2Des;
  String intro;
  String installUrl;

  ProductModel({
    required this.heading,
    required this.inHead1,
    required this.img1,
    required this.inHead1Des,
    required this.inHead2,
    required this.img2,
    required this.inHead2Des,
    required this.intro,
    required this.installUrl,
  });

  Map<String, dynamic> toJson() => {
        'heading': heading,
        'inHead1': inHead1,
        'img1': img1,
        'inHead1Des': inHead1Des,
        'inHead2': inHead2,
        'img2': img2,
        'inHead2Des': inHead2Des,
        'intro ': intro,
        'installUrl': installUrl,
      };

  static ProductModel fromJson(Map<String, dynamic> json) => ProductModel(
        heading: json['heading'],
        inHead1: json['inHead1'],
        img1: json['img1'],
        inHead1Des: json['inHead1Des'],
        inHead2: json['inHead2'],
        img2: json['img2'],
        inHead2Des: json['inHead2Des'],
        intro: json['intro'],
        installUrl: json['installUrl'],
      );
}
