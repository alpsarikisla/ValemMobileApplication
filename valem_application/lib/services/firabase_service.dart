import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:valem_application/services/models/otopark.dart';
import 'package:uuid/uuid.dart';
import 'package:valem_application/services/models/price.dart';

class FirebaseService {
  final carparks = FirebaseFirestore.instance.collection("CarParks");
  final priceCollection = FirebaseFirestore.instance.collection("Prices");
  register(Otopark otopark) {
    var uuid = const Uuid().v1();
    carparks.doc(uuid).set({
      'id': uuid,
      'name': otopark.name,
      'phone': otopark.phone,
      'email': otopark.email,
      'password': otopark.password,
      'creationtime': otopark.creationtime,
      'capacity': otopark.capacity
    });
  }

  Future<Otopark> getOtopark(String id) async {
    final Map<String, dynamic>? otoparkDoc =
        await carparks.doc(id).get().then((value) => value.data());
    final otoparkModel = Otopark.fromJson(otoparkDoc as Map<String, dynamic>);
    return otoparkModel;
  }

  Future<Price> getPrice(String id) async {
    final Map<String, dynamic>? priceDoc =
        await priceCollection.doc(id).get().then((value) => value.data());
    final priceModel = Price.fromJson(priceDoc as Map<String, dynamic>);
    return priceModel;
  }

  Future<void> updatePrice(
      String userid, num entranceprice, num hourlyprice) async {
    try {
      priceCollection
          .doc(userid)
          .update({'entranceprice': entranceprice, "hourlyprice": hourlyprice});
      Fluttertoast.showToast(
          msg: "Otopark Ayarları Kaydedildi",
          timeInSecForIosWeb: 3,
          gravity: ToastGravity.CENTER,
          backgroundColor: Colors.green,
          toastLength: Toast.LENGTH_LONG);
    } catch (e) {
      Fluttertoast.showToast(
          msg: "Hata Oluştu",
          timeInSecForIosWeb: 3,
          gravity: ToastGravity.CENTER,
          backgroundColor: Colors.red,
          toastLength: Toast.LENGTH_LONG);
    }
  }
}
