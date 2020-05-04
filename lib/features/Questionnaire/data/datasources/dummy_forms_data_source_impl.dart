import 'package:scrips_core/constants/status_objects.dart';
import 'package:scrips_ua/features/Questionnaire/data/datamodels/questionnaire_model.dart';
import 'package:scrips_ua/features/Questionnaire/data/datamodels/questionnaire_response_model.dart';
import 'package:scrips_ua/features/Questionnaire/data/datasources/forms_data_source.dart';


class DummyQuestionnaireDataSourceImpl extends QuestionnaireDataSource {
  static final endpoint = 'lib/core/mock_jsons/';

  @override
  Future<Questionnaire> getFormDetail({String pid}) {
    // TODO: implement getFormDetail
    throw UnimplementedError();
  }

  @override
  Future<Status> saveFormResponse({QuestionnaireResponse response}) {
    // TODO: implement saveFormResponse
    throw UnimplementedError();
  }


}
