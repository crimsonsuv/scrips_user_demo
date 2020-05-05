import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tags/flutter_tags.dart';
import 'package:scrips_core/ui_helpers/app_colors.dart';
import 'package:scrips_core/ui_helpers/text_styles.dart';
import 'package:scrips_core/widgets/general/space.dart';
import 'package:scrips_ua/core/constants/api_constats.dart';
import 'package:scrips_ua/features/Questionnaire/data/datamodels/questionnaire_model.dart'
    as questionnaire;
import 'package:scrips_ua/features/Questionnaire/data/datamodels/questionnaire_response_model.dart'
    as questionnaireResponse;
import 'package:scrips_ua/features/Questionnaire/presentation/widgets/questions_type_widgets/common/answer_top_buttons_widget.dart';

class ChoiceAnswerWidget extends StatefulWidget {
  ChoiceAnswerWidget(
      {Key key,
      this.showButtons = true,
      this.questionItem,
      this.onChanged,
      this.onSearch,
      this.answerItem})
      : super(key: key);
  final bool showButtons;
  final questionnaire.Item questionItem;
  final questionnaireResponse.Item answerItem;
  final Function onChanged;
  final Function onSearch;

  @override
  _ChoiceAnswerWidgetState createState() => _ChoiceAnswerWidgetState();
}

class _ChoiceAnswerWidgetState extends State<ChoiceAnswerWidget> {
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
              Tags(
                spacing: 8,
                columns: 5,
                runSpacing: 8,
                alignment: WrapAlignment.start,
                runAlignment: WrapAlignment.start,
                symmetry: false,
                itemCount: widget?.questionItem?.answerOptions?.length ?? 0,
                itemBuilder: (int index) {
                  return ItemTags(
                    singleItem: true,
                    index: index, // required
                    elevation: 0,
                    padding:
                        EdgeInsets.only(left: 20, right: 20, top: 7, bottom: 7),
                    title:
                        "${widget?.questionItem?.answerOptions[index].valueCoding?.display ?? ""}",
                    textColor: regularTextColor,
                    textActiveColor: enabledBtnTextColor,
                    color: bgColor,
                    activeColor: enabledBtnBGColor,
                    border: Border.all(width: 0, color: Colors.transparent),
                    active: ((widget?.answerItem?.answer?.valueCoding
                                ?.where((element) =>
                                    element.code ==
                                    widget?.questionItem?.answerOptions[index]
                                        .valueCoding.code)
                                ?.toList()
                                ?.length ??
                            0) >
                        0),
                    textStyle: normalLabelTextStyle(15, regularTextColor),
                    combine: ItemTagsCombine.withTextBefore, // OR null,
                    onPressed: (item) {
                      widget.answerItem.answer.valueCoding.clear();
                      widget.answerItem.answer.valueCoding.add(
                          questionnaireResponse.ValueCoding(
                              code: widget?.questionItem?.answerOptions[index]
                                  .valueCoding.code,
                              display: widget?.questionItem
                                  ?.answerOptions[index].valueCoding.display,
                              system: widget?.questionItem?.answerOptions[index]
                                  .valueCoding.system));
                      widget.onChanged(widget.answerItem);
                    },
                    onLongPressed: (item) => print(item),
                  );
                },
              ),
            ],
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Space(
              vertical: 10,
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
                    InkWell(
                      onTap: () {
                        widget.onSearch();
                      },
                      child: Text(
                        " Search ${widget?.questionItem?.groups?.name ?? ""}",
                        style: semiBoldLabelTextStyle(15, enabledBtnBGColor),
                      ),
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
