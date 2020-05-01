import 'package:meta/meta.dart';
import 'package:scrips_shared_features/features/common/data/datamodels/gender_model.dart';
import 'package:scrips_ua/features/Signup/data/datamodel/patient_list_model.dart';

@immutable
abstract class SignupState {}

class InitialSignupState extends SignupState {}

class GetPatientState extends SignupState {
  final List<PatientList> patients;
  GetPatientState({this.patients});
}

class LoadingBeginState extends SignupState {}

class LoadingEndState extends SignupState {}

class ErrorState extends SignupState {
  final String message;

  ErrorState(this.message);
}

class EnableNextState extends SignupState {
  final String firstName;
  final String lastName;
  final DateTime dob;
  final String gender;
  final String email;
  final String contact;
  final bool status;
  EnableNextState(
      {this.firstName,
        this.lastName,
        this.dob,
        this.gender,
        this.email,
        this.contact, this.status});
}

class FetchGendersState extends SignupState {
  final List<Gender> genderList;
  FetchGendersState(this.genderList);
}