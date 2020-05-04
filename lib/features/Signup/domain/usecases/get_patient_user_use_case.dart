import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:scrips_core/constants/status_objects.dart';
import 'package:scrips_core/usecase/usecase.dart';
import 'package:scrips_ua/features/Signup/data/datamodel/patient_list_model.dart';
import 'package:scrips_ua/features/Signup/domain/repository/signup_repository.dart';
import 'package:equatable/equatable.dart';

class GetPatientUseCase extends UseCase<List<PatientList>, GetPatientParams> {
  SignupRepository signupRepository;

  GetPatientUseCase({@required this.signupRepository});

  Future<Either<Failure, List<PatientList>>> call(GetPatientParams params) async {
    return await signupRepository.getPatient(firstName: params.fistName, lastName: params.lastName, email: params.email, contactNumber: params.contactNumber, dob: params.dob, gender: params.gender
    );
  }
}

class GetPatientParams extends Equatable {
  final String fistName;
  final String lastName;
  final String email;
  final String contactNumber;
  final DateTime dob;
  final String gender;

  GetPatientParams({
    @required this.fistName,
    @required this.lastName,
    @required this.email,
    @required this.contactNumber,
    @required this.dob,
    @required this.gender,
  }) : super([fistName, lastName, email, contactNumber, dob, gender]);
}