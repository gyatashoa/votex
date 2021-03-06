import 'package:firebase_auth/firebase_auth.dart';

class AuthServices {
  AuthServices();

  User? get currentUser => this._instance.currentUser;

  final FirebaseAuth _instance = FirebaseAuth.instance;

  Future signIn(String email, String password) async {
    try {
      var res = await _instance.signInWithEmailAndPassword(
          email: email, password: password);
      // ignore: unnecessary_null_comparison
      return res != null;
    } catch (e) {
      return e;
    }
  }

  Future signUp(String email, String password) async {
    try {
      var authResult = await _instance.createUserWithEmailAndPassword(
          email: email, password: password);
      return authResult.user != null;
    } catch (e) {
      return e;
    }
  }

  Future signOut() async {
    await _instance.signOut();
  }

  Future resetPassword(String email) async {
    try {
      await _instance.sendPasswordResetEmail(email: email);
    } catch (e) {
      return e;
    }
  }

  Future updateName(String name) async {
    try {
      await _instance.currentUser!.updateDisplayName(name);
      await _instance.currentUser!.reload();
    } catch (e) {
      return e;
    }
  }
}
