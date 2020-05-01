import 'package:meta/meta.dart';
import 'package:scrips_ua/features/Questionnaire/data/datamodels/questionnaire_model.dart';
import 'package:scrips_ua/features/Questionnaire/data/datamodels/questionnaire_response_model.dart';

@immutable
abstract class QuestionnaireState {}

class InitialQuestionnaireState extends QuestionnaireState {}

class FetchFormDataState extends QuestionnaireState {
  final Questionnaire formData;
  FetchFormDataState({@required this.formData});
}

class ShowAlertMessageState extends QuestionnaireState {
  final String message;
  ShowAlertMessageState({@required this.message});
}

class ErrorState extends QuestionnaireState {
  final String message;

  ErrorState(this.message);
}

class LoadingBeginState extends QuestionnaireState {}

class LoadingEndState extends QuestionnaireState {}

class EnableSaveButtonState extends QuestionnaireState {
  final bool status;
  final QuestionnaireResponse response;
  EnableSaveButtonState({@required this.response, this.status});
}

class SaveFormResponseDataState extends QuestionnaireState {}