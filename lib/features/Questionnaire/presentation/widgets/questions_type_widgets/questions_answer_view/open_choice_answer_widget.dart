import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scrips_core/ui_helpers/app_colors.dart';
import 'package:scrips_core/ui_helpers/text_styles.dart';
import 'package:scrips_core/widgets/general/space.dart';
import 'package:scrips_ua/core/util/utils.dart';
import 'package:scrips_ua/features/Questionnaire/data/datamodels/questionnaire_model.dart'
    as questionnaire;
import 'package:scrips_ua/features/Questionnaire/data/datamodels/questionnaire_response_model.dart'
    as questionnaireResponse;
import 'package:scrips_ua/features/Questionnaire/presentation/widgets/questions_type_widgets/common/answer_top_buttons_widget.dart';

class OpenChoiceAnswerWidget extends StatefulWidget {
  OpenChoiceAnswerWidget({
    Key key,
    this.showButtons = true,
    this.questionItem,
    this.answerItem,
    this.onChanged,
  }) : super(key: key);
  final bool showButtons;
  final questionnaire.Item questionItem;
  final questionnaireResponse.Item answerItem;
  final Function onChanged;

  @override
  _OpenChoiceAnswerWidgetState createState() => _OpenChoiceAnswerWidgetState();
}

class _OpenChoiceAnswerWidgetState extends State<OpenChoiceAnswerWidget> {
  @override
  void dispose() async {
    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: enabledBtnTextColor,
        borderRadius: BorderRadius.circular(13),
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: <
          Widget>[
        Padding(
          padding: widget.showButtons ? EdgeInsets.all(24) : EdgeInsets.all(0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              widget.showButtons
                  ? Column(
                      children: <Widget>[
                        AnswerTopButtonsWidget(
                          image: groupIcon(widget?.questionItem?.groups?.name),
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Flexible(
                    child: Text(
                      "${widget?.questionItem?.text ?? ""}",
                      style: normalLabelTextStyle(17, regularTextColor),
                    ),
                  ),
                  (widget?.questionItem?.required ?? false)
                      ? Text(
                          ' *',
                          style: normalLabelTextStyle(
                              17, defaultValidationTextColor),
                          textAlign: TextAlign.start,
                        )
                      : Container()
                ],
              ),
              Space(
                vertical: 20,
              ),
              ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  padding: const EdgeInsets.only(top: 0),
                  itemCount: widget?.questionItem?.answerOptions?.length ?? 0,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        (index > 0)
                            ? Space(
                                vertical: 24,
                              )
                            : Container(),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(top: 2),
                              child: Container(
                                width: 16.0,
                                height: 16.0,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: ((widget?.answerItem?.answer
                                                    ?.valueCoding
                                                    ?.where((element) =>
                                                        element.code ==
                                                        widget
                                                            ?.questionItem
                                                            ?.answerOptions[
                                                                index]
                                                            .valueCoding
                                                            .code)
                                                    ?.toList()
                                                    ?.length ??
                                                0) >
                                            0)
                                        ? enabledBtnBGColor
                                        : Colors.transparent,
                                    border: Border.all(
                                        color: ((widget?.answerItem?.answer
                                                        ?.valueCoding
                                                        ?.where((element) => element.code == widget?.questionItem?.answerOptions[index].valueCoding.code)
                                                        ?.toList()
                                                        ?.length ??
                                                    0) >
                                                0)
                                            ? enabledBtnBGColor
                                            : Colors.grey)),
                                child: FlatButton(
                                  onPressed: () {
                                    if (((widget?.answerItem?.answer
                                                ?.valueCoding
                                                ?.where((element) =>
                                                    element.code ==
                                                    widget
                                                        ?.questionItem
                                                        ?.answerOptions[index]
                                                        .valueCoding
                                                        .code)
                                                ?.toList()
                                                ?.length ??
                                            0) >
                                        0)) {
                                      widget.answerItem.answer.valueCoding
                                          .removeWhere((element) =>
                                              element.code ==
                                              widget
                                                  ?.questionItem
                                                  ?.answerOptions[index]
                                                  .valueCoding
                                                  .code);
                                    } else {
                                      widget.answerItem.answer.valueCoding.add(
                                          questionnaireResponse.ValueCoding(
                                              code: widget
                                                  ?.questionItem
                                                  ?.answerOptions[index]
                                                  .valueCoding
                                                  .code,
                                              display: widget
                                                  ?.questionItem
                                                  ?.answerOptions[index]
                                                  .valueCoding
                                                  .display,
                                              system: widget
                                                  ?.questionItem
                                                  ?.answerOptions[index]
                                                  .valueCoding
                                                  .system));
                                    }
                                    widget.onChanged(widget.answerItem);
                                  },
                                ),
                              ),
                            ),
                            Space(
                              horizontal: 18,
                            ),
                            Expanded(
                              child: Text(
                                "${widget?.questionItem?.answerOptions[index]?.valueCoding?.display ?? ""}",
                                style:
                                    normalLabelTextStyle(17, regularTextColor),
                                //softWrap: false,
                                //overflow: TextOverflow.fade,
                                maxLines: 2,
                              ),
                            )
                          ],
                        ),
                      ],
                    );
                  }),
            ],
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Space(
              vertical: 4,
            ),
            Container(
              height: 1,
              color: separatorColor,
            ),
            Container(
              height: 64,
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Not on the list?",
                      style:
                          semiBoldLabelTextStyle(15, labelTextStyleTextColor),
                    ),
                    Text(
                      " Search ${widget?.questionItem?.groups?.name ?? ""}",
                      style: semiBoldLabelTextStyle(15, enabledBtnBGColor),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ]),
    );
  }
}
