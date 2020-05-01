import 'package:dartz/dartz.dart';
import 'package:scrips_core/constants/status_objects.dart';
import 'package:scrips_ua/features/Questionnaire/data/datamodels/questionnaire_model.dart';
import 'package:scrips_ua/features/Questionnaire/data/datamodels/questionnaire_response_model.dart';


abstract class QuestionnaireRepository {
  Future<Either<Failure, Questionnaire>> getFormDetail({String pid});
  Future<Either<Failure, Success>> saveFormResponse({QuestionnaireResponse response});
}
