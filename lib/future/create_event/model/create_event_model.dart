import 'package:evently/core/model/categories_model.dart';

class CreateEventModel {
  final String id;
  final String eventImagePath;
  final CategoriesModel eventName;
  final String eventTitle;
  final String eventDescription;
  final String date;
  final String time;

  CreateEventModel({
    required this.id,
    required this.eventImagePath,
    required this.eventName,
    required this.eventTitle,
    required this.eventDescription,
    required this.date,
    required this.time,
  });
  CreateEventModel copyWith({
    String? id,
    String? eventImagePath,
    CategoriesModel? eventName,
    String? eventTitle,
    String? eventDescription,
    String? date,
    String? time,
  }) {
    return CreateEventModel(
      id: id ?? this.id,
      eventImagePath: eventImagePath ?? this.eventImagePath,
      eventName: eventName ?? this.eventName,
      eventTitle: eventTitle ?? this.eventTitle,
      eventDescription: eventDescription ?? this.eventDescription,
      date: date ?? this.date,
      time: time ?? this.time,
    );
  }
factory CreateEventModel.fromJson(Map<String, dynamic> json) {
    return CreateEventModel(
      id: json['id'],
      eventImagePath: json['eventImagePath'],
      eventName: CategoriesModel.fromJson(json['eventName']),
      eventTitle: json['eventTitle'],
      eventDescription: json['eventDescription'],
      date: json['date'],
      time: json['time'],
    );
  }

  // 🔵 To Json
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'eventImagePath': eventImagePath,
      'eventName': eventName.toJson(),
      'eventTitle': eventTitle,
      'eventDescription': eventDescription,
      'date': date,
      'time': time,
    };
  }

}
