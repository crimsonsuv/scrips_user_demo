import 'package:meta/meta.dart';

@immutable
abstract class SignupEvent {}

class FetchPatientEvent extends SignupEvent {
  final String firstName;
  final String lastName;
  final DateTime dob;
  final String gender;
  final String email;
  final String contact;
  FetchPatientEvent(
      {this.firstName,
        this.lastName,
        this.dob,
        this.gender,
        this.email,
        this.contact});
}

class EnableNextEvent extends SignupEvent {
  final String firstName;
  final String lastName;
  final DateTime dob;
  final String gender;
  final String email;
  final String contact;
  EnableNextEvent(
      {this.firstName,
        this.lastName,
        this.dob,
        this.gender,
        this.email,
        this.contact});
}

class FetchGendersEvent extends SignupEvent {}