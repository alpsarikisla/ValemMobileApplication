import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:valem_application/pages/login_page.dart';
import 'package:valem_application/pages/register_page.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key, required this.title});
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
      Container(
        height: 200,
        decoration: const BoxDecoration(
            color: Colors.orange,
            borderRadius: BorderRadius.only(bottomRight: Radius.circular(50))),
        width: double.infinity,
        child: const Padding(
          padding: EdgeInsets.only(top: 60.0, left: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Merhaba",
                style: TextStyle(color: Colors.white, fontSize: 40),
              ),
              Text(
                "Hesabınıza giriş yapın veya üye olun",
                style: TextStyle(color: Colors.white, fontSize: 17),
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
                    title: "Otopark Giriş",
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
          "Otopark Girişi Yap",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      const SizedBox(
        height: 20,
      ),
      // ElevatedButton(
      //   onPressed: () {},
      //   style: ElevatedButton.styleFrom(
      //     backgroundColor: Colors.grey,
      //     minimumSize: const Size(300, 50),
      //   ),
      //   child: const Text(
      //     "Otopark Kaydı Oluştur",
      //     style: TextStyle(
      //       color: Colors.white,
      //     ),
      //   ),
      // )
      ElevatedButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const RegisterPage(
                    title: "Otopark Kayıt",
                  )));
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
          "Otopark Kaydı Oluştur",
          style: TextStyle(
            color: Colors.black45,
          ),
        ),
      ),
    ],
  );
}
