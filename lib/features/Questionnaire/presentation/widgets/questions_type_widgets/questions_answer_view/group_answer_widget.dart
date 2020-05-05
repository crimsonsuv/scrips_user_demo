import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scrips_core/ui_helpers/app_colors.dart';
import 'package:scrips_core/ui_helpers/text_styles.dart';
import 'package:scrips_core/widgets/general/space.dart';
import 'package:scrips_ua/core/constants/api_constats.dart';
import 'package:scrips_ua/features/Questionnaire/data/datamodels/questionnaire_model.dart'
    as questionnaire;
import 'package:scrips_ua/features/Questionnaire/data/datamodels/questionnaire_response_model.dart'
    as questionnaireResponse;
import 'package:scrips_ua/features/Questionnaire/presentation/bloc/bloc.dart';
import 'package:scrips_ua/features/Questionnaire/presentation/widgets/questions_type_widgets/common/answer_top_buttons_widget.dart';
import 'package:scrips_ua/features/Questionnaire/presentation/widgets/questions_type_widgets/questions_answer_view/boolean_answer_widget.dart';
import 'package:scrips_ua/features/Questionnaire/presentation/widgets/questions_type_widgets/questions_answer_view/choice_answer_widget.dart';
import 'package:scrips_ua/features/Questionnaire/presentation/widgets/questions_type_widgets/questions_answer_view/open_choice_answer_widget.dart';
import 'package:scrips_ua/features/Questionnaire/presentation/widgets/questions_type_widgets/questions_answer_view/string_answer_widget.dart';

class GroupAnswerWidget extends StatefulWidget {
  GroupAnswerWidget({
    Key key,
    this.showButtons = true,
    this.questionItem,
    this.answerItem,
    this.bloc,
    this.onChanged,
  }) : super(key: key);
  final bool showButtons;
  final questionnaire.Item questionItem;
  final questionnaireResponse.Item answerItem;
  final QuestionnaireBloc bloc;
  final Function onChanged;

  @override
  _GroupAnswerWidgetState createState() => _GroupAnswerWidgetState();
}

class _GroupAnswerWidgetState extends State<GroupAnswerWidget> {
  @override
  void dispose() async {
    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  Widget questionWidgetItem(questionnaire.Item questionItem,
      questionnaireResponse.Item responseItem) {
    switch (questionItem.type) {
      case "String":
        return StringAnswerWidget(
          questionItem: questionItem,
          answerItem: responseItem,
          showButtons: false,
          onChanged: (answer) {
            responseItem = answer;
            widget.onChanged(responseItem);
          },
        );

        break;
      case "Boolean":
        return BlocBuilder<QuestionnaireBloc, QuestionnaireState>(
          bloc: widget.bloc,
          builder: (context, state) {
            return BooleanAnswerWidget(
              showButtons: false,
              questionItem: questionItem,
              answerItem: responseItem,
              onChanged: (answer) {
                responseItem = answer;
                widget.onChanged(responseItem);
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
              showButtons: false,
              questionItem: questionItem,
              answerItem: responseItem,
              onChanged: (answer) {
                responseItem = answer;
                widget.onChanged(responseItem);
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
              showButtons: false,
              questionItem: questionItem,
              answerItem: responseItem,
              onChanged: (answer) {
                responseItem = answer;
                widget.onChanged(responseItem);
              },
            );
          },
        );
        break;
      case "Group":
        return GroupAnswerWidget(
          questionItem: questionItem,
          answerItem: responseItem,
          onChanged: (answer) {
            responseItem = answer;
            widget.onChanged(responseItem);
          },
        );
        break;
      default:
        return Text('Un-identified question type', textScaleFactor: 2);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: enabledBtnTextColor,
        borderRadius: BorderRadius.circular(13),
      ),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  widget.showButtons
                      ? Column(
                          children: <Widget>[
                            AnswerTopButtonsWidget(
                              image: Image.network(
                                  "$questionBankServer/${widget?.questionItem?.groups?.icon ?? ""}"),
                              title:
                                  "${widget?.questionItem?.groups?.name ?? "N/A"}"
                                      .toUpperCase(),
                            ),
                            Space(
                              vertical: 24,
                            ),
                          ],
                        )
                      : Container(),
                  Row(
                    children: <Widget>[
                      Text(
                        "${widget?.questionItem?.text ?? ""}",
                        style: normalLabelTextStyle(17, regularTextColor),
                      ),
//                  Text(
//                    ' *',
//                    style: normalLabelTextStyle(17, defaultValidationTextColor),
//                    textAlign: TextAlign.start,
//                  )
                    ],
                  ),
                  Space(
                    vertical: 8,
                  ),
                  SizedBox.fromSize(
                    child: ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        padding: const EdgeInsets.only(top: 0),
                        itemCount: (widget?.questionItem?.items?.length ?? 0),
                        itemBuilder: (BuildContext context, int index) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: <Widget>[
                              Space(
                                vertical: 24,
                              ),
                              questionWidgetItem(
                                  widget?.questionItem?.items[index],
                                  widget?.answerItem?.items[index]),
                            ],
                          );
                        }),
                  ),
                ],
              ),
            ),
          ]),
    );
  }
}
