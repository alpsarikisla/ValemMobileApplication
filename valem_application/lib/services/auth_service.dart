import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AuthService {
  final userCollection = FirebaseFirestore.instance.collection("CarParks");
  final firebaseAuth = FirebaseAuth.instance;

  Future<bool> signup(
      {required String name,
      required String phone,
      required String email,
      required String password,
      required Timestamp creationtime}) async {
    try {
      final UserCredential usercredential = await firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);

      if (usercredential.user != null) {
        _registerUser(
            userid: usercredential.user!.uid,
            name: name,
            phone: phone,
            email: email,
            password: password,
            creationtime: creationtime);
      }
      return true;
    } on FirebaseAuthException catch (e) {
      Fluttertoast.showToast(
        msg: e.message!,
        timeInSecForIosWeb: 3,
        gravity: ToastGravity.CENTER,
        backgroundColor: Colors.red,
      );
      return false;
    }
  }

  Future<bool> signIn(
    BuildContext context, {
    required String email,
    required String password,
  }) async {
    try {
      await firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      Fluttertoast.showToast(
          msg: 'Giriş Başarılı',
          timeInSecForIosWeb: 3,
          gravity: ToastGravity.CENTER,
          backgroundColor: Colors.green,
          toastLength: Toast.LENGTH_LONG);
      return true;
    } on FirebaseAuthException catch (e) {
      Fluttertoast.showToast(
          msg: e.message!,
          timeInSecForIosWeb: 3,
          gravity: ToastGravity.CENTER,
          backgroundColor: Colors.red,
          toastLength: Toast.LENGTH_LONG);
      return false;
    }
  }

  Future<void> _registerUser(
      {required String userid,
      required String name,
      required String phone,
      required String email,
      required String password,
      required Timestamp creationtime}) async {
    await userCollection.doc(userid).set({
      'userid': userid,
      'name': name,
      'phone': phone,
      'email': email,
      'password': password,
      'creationtime': creationtime
    });
  }

  String getUser() {
    final User user = FirebaseAuth.instance.currentUser!;
    return user.email!;
  }
}
