import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:scrips_core/usecase/no_params.dart';
import 'package:scrips_core/utils/utils.dart';
import 'package:scrips_shared_features/features/common/domain/usecases/fetch_gender_use_case.dart';
import 'package:scrips_ua/features/Signup/domain/usecases/get_patient_user_use_case.dart';
import './bloc.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  @override
  SignupState get initialState => InitialSignupState();

  final GetPatientUseCase getPatientUseCase;
  final FetchGenderUseCase fetchGenderUseCase;
  SignupBloc({
    @required this.getPatientUseCase, @required this.fetchGenderUseCase});

  @override
  Stream<SignupState> mapEventToState(
    SignupEvent event,
  ) async* {
    if (event is EnableNextEvent) {
      bool status = event.dob != null &&
          !isBlank(event.firstName) &&
          !isBlank(event.lastName) &&
          !isBlank(event.gender) &&
          !isBlank(event.email) &&
          !isBlank(event.contact);
      yield EnableNextState(firstName: event.firstName,lastName: event.lastName,gender: event.gender,email: event.email, contact: event.contact,dob: event.dob, status: status);
    } else if (event is FetchPatientEvent) {
      yield LoadingBeginState();
      final result = await getPatientUseCase(
          GetPatientParams(
              fistName: event.firstName,
              lastName: event.lastName,
              dob: event.dob,
              gender: event.gender,
              email: event.email,
              contactNumber: event.contact));
      yield LoadingEndState();
      yield result.fold(
            (error) => ErrorState(error.message),
            (success) => GetPatientState(patients: success),
      );
    } else if (event is FetchGendersEvent) {
      yield LoadingBeginState();
      final result = await fetchGenderUseCase(NoParams());
      yield LoadingEndState();
      yield result.fold(
            (error) => ErrorState(error.message),
            (success) => FetchGendersState(success),
      );
    }
  }


}
