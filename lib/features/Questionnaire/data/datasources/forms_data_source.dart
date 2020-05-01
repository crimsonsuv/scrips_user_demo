import 'package:scrips_core/constants/status_objects.dart';
import 'package:scrips_ua/features/Questionnaire/data/datamodels/questionnaire_model.dart';
import 'package:scrips_ua/features/Questionnaire/data/datamodels/questionnaire_response_model.dart';

abstract class QuestionnaireDataSource {
  Future<Questionnaire> getFormDetail({String pid});
  Future<Status> saveFormResponse({QuestionnaireResponse response});
}
