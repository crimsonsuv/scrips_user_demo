import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scrips_core/ui_helpers/app_colors.dart';
import 'package:scrips_core/ui_helpers/text_styles.dart';
import 'package:scrips_ua/features/Questionnaire/data/datamodels/questionnaire_model.dart' as Questionnaire;
import 'package:scrips_ua/features/Questionnaire/data/datamodels/questionnaire_response_model.dart' as QuestionnaireResponse;
import 'package:scrips_ua/features/Questionnaire/presentation/bloc/questionnaire_bloc.dart';
import 'package:scrips_ua/features/Questionnaire/presentation/bloc/questionnaire_event.dart';
import 'package:scrips_ua/features/Questionnaire/presentation/bloc/questionnaire_state.dart';
import 'package:scrips_ua/features/Questionnaire/presentation/widgets/questions_type_widgets/questions_answer_view/boolean_answer_widget.dart';
import 'package:scrips_ua/features/Questionnaire/presentation/widgets/questions_type_widgets/questions_answer_view/choice_answer_widget.dart';
import 'package:scrips_ua/features/Questionnaire/presentation/widgets/questions_type_widgets/questions_answer_view/group_answer_widget.dart';
import 'package:scrips_ua/features/Questionnaire/presentation/widgets/questions_type_widgets/questions_answer_view/open_choice_answer_widget.dart';
import 'package:scrips_ua/features/Questionnaire/presentation/widgets/questions_type_widgets/questions_answer_view/string_answer_widget.dart';

class QuestionListWidget extends StatefulWidget {
  QuestionListWidget({Key key, this.formData, this.bloc, this.response}) : super(key: key);
  final Questionnaire.Questionnaire formData;
  final QuestionnaireResponse.QuestionnaireResponse response;
  final QuestionnaireBloc bloc;

  @override
  _QuestionListWidgetState createState() => _QuestionListWidgetState();
}

class _QuestionListWidgetState extends State<QuestionListWidget>
    with TickerProviderStateMixin {
  @override
  void dispose() async {
    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  Widget questionWidgetItem(Questionnaire.Item questionItem, QuestionnaireResponse.Item responseItem,  int index) {
    switch (questionItem.type) {
      case "String":
          return StringAnswerWidget(
            questionItem: questionItem,
            answerItem: responseItem,
            onChanged: (answer){
              responseItem = answer;
              widget.bloc.dispatch(EnableSaveButtonEvent(response: widget.response));
            },
          );

        break;
      case "Boolean":
        BlocBuilder<QuestionnaireBloc, QuestionnaireState>(
          bloc: widget.bloc,
          builder: (context, state) {
            return BooleanAnswerWidget(
              questionItem: questionItem,
              answerItem: responseItem,
              onChanged: (answer){
                responseItem = answer;
                widget.bloc.dispatch(EnableSaveButtonEvent(response: widget.response));
              },
            );
          },
        );
        break;
      case "Choice":
        return BlocBuilder<QuestionnaireBloc, QuestionnaireState>(
          bloc: widget.bloc,
          builder: (context, state) {
            return ChoiceAnswerWidget(
              questionItem: questionItem,
              answerItem: responseItem,
              onChanged: (answer){
                responseItem = answer;
                widget.bloc.dispatch(EnableSaveButtonEvent(response: widget.response));
              },
            );
          },
        );
        break;
      case "OpenChoice":
        return BlocBuilder<QuestionnaireBloc, QuestionnaireState>(
          bloc: widget.bloc,
          builder: (context, state) {
            return OpenChoiceAnswerWidget(
              questionItem: questionItem,
              answerItem: responseItem,
              onChanged: (answer){
                responseItem = answer;
                widget.bloc.dispatch(EnableSaveButtonEvent(response: widget.response));
              },
            );
          },
        );
        break;
      case "Group":
          return GroupAnswerWidget(
            questionItem: questionItem,
            answerItem: responseItem,
            bloc: widget.bloc,
            onChanged: (answer){
              responseItem = answer;
              widget.bloc.dispatch(EnableSaveButtonEvent(response: widget.response));
            },
          );
        break;
      default:
        return Text('Un-identified question type', textScaleFactor: 2);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ((widget?.formData?.items?.length ?? 0) == 0)
        ? Container(
      height: 100,
            child: Center(
              child: Text(
                "No Questions Added",
                style: normalLabelTextStyle(13, defaultFieldHintColor),
              ),
            ),
          )
        : SizedBox.fromSize(
            child: BlocBuilder<QuestionnaireBloc, QuestionnaireState>(
              bloc: widget.bloc,
              condition: (currState, oldState){
                if(currState is EnableSaveButtonState){
                  return false;
                }
                return true;
              },
              builder: (context, state) {
                return ListView.builder(
                    padding: const EdgeInsets.all(8),
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: widget?.formData?.items?.length ?? 0,
                    itemBuilder: (BuildContext context, int index) {
                      return AnimatedSize(
                        vsync: this,
                        duration: Duration(milliseconds: 300),
                        curve: Curves.fastOutSlowIn,
                        child: ConstrainedBox(
                          constraints: BoxConstraints(maxWidth: 625),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 6, vertical: 8),
                            child: questionWidgetItem(widget?.formData?.items[index], widget?.response?.items[index], index),
                          ),
                        ),
                      );
                    }
                );
              },
            ),
          );
  }
}
