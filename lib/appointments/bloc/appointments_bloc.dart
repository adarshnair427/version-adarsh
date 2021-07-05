import 'dart:async';
import 'dart:collection';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:khushi/appointments/appointment.dart';
import 'package:khushi/appointments/data/appointment_repository.dart';

part 'appointments_event.dart';
part 'appointments_state.dart';

class AppointmentsBloc extends Bloc<AppointmentsEvent, AppointmentsState> {
  final AppointmentsRepository _appointmentRepository;
  StreamSubscription<LinkedHashMap<DateTime, List<Appointment>>>? _appointmentSubscription;

  AppointmentsBloc({required AppointmentsRepository appointmentRepository})
      :
        _appointmentRepository = appointmentRepository,
        super(AppointmentsLoading());

  @override
  Stream<AppointmentsState> mapEventToState(
      AppointmentsEvent event,
      ) async* {
    if(event is LoadAppointments){
      yield* _mapLoadAppointmentToState(event);
    }
    else if (event is AddAppointment) {
      yield* _mapAppointmentAddedToState(event);
    }
  }

  Stream<AppointmentsState> _mapLoadAppointmentToState(
      LoadAppointments event) async* {
    _appointmentSubscription?.cancel();
    _appointmentSubscription = _appointmentRepository.appointment()!.listen(
          (appointments) => add(AppointmentUpdated(appointments)),
    ) ;
  }

  Stream<AppointmentsState> _mapAppointmentAddedToState(
      AddAppointment event) async* {
    _appointmentRepository.addNewAppointment(event.appointment);
  }
}
