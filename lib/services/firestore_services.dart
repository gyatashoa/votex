import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:votex/models/college_model.dart';
import 'package:votex/models/department_model.dart';

class FirestoreServices {
  FirestoreServices();

  final _instance = FirebaseFirestore.instance;

  Future uploadData(Map<String, dynamic> data, Type t) async {
    try {
      var collection = _instance.collection(t.toString());
      await collection.doc(data['id']).set(data);
      return;
    } catch (e) {
      return e;
    }
  }

  Future getColleges() async {
    try {
      var snapshot = await _instance.collection('College').get();
      var res = snapshot.docs.map((e) => {...e.data(), 'id': e.id}).toList();
      var cleanedData = res.map((e) => College.fromJson(e)).toList();
      return cleanedData;
    } catch (e) {
      print(e);
      return e;
    }
  }

  Future getDepartments() async {
    try {
      var snapshot = await _instance.collection('Department').get();
      var res = snapshot.docs.map((e) => {...e.data(), 'id': e.id}).toList();
      var cleanedData = res.map((e) => Department.fromJson(e)).toList();
      return cleanedData;
    } catch (e) {
      print(e);
      return e;
    }
  }
}
