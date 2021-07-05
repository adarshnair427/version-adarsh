import 'dart:collection';

import 'package:table_calendar/table_calendar.dart';

import 'package:khushi/appointments/appointment.dart';
import 'package:khushi/patients/patient.dart';

final LinkedHashMap<DateTime, List<Appointment>> appointments =
    LinkedHashMap(equals: isSameDay, hashCode: getHashCode)
      ..addAll({
        DateTime.now(): [
          Appointment(
              dateTime: DateTime.now().add(
                Duration(hours: 2),
              ),
              patient: Patient(
                name: "Rakesh",
              ),
              title: 'Gastrointestinal Disease',
              about: 'lorem ipsum'),
          Appointment(
              dateTime: DateTime.now().add(
                Duration(minutes: 15),
              ),
              patient: Patient(
                name: "Goutam",
              ),
              title: 'Abdominal pain diagnosis',
              about: 'lorem ipsum'),
          Appointment(
              dateTime: DateTime.now().subtract(
                Duration(hours: 2),
              ),
              patient: Patient(
                name: "Lalith",
              ),
              title: 'Gastrointestinal Disease',
              about: 'lorem ipsum'),
        ],
      });

int getHashCode(DateTime key) {
  return key.day * 1000000 + key.month * 10000 + key.year;
}
