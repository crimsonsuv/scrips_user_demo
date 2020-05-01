import 'package:scrips_ua/features/Signup/data/datamodel/patient_list_model.dart';

abstract class SignupDataSource {
  Future<List<PatientList>> getPatient({String firstName, String lastName, String email, String contactNumber, DateTime dob, String gender});
}
