import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evently/core/model/categories_model.dart';
import 'package:evently/future/create_event/cubit/create_event_state.dart';
import 'package:evently/future/create_event/model/create_event_model.dart';
import 'package:evently/future/create_event/widget/formate_time.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class CreateEventCubit extends Cubit<CreateEventState> {
  CreateEventCubit()
    : super(
        CreateEventState(
          eventModel: CreateEventModel(
            id: '',
            eventImagePath: '',
            eventName: CategoriesModel(categoryName: '', categoryIcon: ''),
            eventTitle: '',
            eventDescription: '',
            date: 'Choose Date',
            time: 'Choose Time',
          ),
        ),
      );
  void selectedDate(DateTime? picked) {
    if (picked == null) return;
    String formatedDate = DateFormat('dd/MM/yyyy').format(picked);
    var newDate = state.eventModel.copyWith(date: formatedDate);
    emit(state.copyWith(eventModel: newDate));
  }

  void selectedTime(TimeOfDay? picked) {
    if (picked == null) return;
    String formatedTime = formatTimeAMPM(picked);
    var newTime = state.eventModel.copyWith(time: formatedTime);
    emit(state.copyWith(eventModel: newTime));
  }

  void selectedEventTitle(String? eventTitle) {
    var updateTitle = state.eventModel.copyWith(eventTitle: eventTitle);
    emit(state.copyWith(eventModel: updateTitle));
  }

  void selectedEventDescription(String? eventDescription) {
    var updateDescription = state.eventModel.copyWith(
      eventDescription: eventDescription,
    );
    emit(state.copyWith(eventModel: updateDescription));
  }

  void selectedImage(String image) {
    var newImage = state.eventModel.copyWith(eventImagePath: image);
    emit(state.copyWith(eventModel: newImage));
  }

  void selectedEventName(CategoriesModel eventName) {
    var newEventName = state.eventModel.copyWith(eventName: eventName);
    emit(state.copyWith(eventModel: newEventName));
  }

  void createEvent() {
    String collectionName = 'create_event';
    CreateEventModel model = state.eventModel;
    Map<String, dynamic> createEvent = {
      //'id': model.id,
      //'eventImagePath': model.eventImagePath,
      // 'eventName': model.eventName,
        'eventTitle': model.eventTitle,
      //'eventDescription': model.eventDescription,
      //'date': model.date,
      //'time': model.time,
    };
    FirebaseFirestore.instance
        .collection(collectionName)
        .add(createEvent)
        .then((value) {
          print('value:$value');
        })
        .onError((error, stackTrace) {
          print('error : $error ');
        });
    print('createEvent:$createEvent');
    print('state : ${state.eventModel.toJson()}');
  }
}
