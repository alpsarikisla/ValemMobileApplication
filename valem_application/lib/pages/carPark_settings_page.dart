import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:valem_application/pages/profile_page.dart';

import 'package:valem_application/services/firabase_service.dart';
import 'package:valem_application/services/models/price.dart';

class CarparkSettings extends StatefulWidget {
  const CarparkSettings({super.key, required this.title});
  final String title;

  @override
  State<CarparkSettings> createState() => _CarparkSettingsState();
}

class _CarparkSettingsState extends State<CarparkSettings> {
  User user = FirebaseAuth.instance.currentUser!;
  Price? price;
  String entranceValue = "0";
  String hourlyValue = "0";
  @override
  void initState() {
    super.initState();
    FirebaseService().getPrice(user.uid).then(
      (data) {
        price = data;
        entranceValue = price!.entranceprice.toString();
        hourlyValue = price!.hourlyprice.toString();
        setState(() {});
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    if (price == null) {
      return Container();
    }
    final TextEditingController entrancepricecontroller =
        TextEditingController(text: entranceValue);
    final TextEditingController hourlypricecontroller =
        TextEditingController(text: hourlyValue);

    updatePrice() {
      FirebaseService()
          .updatePrice(user.uid, num.parse(entrancepricecontroller.text),
              num.parse(hourlypricecontroller.text))
          .then((value) => {
                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                    builder: (BuildContext context) =>
                        const ProfilePage(title: "Hesabım"),
                  ),
                  (Route route) => false,
                )
              });
      FocusScope.of(context).unfocus();
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text(
          widget.title,
          style: const TextStyle(color: Colors.white),
        ),
        elevation: 1,
        shadowColor: Colors.black,
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          Container(
            height: 120,
            decoration: const BoxDecoration(
                color: Colors.orange,
                borderRadius:
                    BorderRadius.only(bottomRight: Radius.circular(50))),
            width: double.infinity,
            child: const Padding(
              padding: EdgeInsets.only(top: 10, left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Merhaba",
                    style: TextStyle(color: Colors.white, fontSize: 30),
                  ),
                  Text(
                    "Otopark ücretlendirme ayarları",
                    style: TextStyle(color: Colors.white, fontSize: 17),
                  ),
                ],
              ),
            ),
          ),
          Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(16.0),
                  ),
                  const Row(
                    children: <Widget>[Text("Giriş Ücreti"), Spacer()],
                  ),
                  TextFormField(
                    controller: entrancepricecontroller,
                    decoration: InputDecoration(
                      labelText: '0',
                      labelStyle: const TextStyle(color: Colors.black),
                      prefixIcon: const Icon(Icons.price_change),
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
                    height: 10,
                  ),
                  const Row(
                    children: <Widget>[Text("Saatlik Ücret"), Spacer()],
                  ),
                  TextFormField(
                    controller: hourlypricecontroller,
                    decoration: InputDecoration(
                      labelText: '0',
                      labelStyle: const TextStyle(color: Colors.black),
                      prefixIcon: const Icon(Icons.price_check),
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
                    height: 10,
                  ),
                  TextFormField(
                    controller: hourlypricecontroller,
                    decoration: InputDecoration(
                      labelText: '0',
                      labelStyle: const TextStyle(color: Colors.black),
                      prefixIcon: const Icon(Icons.price_check),
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
                    height: 10,
                  ),
                  ElevatedButton(
                    onPressed: updatePrice,
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.orange),
                        minimumSize:
                            MaterialStateProperty.all(const Size(300, 50)),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            //side: BorderSide(color: Colors.red),
                          ),
                        )),
                    child: const Text(
                      "Ayarları Kaydet",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ))),
        ],
      )),
    );
  }
}
