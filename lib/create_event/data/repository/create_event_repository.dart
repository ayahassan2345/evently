import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evently/core/services/firebase/firestore_provider.dart';
import 'package:evently/core/services/shared_prefs.dart';
import 'package:evently/create_event/data/model/create_event_model.dart';
import 'package:flutter/material.dart';

class CreateEventRepository {
  static Future<void> onCreateEventRepo({
    required int selectedImage,
    required int selectedActivity,
    required TextEditingController eventTitleController,
    required TextEditingController eventDescriptionController,
    required String formatedDate,
    required String formatedTime,
  }) async {
    String uid = SharedPrefs.getUserid();
    log('uid:$uid');
    EventModel model = EventModel(
      uid: uid,
      image: selectedImage,
      activity: selectedActivity,
      title: eventTitleController.text,
      description: eventDescriptionController.text,
      date: formatedDate,
      time: formatedTime,
    );
    try {
      FirestoreProvider.createEventDoc(eventModel: model);
    } on FirebaseException catch (e) {
      log(e.toString());
    }
  }
}
