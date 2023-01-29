import 'dart:convert';
import 'dart:developer';

import 'package:eaglone/model/mongo_model.dart';
import 'package:eaglone/view/const.dart';
import 'package:mongo_dart/mongo_dart.dart';

//var db = Db.create(MONGO_URL);

class MongoDatabase {
  static connect() async {
    var db = await Db.create(MONGO_URL);
    await db.open();
    var status = db.serverStatus();
    print(status);
    inspect(db);
    /* var collection = db.collection(COLLECTION);
    collection.insertOne({"name": "eaglone", "email": "eaglone@gmial.com"}); */
    /* print(await collection.find().toList()); */
  }
}

Future<List<Map<String, dynamic>>> getDocuments() async {
  var db = await Db.create(MONGO_URL);
  await db.open();
  var collection = db.collection(COLLECTION);
  final test = await jsonDecode(collection.find().toString());
  log(test.toString());
  final users = await collection.find().toList();
  log(users.toString());
  return users;
}

Future<void> insertUser() async {
  var db = await Db.create(MONGO_URL);
  await db.open();
  var collection = db.collection(COLLECTION);
  await collection.insert({"hello": "name"});
  await db.close();
}
