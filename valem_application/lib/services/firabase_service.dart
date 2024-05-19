import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:valem_application/services/models/otopark.dart';
import 'package:uuid/uuid.dart';

class FirebaseService {
  final carparks = FirebaseFirestore.instance.collection("CarParks");

  register(Otopark otopark) {
    var uuid = const Uuid().v1();
    carparks.doc(uuid).set({
      'id': uuid,
      'name': otopark.name,
      'phone': otopark.phone,
      'email': otopark.email,
      'password': otopark.password,
      'creationtime': otopark.creationtime
    });
  }
}
