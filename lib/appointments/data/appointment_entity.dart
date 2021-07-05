import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class AppointmentEntity extends Equatable {
  final String name;
  final DateTime dateTime;
  final String title;
  final String about;

  const AppointmentEntity(this.name, this.dateTime, this.title, this.about);

  Map<String, Object> toJson() {
    return {
      "name": name,
      "dateTime":dateTime,
      "title":title,
      "about":about,
    };
  }

  @override
  List<Object> get props => [name,dateTime,title,about];

  @override
  String toString() {
    return 'AppointmentEntity { name: $name,dateTime: $dateTime, title: $title, about: $about,}';
  }

  static AppointmentEntity fromJson(Map<String, Object> json) {
    return AppointmentEntity(
      json["name"] as String,
      json["dateTime"] as DateTime,
      json["title"] as String,
      json["about"] as String,
    );
  }

  static AppointmentEntity fromSnapshot(DocumentSnapshot snap) {
    return AppointmentEntity(
      (snap.data() as dynamic)['name'],
      (snap.data() as dynamic)['dateTime'],
      (snap.data() as dynamic)['title'],
      (snap.data() as dynamic)['about'],
    );
  }

  Map<String, Object> toDocument() {
    return {
      "name": name,
      "dateTime": dateTime,
      "title": title,
      "about": about,
    };
  }
}