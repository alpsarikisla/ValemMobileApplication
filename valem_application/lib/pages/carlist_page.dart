import 'package:flutter/material.dart';
import 'package:valem_application/services/firabase_service.dart';
import 'package:valem_application/services/models/car.dart';
import 'package:valem_application/widgets/car_widget.dart';

class ListPage extends StatelessWidget {
  const ListPage({super.key, required this.title});
  final String title;
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //drawer: NavBar(),
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text(
          title,
          style: const TextStyle(color: Colors.white),
        ),
        elevation: 1,
        shadowColor: Colors.black,
      ),
      //resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: FutureBuilder(
            future: FirebaseService().getAraclar(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              }
              final List<Car> araclar = snapshot.data!;
              return Column(
                children: List.generate(araclar.length, (index) {
                  final Car arac = araclar[index];
                  return CarWidget(
                    id: arac.id,
                    plaka: arac.plate,
                    tarih: arac.date,
                  );
                }),
              );
            },
          ),
        ),
      ),
    );
  }
}
