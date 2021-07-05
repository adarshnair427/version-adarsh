import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:khushi/patients/data/patient_model.dart';
import 'package:khushi/patients/data/patient_entity.dart';
import 'package:khushi/patients/data/patient_repository.dart';

class FirebasePatientRepository implements PatientRepository {
  final patientCollection = FirebaseFirestore.instance.collection('patients');

  @override
  Stream<List<Patient>> patient() {
    return patientCollection.snapshots().map((snapshot) {
      return snapshot.docs
          .map((doc) => Patient.fromEntity(PatientEntity.fromSnapshot(doc)))
          .toList();
    });
  }
}