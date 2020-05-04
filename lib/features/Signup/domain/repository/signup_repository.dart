import 'package:dartz/dartz.dart';
import 'package:scrips_core/constants/status_objects.dart';
import 'package:scrips_ua/features/Signup/data/datamodel/patient_list_model.dart';

abstract class SignupRepository {
  Future<Either<Failure, List<PatientList>>> getPatient({String firstName, String lastName, String email, String contactNumber, DateTime dob, String gender});
}
