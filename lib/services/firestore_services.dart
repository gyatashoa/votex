import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:votex/app/app.locator.dart';
import 'package:votex/models/UserDetails_model.dart';
import 'package:votex/models/college_model.dart';
import 'package:votex/models/department_model.dart';
import 'package:votex/services/auth_services.dart';

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

  Future getUserDetails(Type t) async {
    try {
      var auth = locator<AuthServices>();
      var collection = _instance.collection(t.toString());
      var snapshot =
          await collection.where("id", isEqualTo: auth.currentUser!.uid).get();
      var doc = snapshot.docs[0];
      if (doc != null) {
        return UserDetails.fromJson(doc.data());
      }
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
