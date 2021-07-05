part of 'patients_bloc.dart';

abstract class PatientsEvent extends Equatable {
  const PatientsEvent();
  @override
  List<Object?> get props => [patients];
}

class LoadPatients extends PatientsEvent {}

class PatientUpdated extends PatientsEvent {
  final Patient patient;

  const PatientUpdated(this.patient);

  @override
  List<Object?> get props => [patient];

  @override
  String toString() => 'PatientUpdated: { patient: $patient }';
}