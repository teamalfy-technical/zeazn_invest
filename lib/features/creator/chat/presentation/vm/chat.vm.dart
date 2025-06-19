import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:zeazn_invest_app/core/utils/utils.dart';
import 'package:zeazn_invest_app/features/creator/chat/domain/models/message.dart';

class ZChatVM extends GetxController {
  static ZChatVM get instance => Get.find();

  var loading = LoadingState.completed.obs;

  updateLoadingState(LoadingState loadingState) => loading.value = loadingState;

  final bPriceTEC = TextEditingController();
  final bDescriptionTEC = TextEditingController();
  final bRewardTEC = TextEditingController();
  final bLocationTEC = TextEditingController();
  final bSlotsTEC = TextEditingController();
  final messageTEC = TextEditingController();

  final List<Map<String, dynamic>> chats = [
    {
      'user': 'May Blay',
      'last_message': 'Listened to some of your music and I was really...',
      'created_at':
          DateTime.now().subtract(Duration(hours: 2)).toIso8601String(),
      'count': 2,
    },
    {
      'user': 'Joseph Cater',
      'last_message': 'Your photographs was on another level if im to...',
      'created_at':
          DateTime.now().subtract(Duration(hours: 5)).toIso8601String(),
      'count': 5,
    },
  ];

  final List<Message> messages = [
    Message(
      id: 1,
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
    Message(
      id: 2,
      title: 'Hi there',
      body:
          'I very happy to hear that, music is everything to me. Getting your support will...',
      fromNumber: '6',
      toNumber: '2',
      createdAt:
          DateTime.now().subtract(Duration(minutes: 55)).toIso8601String(),
      updatedAt:
          DateTime.now().subtract(Duration(minutes: 30)).toIso8601String(),

      readStatus: 'read',
      readAt: null,
    ),
  ];
}
