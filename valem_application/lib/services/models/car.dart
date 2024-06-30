import 'package:cloud_firestore/cloud_firestore.dart';

class Car {
  final String id;
  final String plate;
  final String userid;
  final Timestamp date;
  Car(
      {this.id = "",
      required this.plate,
      required this.userid,
      required this.date});

  factory Car.fromJson(Map<String, dynamic> json) {
    return Car(
        id: json['id'],
        plate: json['plate'],
        userid: json['userid'],
        date: json['date']);
  }
}
