import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';

import '../constants/secure_storage.dart';

class HelperFunction {
  Future<void> addUserInfo(userData) async {
    FirebaseFirestore.instance
        .collection("users")
        .add(userData)
        .catchError((e) {
      print(e.toString());
    });
  }

  getAllUsers() async {
    String? userId = await UserSecureStorage.fetchToken();

    return FirebaseFirestore.instance
        .collection("users")
        .where('uid', isNotEqualTo: userId)
        .get();
  }

  searchByName(String searchField) {
    return FirebaseFirestore.instance
        .collection("users")
        .where('userName', isEqualTo: searchField)
        .get();
  }

  Future<bool>? addChatRoom(chatRoom, chatRoomId) {
    FirebaseFirestore.instance
        .collection("chatRoom")
        .doc(chatRoomId)
        .set(chatRoom)
        .catchError((e) {
      print(e);
    });
  }

  getChats(String? chatRoomId) async {
    return FirebaseFirestore.instance
        .collection("chatRoom")
        .doc(chatRoomId)
        .collection("chats")
        .orderBy('time')
        .snapshots();
  }

  Future<void> addMessage(String? chatRoomId, chatMessageData) {
    return FirebaseFirestore.instance
        .collection("chatRoom")
        .doc(chatRoomId)
        .collection("chats")
        .add(chatMessageData)
        .catchError((e) {
      print(e.toString());
    });
  }

  getUserChats(String? itIsMyName) async {
    return await FirebaseFirestore.instance
        .collection("chatRoom")
        .where('users', arrayContains: itIsMyName)
        .snapshots();
  }
}
