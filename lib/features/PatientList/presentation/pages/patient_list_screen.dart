import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oktoast/oktoast.dart';
import 'package:scrips_core/ui_helpers/app_colors.dart';
import 'package:scrips_core/ui_helpers/text_styles.dart';
import 'package:scrips_core/widgets/general/space.dart';
import 'package:scrips_core/widgets/general/toast_widget.dart';
import 'package:scrips_ua/core/constants/app_assets.dart';
import 'package:scrips_ua/core/route/app_route_paths.dart';
import 'package:scrips_ua/di/dependency_injection.dart';
import 'package:scrips_ua/features/Signup/data/datamodel/patient_list_model.dart';
import 'package:scrips_ua/features/landing/presentation/bloc/landing/landing_bloc.dart';


class PatientListScreen extends StatefulWidget {
  const PatientListScreen({
    Key key,
    this.patientList,
  }) : super(key: key);
  final List<PatientList> patientList;

  @override
  _PatientListScreenState createState() => _PatientListScreenState();
}

class _PatientListScreenState extends State<PatientListScreen> {
  final bloc = uaSl<LandingBloc>();
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
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
            }
          },
          child: BlocBuilder<LandingBloc, LandingState>(
              bloc: bloc,
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
                        Container(width: 53,)
                      ],
                    ),
                    body: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          Space(vertical: 24,),
                          Text("Multiple Data Present", style: boldLabelTextStyle(17, textInputColor), textAlign: TextAlign.center,),
                          Space(vertical: 8,),
                          Text("Click on the patient to continue forward", style: normalLabelTextStyle(15, regularTextColor), textAlign: TextAlign.center,),
                          Space(vertical: 24,),
                        SizedBox(
                          child: ListView.builder(
                              padding: const EdgeInsets.all(8),
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: widget?.patientList?.length ?? 0,
                              itemBuilder: (BuildContext context, int index) {
                                return Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: enabledBtnTextColor,
                                      borderRadius: BorderRadius.circular(13),
                                    ),
                                    child: InkWell(
                                      onTap: (){
                                        Future.delayed(Duration(milliseconds: 100), () {
                                          Navigator.pushNamed(context, AppRoutePaths.Questionnaire, arguments: widget.patientList[index].patientId);
                                        });
                                      },
                                      child: ListTile(
                                        leading: Container(
                                          width: 40,
                                          height: 40,
                                          decoration: BoxDecoration(
                                              color: labelTextStyleTextColor,
                                              borderRadius: BorderRadius.circular(40)
                                          ),
                                        ),
                                        title: Text(widget.patientList[index].name, style: semiBoldLabelTextStyle(15, textInputColor),),
                                        subtitle: Text(widget.patientList[index].contactNumber, style: normalLabelTextStyle(12, regularTextColor),),
                                        trailing: Icon(Icons.arrow_forward_ios, color: enabledBtnBGColor,),
                                      ),
                                    ),
                                  ),
                                );
                              }
                          ),
                        ),
                          Space(vertical: 24,),
                        ],
                      ),
                    ),
                  ),
                );;
              })),
    );
  }
}
