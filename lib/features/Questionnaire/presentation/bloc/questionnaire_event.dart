import 'package:meta/meta.dart';
import 'package:scrips_ua/features/Questionnaire/data/datamodels/questionnaire_model.dart';
import 'package:scrips_ua/features/Questionnaire/data/datamodels/questionnaire_response_model.dart';

@immutable
abstract class QuestionnaireEvent {}

class FetchFormDataEvent extends QuestionnaireEvent {
  final String pid;
  FetchFormDataEvent({@required this.pid});
}

class ShowAlertMessageEvent extends QuestionnaireEvent {
  final String message;
  ShowAlertMessageEvent({@required this.message});
}

class ShowErrorMessageEvent extends QuestionnaireEvent {
  final String message;
  ShowErrorMessageEvent({@required this.message});
}

class EnableSaveButtonEvent extends QuestionnaireEvent {
  final QuestionnaireResponse response;
  final Questionnaire formData;
  EnableSaveButtonEvent({@required this.response, @required this.formData});
}

class SaveFormResponseDataEvent extends QuestionnaireEvent {
  final QuestionnaireResponse response;
  SaveFormResponseDataEvent({@required this.response});
}