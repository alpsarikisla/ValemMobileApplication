//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
//import 'package:valem_application/services/firabase_service.dart';
//import 'package:valem_application/services/models/otopark.dart';
//import 'package:fluttertoast/fluttertoast.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key, required this.title});
  final String title;
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController mailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: const Text(
          "Giriş Ekranı",
          style: TextStyle(color: Colors.white),
        ),
        elevation: 1,
        shadowColor: Colors.black,
      ),
      body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 30,
                  width: double.infinity,
                ),
                TextFormField(
                  controller: mailController,
                  decoration: InputDecoration(
                    labelText: 'Mail Adresi',
                    labelStyle: const TextStyle(color: Colors.black),
                    prefixIcon: const Icon(Icons.mail),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.grey),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.orange),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                  width: double.infinity,
                ),
                TextFormField(
                  controller: passwordController,
                  decoration: InputDecoration(
                    labelText: 'Şifre',
                    labelStyle: const TextStyle(color: Colors.black),
                    prefixIcon: const Icon(Icons.lock_open),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.grey),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.orange),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  obscureText: true,
                  enableSuggestions: false,
                  autocorrect: false,
                ),
                const SizedBox(
                  height: 20,
                  width: double.infinity,
                ),
                ElevatedButton(
                  onPressed: signIn,
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.orange),
                      minimumSize:
                          MaterialStateProperty.all(const Size(300, 50)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          //side: BorderSide(color: Colors.red),
                        ),
                      )),
                  child: const Text(
                    "Otopark Giriş",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }

  signIn() async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: mailController.text, password: passwordController.text);
      Fluttertoast.showToast(
        msg: "Giriş Başarılı",
        timeInSecForIosWeb: 3,
        gravity: ToastGravity.CENTER,
        backgroundColor: Colors.green,
      );
    } on FirebaseAuthException catch (e) {
      Fluttertoast.showToast(
        msg: e.code,
        timeInSecForIosWeb: 3,
        gravity: ToastGravity.CENTER,
        backgroundColor: Colors.red,
      );
    }
  }
}
