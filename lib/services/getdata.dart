import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eaglone/model/free_courses.dart';
import 'package:eaglone/model/product_model.dart';

/* Stream<List<ProductModel>> getUsers() => FirebaseFirestore.instance
    .collection('freeCourses')
    .snapshots()
    .map((snapshot) =>
        snapshot.docs.map((doc) => ProductModel.fromJson(doc.data())).toList());
 */

Stream<List<ProductModel>> getCourses() {
  return FirebaseFirestore.instance.collection('freeCourses').snapshots().map(
      (snapshots) => snapshots.docs
          .map((doc) => ProductModel.fromJson(doc.data()))
          .toList());
}
