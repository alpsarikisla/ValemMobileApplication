import 'package:flutter/material.dart';
import 'package:valem_application/services/auth_service.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key, required this.title});
  final String title;
  @override
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
              //Navigator.of(context).push(_createAccountRoute());
            },
            icon: const Icon(Icons.account_circle),
            color: Colors.white,
          )
        ],
      ),
      body: content(context),
    );
  }
}

Widget content(BuildContext context) {
  String mail = AuthService().getUser();
  int count = 5;
  return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Text("Hello, $mail"),
            Text("Deneme $count"),
          ],
        ),
      ));
}
