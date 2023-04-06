import 'package:flutter/material.dart';

import 'device_model.dart';

class DevicesModel {
  List<DeviceModel>? devices;

  DevicesModel({devices});

  DevicesModel.fromJson(Map<String, dynamic> json) {
    if (json['devices'] != null) {
      devices = <DeviceModel>[];
      json['devices'].forEach((v) {
        devices!.add(DeviceModel.fromJson(v));
      });
    }
  }
}

var devices = DevicesModel.fromJson(devicesList);

var devicesList = {
  "devices": [
    {
      "Id": "1",
      "Type": "sensor",
      "Price": 75,
      "Currency": "USD",
      "isFavorite": false,
      "imageUrl": Icons.ac_unit_outlined,
      "Title": "Sensor cold",
      "Description":
          "this is some description for this device it must be more then it etc"
    },
    {
      "Id": "2",
      "Type": "robot",
      "Price": 99.99,
      "Currency": "USD",
      "isFavorite": true,
      "imageUrl": Icons.adb_rounded,
      "Title": "Thermostat robot",
      "Description":
          "this is some description for this device it must be more then it etc"
    },
    {
      "Id": "3",
      "Type": "rocket",
      "Price": 25,
      "Currency": "USD",
      "isFavorite": false,
      "imageUrl": Icons.rocket_launch,
      "Title": "Rocket launch",
      "Description":
          "this is some description for this device it must be more then it etc"
    },
    {
      "Id": "4",
      "Type": "spear",
      "Price": 45,
      "Currency": "USD",
      "isFavorite": true,
      "imageUrl": Icons.multiline_chart,
      "Title": "Spear",
      "Description":
          "this is some description for this device it must be more then it etc"
    },
    {
      "Id": "5",
      "Type": "sentiment",
      "Price": 67,
      "Currency": "USD",
      "isFavorite": false,
      "imageUrl": Icons.sentiment_very_satisfied_rounded,
      "Title": "Sentiment device",
      "Description":
          "this is some description for this device it must be more then it etc"
    },
    {
      "Id": "6",
      "Type": "manufacture",
      "Price": 250,
      "Currency": "USD",
      "isFavorite": true,
      "imageUrl": Icons.precision_manufacturing,
      "Title": "Manufacture device",
      "Description":
          "this is some description for this device it must be more then it etc"
    },
    {
      "Id": "7",
      "Type": "coffee",
      "Price": 284,
      "Currency": "USD",
      "isFavorite": true,
      "imageUrl": Icons.coffee,
      "Title": "Coffee device",
      "Description":
          "this is some description for this device it must be more then it etc"
    },
    {
      "Id": "8",
      "Type": "propane",
      "Price": 78,
      "Currency": "USD",
      "isFavorite": true,
      "imageUrl": Icons.propane_tank_outlined,
      "Title": "Propane device",
      "Description":
          "this is some description for this device it must be more then it etc"
    }
  ]
};
