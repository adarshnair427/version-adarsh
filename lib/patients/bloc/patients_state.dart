part of 'patients_bloc.dart';

abstract class PatientsState extends Equatable {

  const PatientsState();

  @override
  List<Object?> get props => [];
}

class PatientsLoading extends PatientsState {}

class PatientsLoad extends PatientsState {
  final List<Patient> patients;

  const PatientsLoad({required this.patients});

  @override
  String toString() => 'PatientsLoad: { Patient: $patients}';

  @override
  List<Object?> get props => [patients];
}
