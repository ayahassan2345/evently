import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evently/create_event/data/model/create_event_model.dart';

class FirestoreProvider {
  static FirebaseFirestore firestore = FirebaseFirestore.instance;
  static CollectionReference<Map<String, dynamic>> createEventCollection =
      firestore.collection('create_event');

  static Future<void> createEventDoc({required EventModel eventModel}) async {
    return await createEventCollection
        .doc(eventModel.uid)
        .set(eventModel.toJson());
  }
}
