import 'dart:async';
import 'package:bloc/bloc.dart';
import './bloc.dart';

class PatientListBloc extends Bloc<PatientListEvent, PatientListState> {
  @override
  PatientListState get initialState => InitialPatientListState();

  @override
  Stream<PatientListState> mapEventToState(
    PatientListEvent event,
  ) async* {
    // TODO: Add Logic
  }
}
