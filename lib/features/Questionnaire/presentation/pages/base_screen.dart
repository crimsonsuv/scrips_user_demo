import 'package:flutter/material.dart';
import 'package:scrips_core/base/screens/base_screen_view.dart';
import 'questionnaire_screen.dart';

class QuestionnaireBaseScreen extends StatefulWidget {
  const QuestionnaireBaseScreen({Key key, this.patientId}) : super(key: key);
  final String patientId;

  @override
  _QuestionnaireBaseScreenState createState() =>
      _QuestionnaireBaseScreenState();
}

class _QuestionnaireBaseScreenState extends State<QuestionnaireBaseScreen> {
  @override
  Widget build(BuildContext context) {
    return BaseScreenView(
      mobileBodyPortrait: QuestionnaireScreen(
        patientId: widget.patientId,
      ),
      desktopBodyLandscape: Container(
        child: Center(child: Text("Not Supported")),
      ),
    );
  }
}
