import 'package:meta/meta.dart';
import 'package:khushi/patients/data/patient_entity.dart';

@immutable
class Patient {
  final String name;

  const Patient({required this.name});

  Patient copyWith({String? name,}) {
    return Patient(
      name: name ?? this.name,
    );
  }

  @override
  int get hashCode => name.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is Patient &&
              runtimeType == other.runtimeType &&
              name == other.name;

  @override
  String toString() {
    return 'Patient { name: $name, }';
  }

  PatientEntity toEntity() {
    return PatientEntity(name);
  }

  static Patient fromEntity(PatientEntity entity) {
    return Patient(
      name: entity.name,
    );
  }
}