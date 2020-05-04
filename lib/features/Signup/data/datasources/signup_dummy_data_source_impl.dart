
import 'package:scrips_shared_features/features/login/data/datamodels/login_user_data_model.dart';
import 'package:scrips_ua/features/Signup/data/datamodel/patient_list_model.dart';

import 'signup_data_source.dart';

class SignupDummyDataSourceImpl extends SignupDataSource {
  @override
  Future<List<PatientList>> getPatient({String firstName, String lastName, String email, String contactNumber, DateTime dob, String gender}) {
    // TODO: implement getLoggedUser
    throw UnimplementedError();
  }
  
}
