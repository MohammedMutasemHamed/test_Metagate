import 'package:flutter/material.dart';

class DeviceModel {
  String? id;
  String? type;
  num? price;
  String? currency;
  bool? isFavorite;

  IconData? imageUrl; //TODO must change to string
  String? title;
  String? description;

  DeviceModel(
      {id, type, price, currency, isFavorite, imageUrl, title, description});

  DeviceModel.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    type = json['Type'];
    price = json['Price'];
    currency = json['Currency'];
    isFavorite = json['isFavorite'];
    imageUrl = json['imageUrl'];
    title = json['Title'];
    description = json['Description'];
  }
}
