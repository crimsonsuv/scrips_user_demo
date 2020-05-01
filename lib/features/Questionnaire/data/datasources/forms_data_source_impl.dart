import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:scrips_core/constants/status_objects.dart';
import 'package:scrips_ua/core/constants/api_constats.dart';
import 'package:scrips_ua/features/Questionnaire/data/datamodels/questionnaire_model.dart';
import 'package:scrips_ua/features/Questionnaire/data/datamodels/questionnaire_response_model.dart';
import 'package:scrips_ua/features/Questionnaire/data/datasources/forms_data_source.dart';

class QuestionnaireDataSourceImpl extends QuestionnaireDataSource {
  static final endpoint = practiceServer;
  int _timeout = 50;
  Dio client = Dio();

  @override
  Future<Questionnaire> getFormDetail({String pid}) async {
    client.options.responseType = ResponseType.bytes;
    client.options.headers = {
      'accept': 'text/plain',
      'Content-Type': 'application/json'
    };
    var response = await client
        .get(
      '$practiceServer/api/Questionnaires/Questionnaire?PatientId=$pid',
    )
        .timeout(Duration(seconds: _timeout), onTimeout: () {
      throw Exception('Cannot fetch questions');
    });
    return questionnaireFromJson(utf8.decode(response.data));
  }

  @override
  Future<Status> saveFormResponse({QuestionnaireResponse response}) async{
    client.options.responseType = ResponseType.bytes;
    client.options.headers = {
      'accept': 'text/plain',
      'Content-Type': 'application/json'
    };
    Map<String, dynamic> formD = response.toJson();
    var requestBody = jsonEncode(formD);

    var _ = await client
        .post('$endpoint/api/QuestionnaireResponses', data: requestBody)
        .timeout(Duration(seconds: _timeout), onTimeout: () {
      throw Exception('Cannot update form');
    });
    return Success('Form Successfully Saved');
  }


}
