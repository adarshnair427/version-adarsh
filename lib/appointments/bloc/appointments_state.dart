part of 'appointments_bloc.dart';

class AppointmentsState extends Equatable {

  const AppointmentsState();


  @override
  List<Object?> get props => [];
}

class AppointmentsLoading extends AppointmentsState {}

class AppointmentsLoad extends AppointmentsState {
  final LinkedHashMap<DateTime, List<Appointment>> appointments;

  const AppointmentsLoad({required this.appointments});

  @override
  String toString() => appointments.toString();

  @override
  List<Object?> get props => [appointments];
}