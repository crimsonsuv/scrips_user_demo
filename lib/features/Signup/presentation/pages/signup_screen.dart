import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oktoast/oktoast.dart';
import 'package:scrips_core/ui_helpers/app_colors.dart';
import 'package:scrips_core/ui_helpers/text_styles.dart';
import 'package:scrips_core/utils/utils.dart';
import 'package:scrips_core/widgets/general/field_and_label.dart';
import 'package:scrips_core/widgets/general/space.dart';
import 'package:scrips_core/widgets/general/toast_widget.dart';
import 'package:scrips_shared_features/features/common/data/datamodels/gender_model.dart';
import 'package:scrips_ua/core/constants/app_assets.dart';
import 'package:scrips_ua/core/route/app_route_paths.dart';
import 'package:scrips_ua/di/dependency_injection.dart';
import 'package:scrips_ua/features/Signup/data/datamodel/patient_list_model.dart';
import 'package:scrips_ua/features/Signup/presentation/bloc/bloc.dart';
import 'package:scrips_ua/features/Signup/presentation/bloc/signup_bloc.dart';
import 'package:validators/validators.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({
    Key key,
  }) : super(key: key);

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> with TickerProviderStateMixin {
  final bloc = uaSl<SignupBloc>();
  bool isLoading = false;
  bool isNextEnabled = false;
  String fistName ="";
  String lastName ="";
  String email ="";
  DateTime dob;
  String contact ="";
  String gender;
  List<Gender> genderList;
  List<PatientList> patientList;

  @override
  void initState() {
    super.initState();
    bloc.dispatch(FetchGendersEvent());
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
            } else if(state is EnableNextState){
              isNextEnabled = state.status;
            } else if(state is GetPatientState){
              patientList = state.patients;
              if(patientList.length == 1){
                Future.delayed(Duration(milliseconds: 100), () {
                  Navigator.pushNamed(context, AppRoutePaths.Questionnaire, arguments: patientList.first.patientId);
                });
              } else {
                Future.delayed(Duration(milliseconds: 100), () {
                  Navigator.pushNamed(context, AppRoutePaths.PatientList, arguments: patientList);
                });
              }

            } else if (state is FetchGendersState) {
              genderList = state.genderList;
            }
          },
          child: BlocBuilder<SignupBloc, SignupState>(
              bloc: bloc,
              condition: (preSate, currSate) {
                if (currSate is EnableNextState) {
                  return false;
                }
                return true;
              },
              builder: (context, state) {
                return body(context);
              })),
    );
  }

  Widget body(context){
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
              Padding(
                padding: const EdgeInsets.only(top: 6),
                child: Images.instance.asset(name: "ic_branding_small"),
              ),
            ],
          ),
          leading: InkWell(onTap:(){
            Navigator.pop(context);
          },child: Images.instance.asset(name: "ic_back")),
          actions: <Widget>[
            BlocBuilder<SignupBloc, SignupState>(
              bloc: bloc,
              builder: (context, state) {
                if (state is EnableNextState) {
                  dob = state.dob;
                }
                return InkWell(
                  onTap: (isNextEnabled) ?  (){
                    bloc.dispatch(FetchPatientEvent(firstName: fistName, lastName: lastName, email: email, dob: dob, contact: contact, gender: gender));
                  } : null,
                  child: Container(child: Padding(
                    padding: const EdgeInsets.only(right: 16),
                    child: Center(child: Text("NEXT", style: semiBoldLabelTextStyle(15, isNextEnabled ? enabledBtnBGColor : disabledBtnBGColor),)),
                  )),
                );
              },
            ),
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
                            (isNextEnabled) ? "Please wait, sending data.." : "Please wait, fetching data..",
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
                child: AnimatedSize(
                  vsync: this,
                  duration: Duration(milliseconds: 300),
                  curve: Curves.fastOutSlowIn,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Space(vertical: 24,),
                      Text("Enter Your Details", style: boldLabelTextStyle(17, textInputColor), textAlign: TextAlign.center,),
                      Space(vertical: 8,),
                      Text("This info lets providers give more helpful, \npersonalized experience", style: normalLabelTextStyle(15, regularTextColor), textAlign: TextAlign.center,),
                      Space(vertical: 24,),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Container(
                          decoration: BoxDecoration(
                            color: enabledBtnTextColor,
                            borderRadius: BorderRadius.circular(13),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 26),
                            child: Column(
                              children: <Widget>[
                                FieldAndLabel(
                                  isMandatory: true,
                                  margin: EdgeInsets.all(0),
                                  padding: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
                                  fieldBackgroundColor: textFieldBGcolor,
                                  fieldTextColor: textInputColor,
                                  maxLength: 50,
                                  fieldValue: fistName,
                                  fieldType: FieldType.TextField,
                                  labelTextStyle: defaultFieldLabelStyle(null, null),
                                  labelValue: "FIRST NAME".toUpperCase(),
                                  onChanged: (value, FieldAndLabelState state) {
                                    fistName = value;
                                    bloc
                                        .dispatch(EnableNextEvent(firstName: fistName, lastName: lastName, dob: dob, email: email, gender: gender, contact: contact));
                                  },
                                  validationMessage: "",
                                  placeholder: "Enter first name",
                                  axis: Axis.vertical,
                                  enabled: true,
                                ),
                                Space(
                                  vertical: 26,
                                ),
                                FieldAndLabel(
                                  isMandatory: false,
                                  margin: EdgeInsets.all(0),
                                  padding: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
                                  fieldBackgroundColor: textFieldBGcolor,
                                  fieldTextColor: textInputColor,
                                  maxLength: 50,
                                  fieldValue: "",
                                  fieldType: FieldType.TextField,
                                  labelTextStyle: defaultFieldLabelStyle(null, null),
                                  labelValue: "MIDDLE NAME".toUpperCase(),
                                  onChanged: (value, FieldAndLabelState state) {
                                    bloc
                                        .dispatch(EnableNextEvent(firstName: fistName, lastName: lastName, dob: dob, email: email, gender: gender, contact: contact));
                                  },
                                  validationMessage: "",
                                  placeholder: "Enter middle name (Optional)",
                                  axis: Axis.vertical,
                                  enabled: true,
                                ),
                                Space(
                                  vertical: 26,
                                ),
                                FieldAndLabel(
                                  isMandatory: true,
                                  margin: EdgeInsets.all(0),
                                  padding: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
                                  fieldBackgroundColor: textFieldBGcolor,
                                  fieldTextColor: textInputColor,
                                  maxLength: 50,
                                  fieldValue: lastName,
                                  fieldType: FieldType.TextField,
                                  labelTextStyle: defaultFieldLabelStyle(null, null),
                                  labelValue: "LAST NAME".toUpperCase(),
                                  onChanged: (value, FieldAndLabelState state) {
                                    lastName = value;
                                    bloc
                                        .dispatch(EnableNextEvent(firstName: fistName, lastName: lastName, dob: dob, email: email, gender: gender, contact: contact));
                                  },
                                  validationMessage: "",
                                  placeholder: "Enter last name",
                                  axis: Axis.vertical,
                                  enabled: true,
                                ),
                                Space(
                                  vertical: 26,
                                ),
                                BlocBuilder<SignupBloc, SignupState>(
                                  bloc: bloc,
                                  builder: (context, state) {
                                    if (state is EnableNextState) {
                                      dob = state.dob;
                                    }
                                    return FieldAndLabel(
                                      isMandatory: true,
                                      margin: EdgeInsets.all(0),
                                      padding: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
                                      fieldBackgroundColor: textFieldBGcolor,
                                      fieldTextColor: textInputColor,
                                      fieldType: FieldType.DatePicker,
                                      icon: Images.instance.asset(name: "ic_calendar_small"),
                                      rightIcon: Images.instance.asset(name: "ic_drop_down"),
                                      fieldValue: dob,
                                      firstDate: null,
                                      lastDate: DateTime.now(),
                                      labelTextStyle: defaultFieldLabelStyle(null, null),
                                      labelValue: "DATE OF BIRTH",
                                      onChanged: (value, FieldAndLabelState state) {
                                        dob = value;
                                        bloc
                                            .dispatch(EnableNextEvent(firstName: fistName, lastName: lastName, dob: dob, email: email, gender: gender, contact: contact));
                                      },
                                      validationMessage: "",
                                      placeholder: "Select date of birth",
                                      axis: Axis.vertical,
                                      enabled: true,
                                    );
                                  },
                                ),
                                Space(
                                  vertical: 26,
                                ),
                                BlocBuilder<SignupBloc, SignupState>(
                                  bloc: bloc,
                                  builder: (context, state) {
                                    if (state is EnableNextState) {
                                      gender = state.gender;
                                    }
                                    return FieldAndLabel(
                                      isMandatory: true,
                                      margin: EdgeInsets.all(0),
                                      padding: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
                                      fieldBackgroundColor: textFieldBGcolor,
                                      fieldValue: gender,
                                      tagsItems: ((genderList?.length ?? 0) > 0)
                                          ? genderList
                                          .map((item) => ValueDisplayPair(item?.id ?? '',
                                          item?.gender?.toLowerCase()?.capitalize() ?? ''))
                                          .toList()
                                          : null,
                                      fieldTextColor: textInputColor,
                                      fieldType: FieldType.SingleTagPicker,
                                      labelTextStyle: defaultFieldLabelStyle(null, null),
                                      labelValue: "GENDER".toUpperCase(),
                                      onChanged: (value, FieldAndLabelState state) {
                                        gender = value;
                                        bloc
                                            .dispatch(EnableNextEvent(firstName: fistName, lastName: lastName, dob: dob, email: email, gender: gender, contact: contact));
                                      },
                                      validationMessage: "",
                                      axis: Axis.vertical,
                                      enabled: true,
                                    );
                                  },
                                ),
                                Space(
                                  vertical: 26,
                                ),
                                FieldAndLabel(
                                  isMandatory: true,
                                  margin: EdgeInsets.all(0),
                                  padding: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
                                  fieldBackgroundColor: textFieldBGcolor,
                                  fieldTextColor: textInputColor,
                                  fieldType: FieldType.PhoneField,
                                  country: null,
                                  fieldValue: contact,
                                  labelTextStyle: defaultFieldLabelStyle(null, null),
                                  labelValue: "CONTACT NUMBER".toUpperCase(),
                                  maxLength: 20,
                                  onChanged: (value, FieldAndLabelState state) {
                                    if (state.currentValidationMessage.length > 0 &&
                                        value.toString().length > 0) {
                                      contact = "";
                                    } else {
                                      contact = value;
                                    }
                                    bloc
                                        .dispatch(EnableNextEvent(firstName: fistName, lastName: lastName, dob: dob, email: email, gender: gender, contact: contact));
                                  },
                                  validationMessage: "",
                                  placeholder: "e.g. +971 23 345 6789",
                                  axis: Axis.vertical,
                                  enabled: true,
                                ),
                                Space(
                                  vertical: 26,
                                ),
                                FieldAndLabel(
                                  isMandatory: false,
                                  margin: EdgeInsets.all(0),
                                  padding: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
                                  fieldBackgroundColor: textFieldBGcolor,
                                  fieldType: FieldType.TextField,
                                  labelTextStyle: defaultFieldLabelStyle(null, null),
                                  labelValue: "EMAIL ADDRESS".toUpperCase(),
                                  fieldValue: email,
                                  placeholder: "Enter email address",
                                  maxLength: 100,
                                  axis: Axis.vertical,
                                  enabled: true,
                                  onChanged: (value, FieldAndLabelState state) {
                                    if (!isEmail(value) &&
                                        value.toString().length > 0) {
                                      email = "";
                                      state.setValidationMessage(
                                          "Please enter valid email address");
                                    } else {
                                      email = value;
                                      state.setValidationMessage('');
                                    }
                                    bloc
                                        .dispatch(EnableNextEvent(firstName: fistName, lastName: lastName, dob: dob, email: email, gender: gender, contact: contact));
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Space(vertical: 24,),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
