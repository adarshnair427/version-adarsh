import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:khushi/patients/data/patient_repository.dart';
import 'package:khushi/patients/patient.dart';
import 'package:khushi/patients/patients.dart';
import 'package:equatable/equatable.dart';

part 'patients_event.dart';

part 'patients_state.dart';

class PatientsBloc extends Bloc<PatientsEvent, PatientsState> {
  final PatientRepository _patientRepository;
  StreamSubscription<List<Patient>>? _patientsSubscription;

  PatientsBloc({required PatientRepository patientsRepository})
      :
        _patientRepository = patientsRepository,
        super(PatientsLoading());

  @override
  Stream<PatientsState> mapEventToState(
    PatientsEvent event,
  ) async* {
    if(event is LoadPatients){
      yield* _mapLoadPatientToState(event);
    }
  }
  Stream<PatientsState> _mapLoadPatientToState(
      LoadPatients event) async* {
    _patientsSubscription?.cancel();
    _patientsSubscription = _patientRepository.patient()!.listen(
          (patient) => add(PatientsUpdated(patient)),
    ) ;
  }
  @override
  Future<void> close() {
    _patientsSubscription?.cancel();
    return super.close();
  }
}
