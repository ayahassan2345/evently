import 'package:evently/create_event/data/repository/create_event_repository.dart';
import 'package:evently/create_event/presentation/bloc/create_event_state.dart';
import 'package:evently/create_event/presentation/widget/formate_time.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class CreateEventCubit extends Cubit<CreateEventState> {
  CreateEventCubit() : super(CreateEventState());
  int selectedImage = -1;
  int selectedActivity = 0;
  TextEditingController eventTitleController = TextEditingController();
  TextEditingController eventDescriptionController = TextEditingController();
  String formatedDate = '';
  String formatedTime = '';
  void onSelectImage({required int index}) {
    selectedImage = index;
    emit(ImageState());
  }

  void onSelectActivity({required int index}) {
    selectedActivity = index;
    emit(ActivityState());
  }

  void eventTitle({required String eventTitle}) {
    eventTitleController.text = eventTitle;
    emit(EventTitleState());
  }

  void eventDescription({required String eventDescription}) {
    eventDescriptionController.text = eventDescription;
    emit(EventDescriptionState());
  }

  void chooseDate({required DateTime? picked}) {
    if (picked == null) return;
    formatedDate = DateFormat('dd/MM/yyyy').format(picked);
    emit(EventDateState());
  }

  void chooseTime({required TimeOfDay? picked}) {
    if (picked == null) return;
    formatedTime = formatTimeAMPM(picked);
    emit(EventTimeState());
  }

  Future<void> onCreateEvent() async {
    CreateEventRepository.onCreateEventRepo(
      selectedImage: selectedImage,
      selectedActivity: selectedActivity,
      eventTitleController: eventTitleController,
      eventDescriptionController: eventDescriptionController,
      formatedDate: formatedDate,
      formatedTime: formatedTime,
    );
  }
}
