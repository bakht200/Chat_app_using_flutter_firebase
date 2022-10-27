import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:maahey_flutter_task/constants/secure_storage.dart';
import 'package:maahey_flutter_task/view/dashboard.dart';

class AuthController extends GetxController {
  signUp(email, password, userName, context) async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      User user = FirebaseAuth.instance.currentUser!;

      await FirebaseFirestore.instance.collection("users").doc(user.uid).set({
        'uid': user.uid,
        'email': email,
        'passowrd': password,
        'userName': userName
      });

      Navigator.of(context).pop();

      await UserSecureStorage.setUserName(userName);
      await UserSecureStorage.setToken(user.uid);

      Navigator.of(context)
          .push(MaterialPageRoute(builder: (builder) => DashboardScreen()));
    } catch (e) {
      Navigator.of(context).pop();

      Fluttertoast.showToast(msg: e.toString());
    }
  }

  login(email, password, context) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      User? user = FirebaseAuth.instance.currentUser;

      await UserSecureStorage.setToken(user!.uid);

      await UserSecureStorage.fetchToken();

      final snapshot = await FirebaseFirestore.instance
          .collection('users')
          .where('uid', isEqualTo: user.uid)
          .get();
      await UserSecureStorage.setUserName(snapshot.docs[0]['userName']);
      await UserSecureStorage.fetchUserName();

      Navigator.of(context).pop();

      Navigator.of(context).push(
        MaterialPageRoute(builder: (builder) => DashboardScreen()),
      );
    } catch (e) {
      Navigator.of(context).pop();

      Fluttertoast.showToast(msg: e.toString());
    }
  }
}
