import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:valem_application/pages/profile_page.dart';
import 'package:valem_application/services/firabase_service.dart';
import 'package:valem_application/services/models/otopark.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key, required this.title});
  final String title;

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  User user = FirebaseAuth.instance.currentUser!;
  Otopark? otopark;

  @override
  void initState() {
    super.initState();
    FirebaseService().getOtopark(user.uid).then((data) {
      otopark = data;
      setState(() {});
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Image.asset(
          'lib/assets/images/Logo_With_Text.png',
          fit: BoxFit.cover,
          height: 32,
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(_createAccountRoute());
            },
            icon: const Icon(Icons.account_circle),
            color: Colors.white,
          )
        ],
      ),
      body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Text("Hello, ${user.email}"),
                Text(otopark!.name),
              ],
            ),
          )),
    );
  }
}

Route _createAccountRoute() {
  return PageRouteBuilder(
    transitionDuration: const Duration(milliseconds: 500),
    pageBuilder: (context, animation, secondaryAnimation) => const ProfilePage(
      title: 'Hesabım',
    ),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(0.0, 1.0);
      const end = Offset.zero;
      const curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}
