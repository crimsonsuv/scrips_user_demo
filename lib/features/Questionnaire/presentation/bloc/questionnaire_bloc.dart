import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:scrips_ua/features/Questionnaire/domain/usecases/get_form_data_use_case.dart';
import 'package:scrips_ua/features/Questionnaire/domain/usecases/save_form_response_use_case.dart';
import './bloc.dart';

class QuestionnaireBloc extends Bloc<QuestionnaireEvent, QuestionnaireState> {
  @override
  QuestionnaireState get initialState => InitialQuestionnaireState();

  FetchFormDataUseCase fetchFormDataUseCase;
  SaveFormResponseUseCase saveFormResponseUseCase;

  QuestionnaireBloc({@required this.saveFormResponseUseCase, @required this.fetchFormDataUseCase});

  @override
  Stream<QuestionnaireState> mapEventToState(
    QuestionnaireEvent event,
  ) async* {
    if(event is FetchFormDataEvent){
      yield LoadingBeginState();
      final result =
      await fetchFormDataUseCase(FetchFormDataParams(pid: event.pid));
      yield LoadingEndState();
      yield result.fold(
            (error) => ErrorState(error.message),
            (success) => FetchFormDataState(formData: success),
      );
    } else if(event is ShowAlertMessageEvent){
      yield ShowAlertMessageState(message: event.message);
    } else if(event is ShowErrorMessageEvent){
      yield ErrorState(event.message);
    } else if(event is EnableSaveButtonEvent){
      bool status = true;
      yield EnableSaveButtonState(response: event.response, status: status);
    } else if(event is SaveFormResponseDataEvent){
      yield LoadingBeginState();
      final result = await saveFormResponseUseCase(
          SaveFormResponseParams(response: event.response));
      yield LoadingEndState();
      yield result.fold(
            (error) => ErrorState(error.message),
            (success) => SaveFormResponseDataState(),
      );
    }
  }
}
