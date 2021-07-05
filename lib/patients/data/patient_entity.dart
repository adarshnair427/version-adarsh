import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class PatientEntity extends Equatable {
  final String name;

  const PatientEntity(this.name);

  Map<String, Object> toJson() {
    return {
      "name": name,
    };
  }

  @override
  List<Object> get props => [name];

  @override
  String toString() {
    return 'PatientEntity { name: $name,}';
  }

  static PatientEntity fromJson(Map<String, Object> json) {
    return PatientEntity(
      json["name"] as String,
    );
  }

  static PatientEntity fromSnapshot(DocumentSnapshot snap) {
    return PatientEntity(
      (snap.data() as dynamic)['name'],
    );
  }

  Map<String, Object> toDocument() {
    return {
      "name": name
    };
  }
}