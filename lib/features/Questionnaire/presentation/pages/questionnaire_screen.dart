import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oktoast/oktoast.dart';
import 'package:scrips_core/ui_helpers/app_colors.dart';
import 'package:scrips_core/ui_helpers/text_styles.dart';
import 'package:scrips_core/widgets/general/space.dart';
import 'package:scrips_core/widgets/general/toast_widget.dart';
import 'package:scrips_ua/core/constants/app_assets.dart';
import 'package:scrips_ua/di/dependency_injection.dart';
import 'package:scrips_ua/features/Questionnaire/data/datamodels/questionnaire_model.dart';
import 'package:scrips_ua/features/Questionnaire/data/datamodels/questionnaire_response_model.dart' as QuestionnaireResponse;
import 'package:scrips_ua/features/Questionnaire/presentation/bloc/bloc.dart';
import 'package:scrips_ua/features/Questionnaire/presentation/widgets/question_list_widget.dart';


class QuestionnaireScreen extends StatefulWidget {
  const QuestionnaireScreen({
    Key key,
    this.patientId,
  }) : super(key: key);
  final String patientId;

  @override
  _QuestionnaireScreenState createState() => _QuestionnaireScreenState();
}

class _QuestionnaireScreenState extends State<QuestionnaireScreen> {
  final bloc = uaSl<QuestionnaireBloc>();
  bool isLoading = false;
  Questionnaire formData;
  QuestionnaireResponse.QuestionnaireResponse response;
  bool isSaveEnabled = false;

  @override
  void initState() {
    super.initState();
    bloc.dispatch(FetchFormDataEvent(pid: widget.patientId));
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return OKToast(
      child: BlocListener(
          bloc: bloc,
          listener: (BuildContext context, state) {
           if (state is ErrorState) {
              showToastWidget(
                ToastWidget(
                  width: 250,
                  message: state.message,
                  backgroundColor: red,
                ),
                position: ToastPosition.top,
                context: context,
                duration: Duration(seconds: 4),
              );
            } else if (state is LoadingBeginState) {
              isLoading = true;
            } else if (state is LoadingEndState) {
              isLoading = false;
            } else if (state is FetchFormDataState){
             if((state?.formData?.items?.length ?? 0) == 0){
               showToastWidget(
                   ToastWidget(
                     width: 250,
                     message: "No form available to answer",
                     backgroundColor: red,
                   ),
                   position: ToastPosition.top,
                   context: context,
                   duration: Duration(seconds: 3), onDismiss: () {
                 Navigator.pop(context);
               });
             }
             formData = state.formData;
             List<QuestionnaireResponse.Item> items = [];
             formData.items.forEach((element) {
               List<QuestionnaireResponse.Item> subitems = [];
               element.items.forEach((element1) {
                 subitems.add(QuestionnaireResponse.Item(questionId: element1.id, linkId: element1.linkId, text: element1.text, type: element1.type, answer: QuestionnaireResponse.Answer(valueBoolean: null, valueString: "", valueCoding: []), items: []));
               });
               items.add(QuestionnaireResponse.Item(questionId: element.id, linkId: element.linkId, text: element.text, type: element.type, answer: QuestionnaireResponse.Answer(valueBoolean: null, valueString: "", valueCoding: []), items: subitems));
             });
             response = QuestionnaireResponse.QuestionnaireResponse(questionnaireId: formData.id, subject: widget.patientId, author: formData.practitionerId, items:items);
            } else if (state is EnableSaveButtonState){
             response = state.response;
             isSaveEnabled = state.status;
           } else if (state is ShowAlertMessageState) {
             showToastWidget(
               ToastWidget(
                 width: 250,
                 message: state.message,
                 backgroundColor: Colors.black54,
               ),
               position: ToastPosition.top,
               context: context,
               duration: Duration(seconds: 2),
             );
           } else if(state is SaveFormResponseDataState){
             showToastWidget(
                 ToastWidget(
                   width: 250,
                   message: "Form Response Successfully Sent",
                   backgroundColor: Colors.black87,
                 ),
                 position: ToastPosition.top,
                 context: context,
                 duration: Duration(seconds: 3), onDismiss: () {
               Navigator.pop(context);
             });
           }
          },
          child: BlocBuilder<QuestionnaireBloc, QuestionnaireState>(
              bloc: bloc,
              condition: (currState, oldState){
                if(currState is EnableSaveButtonState){
                  return false;
                }
                return true;
              },
              builder: (context, state) {
                return SafeArea(
                  child: Scaffold(
                    backgroundColor: bgColor,
                    appBar: AppBar(
                      backgroundColor: enabledBtnTextColor,
                      elevation: 0.5,
                      title: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text("${formData?.title ?? ""}", style: boldLabelTextStyle(17, textInputColor),),
                        ],
                      ),
                      leading: InkWell(onTap:(){
                        Navigator.pop(context);
                      },child: Images.instance.asset(name: "ic_back")),
                      actions: <Widget>[
                        InkWell(
                          onTap: (){
                            bloc.dispatch(SaveFormResponseDataEvent(response: response));
                          },
                          child: Container(child: Padding(
                            padding: const EdgeInsets.only(right: 16),
                            child: Center(child: Text("Submit", style: semiBoldLabelTextStyle(16, enabledBtnBGColor),)),
                          )),
                        )
                      ],
                    ),
                    body: Column(
                      children: <Widget>[
                        isLoading
                            ? Container(
                          color: separatorColor,
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 16, bottom: 16),
                            child: Center(
                                child: Row(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.center,
                                  mainAxisAlignment:
                                  MainAxisAlignment.center,
                                  children: <Widget>[
                                    SizedBox(
                                        height: 30,
                                        width: 30,
                                        child:
                                        CircularProgressIndicator(
                                          valueColor:
                                          AlwaysStoppedAnimation<
                                              Color>(
                                              enabledBtnBGColor),
                                        )),
                                    Space(
                                      horizontal: 20,
                                    ),
                                    Text(
                                        (isSaveEnabled) ? "Please wait, sending data.." : "Please wait, fetching data..",
                                        style:
                                        semiBoldLabelTextStyle(
                                            14,
                                            regularTextColor)),
                                  ],
                                )),
                          ),
                        )
                            : Container(),
                        Expanded(
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: <Widget>[
                                isLoading ? Container() : (formData?.id == null) ? Container() : Padding(
                                  padding: const EdgeInsets.only(left: 16, right: 16, top: 20),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: enabledBtnTextColor,
                                      borderRadius: BorderRadius.circular(13),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: Column(
                                        children: <Widget>[
                                          Text("Dr ${formData?.publisher ?? "N/A"}", style: boldLabelTextStyle(17, textInputColor), textAlign: TextAlign.center,),
                                          Space(vertical: 4,),
                                          Text("Nuerology", style: normalLabelTextStyle(15, defaultFieldHintColor), textAlign: TextAlign.center,),
                                          Space(vertical: 24,),
                                          Text("Please, complete this check-in form before your \nvisit at 5:30 PM on May 30, 2020. ", style: normalLabelTextStyle(15, regularTextColor), textAlign: TextAlign.center,),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Space(vertical: 24,),
                                (formData?.id == null) ? Container() : Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 16),
                                child: Text("${formData?.items?.length ?? 0} QUESTIONS ADDED", style: boldLabelTextStyle(12, textInputColor),),
                              ),
                              SizedBox(
                                child: QuestionListWidget(formData: formData, bloc: bloc, response: response,),
                              ),
                                Space(vertical: 24,),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              })),
    );
  }
}
