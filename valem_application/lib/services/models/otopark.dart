import 'package:cloud_firestore/cloud_firestore.dart';

class Otopark {
  final String id;
  final String name;
  final String phone;
  final String email;
  final String password;
  final Timestamp creationtime;
  final num capacity;
  Otopark(
      {this.id = "",
      required this.name,
      required this.phone,
      required this.email,
      required this.password,
      required this.creationtime,
      required this.capacity});

  factory Otopark.fromJson(Map<String, dynamic> json) {
    return Otopark(
        id: json['userid'],
        name: json['name'],
        phone: json['phone'],
        email: json['email'],
        password: json['password'],
        creationtime: json['creationtime'],
        capacity: json['capacity']);
  }
}
