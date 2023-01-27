import 'package:flutter/material.dart';
class Offer {
  int id;
  String title;
  String imageUrl;

  Offer({this.id, this.title, this.imageUrl});

  // Convert JSON data to Offer object
  factory Offer.fromJson(Map<String, dynamic> json) {
    return Offer(
      id: json['id'],
      title: json['title'],
      imageUrl: json['imageUrl'],
    );
  }
}
