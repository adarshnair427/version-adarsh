import 'dart:async';

import 'package:khushi/patients/data/patient_model.dart';

abstract class PatientRepository {
  Stream<List<Patient>> patient();
}