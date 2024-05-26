import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final userCollection = FirebaseFirestore.instance.collection("CarParks");
  final firebaseAuth = FirebaseAuth.instance;

  Future<void> signup(
      {required String name,
      required String phone,
      required String email,
      required String password,
      required Timestamp creationtime}) async {
    final UserCredential usercredential = await firebaseAuth
        .createUserWithEmailAndPassword(email: email, password: password);
    if (usercredential.user != null) {
      _registerUser(
          name: name,
          phone: phone,
          email: email,
          password: password,
          creationtime: creationtime);
    }
  }

  Future<void> _registerUser(
      {required String name,
      required String phone,
      required String email,
      required String password,
      required Timestamp creationtime}) async {
    await userCollection.doc().set({
      'name': name,
      'phone': phone,
      'email': email,
      'password': password,
      'creationtime': creationtime
    });
  }
}
