import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:scrips_core/constants/status_objects.dart';
import 'package:scrips_ua/core/util/utils.dart';
import 'package:scrips_ua/features/Questionnaire/data/datamodels/questionnaire_model.dart';
import 'package:scrips_ua/features/Questionnaire/data/datamodels/questionnaire_response_model.dart';
import 'package:scrips_ua/features/Questionnaire/data/datasources/forms_data_source.dart';
import 'package:scrips_ua/features/Questionnaire/domain/repository/questionnaire_repository.dart';


class QuestionnaireRepositoryImpl extends QuestionnaireRepository {
  QuestionnaireDataSource questionnaireDataSource;

  QuestionnaireRepositoryImpl({@required this.questionnaireDataSource});

  @override
  Future<Either<Failure, Questionnaire>> getFormDetail({String pid}) async {
    try {
      final result = await questionnaireDataSource.getFormDetail(pid: pid);
      return Right(result);
    } on DioError catch (e) {
      if (e.response.statusCode == 404) {
        return Right(Questionnaire(items: []));
      }
      return (Left(handleFailure(e)));
    } on Failure {
      return Left(Failure("Request time out.."));
    }
  }

  @override
  Future<Either<Failure, Success>> saveFormResponse({QuestionnaireResponse response}) async {
    try {
      final result = await questionnaireDataSource.saveFormResponse(response: response);
      return Right(result);
    } on DioError catch (e) {
      return (Left(handleFailure(e)));
    } on Failure {
      return Left(Failure("Request time out.."));
    }
  }

}
