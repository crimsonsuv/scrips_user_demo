import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:scrips_core/constants/status_objects.dart';
import 'package:scrips_core/utils/utils.dart';
import 'package:scrips_ua/features/Signup/data/datamodel/patient_list_model.dart';
import 'package:scrips_ua/features/Signup/data/datasources/signup_data_source.dart';
import 'package:scrips_ua/features/Signup/domain/repository/signup_repository.dart';
import 'package:dio/dio.dart';

class SignupRepositoryImpl extends SignupRepository {
  SignupDataSource signupDataSource;

  SignupRepositoryImpl({@required this.signupDataSource});

  @override
  Future<Either<Failure, List<PatientList>>> getPatient(
      {String firstName,
      String lastName,
      String email,
      String contactNumber,
      DateTime dob,
      String gender}) async {
    try {
      final result = await signupDataSource.getPatient(
          firstName: firstName,
          lastName: lastName,
          contactNumber: contactNumber,
          dob: dob,
          gender: gender,
          email: email);
      return Right(result);
    } on DioError catch (e) {
      if (e.response.statusCode == 404) {
        return Left(Failure("No matching patient found"));
      }
      return (Left(handleFailure(e)));
    } on Failure {
      return Left(Failure("Request time out.."));
    }
  }
}
