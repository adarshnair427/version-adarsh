part of 'appointments_bloc.dart';

abstract class AppointmentsEvent extends Equatable {
  const AppointmentsEvent();

  @override
  List<Object?> get props => [];
}

class LoadAppointments extends AppointmentsEvent {}

class AddAppointment extends AppointmentsEvent {
  final Appointment appointment;

  const AddAppointment({required this.appointment}) : super();

  @override
  List<Object?> get props => [appointment];

  @override
  String toString() => 'AddAppointment: { appointment: $appointment }';
}

class AppointmentUpdated extends AppointmentsEvent {
  final Appointment appointment;

  const AppointmentUpdated(this.appointment);

  @override
  List<Object?> get props => [appointment];

  @override
  String toString() => 'AppointmentUpdated: { appointment: $appointment }';
}

