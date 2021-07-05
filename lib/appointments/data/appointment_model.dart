import 'package:meta/meta.dart';
import 'package:khushi/appointments/data/appointment_entity.dart';

@immutable
class Appointment {
  final String name;
  final DateTime dateTime;
  final String title;
  final String about;

  const Appointment({required this.name,required this.dateTime,required this.title,required this.about});

  Appointment copyWith({String? name, DateTime? dateTime, String? title, String? about}) {
    return Appointment(
      name: name ?? this.name,
      dateTime: dateTime ?? this.dateTime,
      title: title ?? this.title,
      about: about ?? this.about,
    );
  }

  @override
  int get hashCode => name.hashCode^dateTime.hashCode^title.hashCode^about.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is Appointment &&
              runtimeType == other.runtimeType &&
              name == other.name &&
              dateTime == other.dateTime &&
              title == other.title &&
              about == other.about;

  @override
  String toString() {
    return 'Appointment { name: $name, dateTime: $dateTime, title: $title, about: $about}';
  }

  AppointmentEntity toEntity() {
    return AppointmentEntity(name, dateTime, title, about);
  }

  static Appointment fromEntity(AppointmentEntity entity) {
    return Appointment(
      name: entity.name,
      dateTime: entity.dateTime,
      title: entity.title,
      about: entity.about,
    );
  }
}