import 'package:flutter/material.dart';
import 'package:scrips_ua/core/base/screens/base_screen_view.dart';
import 'package:scrips_ua/features/Signup/data/datamodel/patient_list_model.dart';

import 'patient_list_screen.dart';

class PatientListBaseScreen extends StatefulWidget {
  const PatientListBaseScreen({
    Key key,
    this.patientList
  }) : super(key: key);
  final List<PatientList> patientList;

  @override
  _PatientListBaseScreenState createState() => _PatientListBaseScreenState();
}

class _PatientListBaseScreenState extends State<PatientListBaseScreen> {
  @override
  Widget build(BuildContext context) {
    return BaseScreenView(
      mobileBodyPortrait: PatientListScreen(patientList: widget.patientList,),
      desktopBodyLandscape: Container(child: Center(child: Text("Not Supported")),),
    );
  }
}
