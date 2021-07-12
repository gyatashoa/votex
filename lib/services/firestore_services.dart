import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:votex/app/app.locator.dart';
import 'package:votex/models/UserDetails_model.dart';
import 'package:votex/models/college_model.dart';
import 'package:votex/models/department_model.dart';
import 'package:votex/models/hiveUserDetails_model.dart';
import 'package:votex/models/voting_data_model.dart';
import 'package:votex/services/auth_services.dart';

class FirestoreServices {
  FirestoreServices();

  final _instance = FirebaseFirestore.instance;

  Future<QuerySnapshot<VotingDataModel>>? searchForPolls(Type t) async {
    try {
      return await _instance
          .collection(t.toString())
          .withConverter<VotingDataModel>(
              fromFirestore: (doc, _) =>
                  VotingDataModel.fromJson({...doc.data()!, "id": doc.id}),
              toFirestore: (data, _) => data.toJson())
          .get();
    } catch (e) {
      throw new Exception(e);
    }
  }

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
      var doc = snapshot.docs.first;
      if (doc == null) {
        return null;
      }
      return UserDetails.fromJson(doc.data(), auth.currentUser!);
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

  Stream<DocumentSnapshot> getVotingDataModel(Type t) {
    return this._instance.collection(t.toString()).doc().snapshots();
  }

  Future getHiveUserDetails() async {
    try {
      UserDetails userdetails = await getUserDetails(UserDetails);
      List<College> cols = await getColleges();
      List<Department> deps = await getDepartments();
      late Department userDepartment;
      late College userCollege;

      deps.forEach((element) {
        if (element.id == userdetails.departmentId) userDepartment = element;
      });

      cols.forEach((element) {
        if (element.id == userdetails.collegeId) userCollege = element;
      });

      return HiveUserDetails()
        ..collegeId = userCollege.id
        ..collegeName = userCollege.name
        ..departmentId = userDepartment.id
        ..departmentName = userDepartment.name
        ..dob = userdetails.dob;
    } catch (e) {
      return e;
    }
  }
}
