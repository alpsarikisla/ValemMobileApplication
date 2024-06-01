import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:valem_application/pages/login_page.dart';
import 'package:valem_application/pages/widget_tree.dart';
import 'package:valem_application/services/auth_service.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text(
          title,
          style: const TextStyle(color: Colors.white),
        ),
        elevation: 1,
        shadowColor: Colors.black,
      ),
      body: content(context),
    );
  }
}

Widget content(BuildContext context) {
  String mail = AuthService().getUser();
  return Column(
    children: [
      Container(
        height: 200,
        decoration: const BoxDecoration(
            color: Colors.orange,
            borderRadius: BorderRadius.only(bottomRight: Radius.circular(50))),
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.only(top: 60.0, left: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Text(
                "Merhaba",
                style: TextStyle(color: Colors.white, fontSize: 40),
              ),
              Text(
                mail,
                style: const TextStyle(color: Colors.white, fontSize: 17),
              ),
            ],
          ),
        ),
      ),
      const SizedBox(
        height: 80,
      ),
      ElevatedButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const LoginPage(
                    title: "Otopark Ayarları",
                  )));
        },
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.orange),
            minimumSize: MaterialStateProperty.all(const Size(300, 50)),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                //side: BorderSide(color: Colors.red),
              ),
            )),
        child: const Text(
          "Otopark Ayarları",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      const SizedBox(
        height: 20,
      ),
      ElevatedButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const LoginPage(
                    title: "Otopark Ayarları",
                  )));
        },
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.orange),
            minimumSize: MaterialStateProperty.all(const Size(300, 50)),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                //side: BorderSide(color: Colors.red),
              ),
            )),
        child: const Text(
          "Profil Ayarları",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      const SizedBox(
        height: 20,
      ),
      ElevatedButton(
        onPressed: () {
          FirebaseAuth.instance.signOut();
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(
                builder: (BuildContext context) => const WidgetTree(),
              ),
              (Route route) => false);
        },
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(HexColor("#EEEEEE")),
            minimumSize: MaterialStateProperty.all(const Size(300, 50)),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                //side: BorderSide(color: Colors.red),
              ),
            )),
        child: const Text(
          "Çıkış Yap",
          style: TextStyle(
            color: Colors.black45,
          ),
        ),
      ),
    ],
  );
}
