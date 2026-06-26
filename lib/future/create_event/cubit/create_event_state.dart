import 'package:evently/future/create_event/model/create_event_model.dart';

class CreateEventState {
  final CreateEventModel eventModel;

  CreateEventState({required this.eventModel});
  CreateEventState copyWith({CreateEventModel? eventModel}) {
    return CreateEventState(eventModel: eventModel ?? this.eventModel);
  }
}
