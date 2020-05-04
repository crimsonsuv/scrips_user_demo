import 'package:scrips_ua/core/constants/api_constats.dart';
import 'package:scrips_ua/features/Signup/data/datamodel/patient_list_model.dart';
import 'package:dio/dio.dart';
import 'signup_data_source.dart';
import 'dart:convert';

class SignupDataSourceImpl extends SignupDataSource {
  int _defaultTimeout = 20;
  static final endpoint = patientsServer;
  Dio client = Dio();

  @override
  Future<List<PatientList>> getPatient({String firstName, String lastName, String email, String contactNumber, DateTime dob, String gender}) async {
    client.options.responseType = ResponseType.bytes;
    client.options.headers = {
      'accept': 'text/plain',
      'Content-Type': 'application/json'
    };

    var uri = "$endpoint/api/Patients/GetPatientDetails?FirstName=$firstName&LastName=$lastName&Email=${Uri.encodeQueryComponent(email)}&ContactNumber=${Uri.encodeQueryComponent(contactNumber)}&DOB=${dob.toIso8601String()}&Gender=$gender";


    var response = await client
        .post(uri)
        .timeout(Duration(seconds: _defaultTimeout), onTimeout: () {
      throw Exception('Something happened! Please retry in a few seconds.');
    });

    return patientListFromJson(utf8.decode(response.data));
  }

}
