import 'dart:async';
import 'dart:collection';

import 'package:khushi/appointments/data/appointment_model.dart';

abstract class AppointmentsRepository {
  Future<void> addNewAppointment(Appointment appointment);

  Stream<LinkedHashMap<DateTime, List<Appointment>>>? appointment();

}