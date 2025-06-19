import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zeazn_invest_app/features/creator/chat/chat.dart';

class ZReportVM extends GetxController {
  static ZReportVM get instance => Get.find();

  final messageTEC = TextEditingController();

  final List<Message> messages = [
    Message(
      id: 1,
      title: 'Hi there',
      body:
          'Welcome to the report platform. Give feedback on projects or make a report',
      fromNumber: '6',
      toNumber: '2',
      createdAt:
          DateTime.now().subtract(Duration(minutes: 55)).toIso8601String(),
      updatedAt:
          DateTime.now().subtract(Duration(minutes: 30)).toIso8601String(),

      readStatus: 'read',
      readAt: null,
    ),
    Message(
      id: 2,
      title: 'Hi there',
      body:
          'Hi, Sarah I listened to some of your  music and i must say i really loved your voice',

      fromNumber: '2',
      toNumber: '5',
      createdAt:
          DateTime.now().subtract(Duration(minutes: 55)).toIso8601String(),
      updatedAt:
          DateTime.now().subtract(Duration(minutes: 30)).toIso8601String(),

      readStatus: 'read',
      readAt: null,
    ),
  ];
}
