import 'dart:async';
import 'dart:collection';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:khushi/appointments/data/appointment_entity.dart';
import 'package:khushi/appointments/data/appointment_model.dart';
import 'package:khushi/appointments/data/appointment_repository.dart';
import 'package:table_calendar/table_calendar.dart';

class FirebaseAppointmentRepository implements AppointmentsRepository {
  final AppointmentCollection = FirebaseFirestore.instance.collection('appointments');

  @override
  Stream<LinkedHashMap<DateTime, List<Appointment>>> appointment() {
    return AppointmentCollection.snapshots().map((snapshot) {
      LinkedHashMap<DateTime, List<Appointment>> appointments = LinkedHashMap(
        equals: isSameDay,
        hashCode: getHashCode,
      );
      snapshot.docs.forEach((doc) {
        Appointment appointment =
        Appointment.fromEntity(AppointmentEntity.fromSnapshot(doc));
        if (appointments.containsKey(appointment.dateTime))
          appointments[appointment.dateTime]!.add(appointment);
        else
          appointments[appointment.dateTime] = [appointment];
      });
      return appointments;
    });
  }

  @override
  Future<void> addNewAppointment(Appointment appointment) {
    return AppointmentCollection.add(appointment.toEntity().toDocument());
  }
}

int getHashCode(DateTime key) {
  return key.day * 1000000 + key.month * 10000 + key.year;
}