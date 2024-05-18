import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key, required this.title});
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
  return Column(
    children: [
      const TextField(),
      const SizedBox(
        height: 80,
        width: double.infinity,
      ),
      ElevatedButton(
        onPressed: () {},
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
          "Otopark Girişi Yap",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    ],
  );
}
