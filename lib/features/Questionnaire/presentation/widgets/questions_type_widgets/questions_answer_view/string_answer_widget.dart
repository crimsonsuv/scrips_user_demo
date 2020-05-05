import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scrips_core/ui_helpers/app_colors.dart';
import 'package:scrips_core/ui_helpers/text_styles.dart';
import 'package:scrips_core/widgets/general/field_and_label.dart';
import 'package:scrips_core/widgets/general/space.dart';
import 'package:scrips_ua/core/constants/api_constats.dart';
import 'package:scrips_ua/features/Questionnaire/data/datamodels/questionnaire_model.dart'
    as questionnaire;
import 'package:scrips_ua/features/Questionnaire/data/datamodels/questionnaire_response_model.dart'
    as questionnaireResponse;
import 'package:scrips_ua/features/Questionnaire/presentation/widgets/questions_type_widgets/common/answer_top_buttons_widget.dart';

class StringAnswerWidget extends StatefulWidget {
  StringAnswerWidget(
      {Key key,
      this.showButtons = true,
      this.questionItem,
      this.onChanged,
      this.answerItem})
      : super(key: key);
  final bool showButtons;
  final Function onChanged;
  final questionnaire.Item questionItem;
  final questionnaireResponse.Item answerItem;

  @override
  _StringAnswerWidgetState createState() => _StringAnswerWidgetState();
}

class _StringAnswerWidgetState extends State<StringAnswerWidget> {
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
      child: Padding(
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
                vertical: 18,
              ),
              FieldAndLabel(
                isMandatory: (widget?.questionItem?.required ?? false),
                margin: EdgeInsets.all(0),
                padding: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
                fieldBackgroundColor: textFieldBGcolor,
                fieldTextColor: textInputColor,
                fieldType: FieldType.TextField,
                labelTextStyle: defaultFieldLabelStyle(null, null),
                labelValue: "Answer".toUpperCase(),
                fieldValue: widget?.answerItem?.answer?.valueString ?? "",
                maxLength: 100,
                onChanged: (value, FieldAndLabelState state) {
                  widget?.answerItem?.answer?.valueString = value;
                  widget.onChanged(widget.answerItem);
                },
                placeholder: "Enter answer",
                axis: Axis.vertical,
                enabled: true,
              ),
            ]),
      ),
    );
  }
}
