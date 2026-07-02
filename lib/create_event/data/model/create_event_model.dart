class EventModel {
  final String uid;
  final int image;
  final int activity;
  final String title;
  final String description;
  final String date;
  final String time;

  EventModel({
    required this.image,
    required this.activity,
    required this.title,
    required this.description,
    required this.date,
    required this.time,
    required this.uid,
  });

  factory EventModel.fromJson(Map<String, dynamic> json) {
    return EventModel(
      image: json['image'] as int,
      activity: json['activity'] as int,
      title: json['title'] as String,
      description: json['description'] as String,
      date: json['date'] as String,
      time: json['time'] as String,
      uid: json['uid'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'image': image,
      'activity': activity,
      'title': title,
      'description': description,
      'date': date,
      'time': time,
      'uid': uid,
    };
  }
}
