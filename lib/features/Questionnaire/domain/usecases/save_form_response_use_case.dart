import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:scrips_core/constants/status_objects.dart';
import 'package:scrips_core/usecase/usecase.dart';
import 'package:scrips_ua/features/Questionnaire/data/datamodels/questionnaire_response_model.dart';
import 'package:scrips_ua/features/Questionnaire/domain/repository/questionnaire_repository.dart';

class SaveFormResponseUseCase extends UseCase<Success, SaveFormResponseParams> {
  QuestionnaireRepository repository;

  SaveFormResponseUseCase({@required this.repository});

  @override
  Future<Either<Failure, Success>> call(SaveFormResponseParams params) {
    return repository.saveFormResponse(response: params.response);
  }
}

class SaveFormResponseParams extends Equatable {
  final QuestionnaireResponse response;

  SaveFormResponseParams({
    @required this.response,
  }) : super([response]);
}
