import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseService {
  final araclarCol = FirebaseFirestore.instance.collection("araclar");

  Register(Arac arac) {
    var uuid = const Uuid().v1();
    araclarCol
        .doc(uuid)
        .set({'id': uuid, 'plaka': arac.plaka, 'tarih': arac.tarih});
  }
}
