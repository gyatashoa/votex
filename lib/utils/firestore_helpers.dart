import 'package:votex/app/app.locator.dart';
import 'package:votex/models/UserDetails_model.dart';
import 'package:votex/models/college_model.dart';
import 'package:votex/models/department_model.dart';
import 'package:votex/models/hiveUserDetails_model.dart';
import 'package:votex/services/firestore_services.dart';

class FirestoreHelpers {
  static var _firestoreServices = locator<FirestoreServices>();
  static Future getHiveUserDetails() async {
    try {
      UserDetails userdetails =
          await _firestoreServices.getUserDetails(UserDetails);
      List<College> cols = await _firestoreServices.getColleges();
      List<Department> deps = await _firestoreServices.getDepartments();
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
