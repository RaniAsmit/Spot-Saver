// ignore_for_file: avoid_print

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path/path.dart' as p;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

final String USER_COLLECTION = 'users';
final String POST_COLLECTION = 'posts';

class FirebaseService {
  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseStorage _storage = FirebaseStorage.instance;
  FirebaseFirestore _db = FirebaseFirestore.instance;

  Map? currentUser;

  FirebaseService();

  Future<bool> registerUser({
    required String name,
    required String email,
    required String password,
    required File image,
  }) async {
    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);
      String userId = userCredential.user!.uid;
      String fileName = Timestamp.now().millisecondsSinceEpoch.toString() +
          p.extension(image.path);
      UploadTask task = _storage.ref('images/$userId/$fileName').putFile(image);
      return task.then((snapshot) async {
        await _db.collection(USER_COLLECTION).doc(userId).set({
          "name": name,
          "email": email,
        });
        return true;
      });
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> loginUser({
    required String email,
    required String password,
  }) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      if (userCredential.user != null) {
        currentUser = await getUserData(uid: userCredential.user!.uid);
        return true;
      } else {
        return false;
      }
    } catch (e) {
      // ignore: avoid_print
      print(e);
      return false;
    }
  }

  Future<Map> getUserData({required String uid}) async {
    DocumentSnapshot doc = await _db.collection(USER_COLLECTION).doc(uid).get();
    return doc.data() as Map;
  }

  Future<bool> postImage(File image) async {
    try {
      String userId = _auth.currentUser!.uid;
      String fileName = Timestamp.now().millisecondsSinceEpoch.toString() +
          p.extension(image.path);
      UploadTask task = _storage.ref('images/$userId/$fileName').putFile(image);
      return await task.then((snapshot) async {
        String downloadURL = await snapshot.ref.getDownloadURL();
        await _db.collection(POST_COLLECTION).add({
          "userId": userId,
          "timestamp": Timestamp.now(),
          "image": downloadURL,
        });
        return true;
      });
    } catch (e) {
      print(e);
      return false;
    }
  }

  Stream<QuerySnapshot> getLatePosts() {
    return _db
        .collection(POST_COLLECTION)
        .orderBy('timestamp', descending: true)
        .snapshots();
  }

  Future<void> logout() async {
    await _auth.signOut();
  }
}
