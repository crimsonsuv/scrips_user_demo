import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:scrips_core/constants/status_objects.dart';
import 'package:scrips_core/usecase/usecase.dart';
import 'package:scrips_ua/features/Questionnaire/data/datamodels/questionnaire_model.dart';
import 'package:scrips_ua/features/Questionnaire/domain/repository/questionnaire_repository.dart';

class FetchFormDataUseCase extends UseCase<Questionnaire, FetchFormDataParams> {
  QuestionnaireRepository repository;

  FetchFormDataUseCase({@required this.repository});

  @override
  Future<Either<Failure, Questionnaire>> call(FetchFormDataParams params) {
    return repository.getFormDetail(pid: params.pid);
  }
}

class FetchFormDataParams extends Equatable {
  final String pid;

  FetchFormDataParams({
    @required this.pid,
  }) : super([pid]);
}
