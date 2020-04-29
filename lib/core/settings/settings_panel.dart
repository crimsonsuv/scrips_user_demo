import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:scrips_core/widgets/general/field_and_label.dart';

class SettingsPanel extends StatelessWidget {
  final String suffix;

  //
  SettingsPanel({Key key, this.suffix}) : super(key: key);

  //
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        FieldAndLabel(
          labelValue: 'Label Settings-1',
          fieldValue: 'Contained Text Settings-1',
          axis: Axis.horizontal,
          enabled: true,
        ),
        FieldAndLabel(
          labelValue: 'Label Settings-2',
          fieldValue: 'Contained Text Settings-2',
          axis: Axis.horizontal,
          enabled: true,
        ),
        FieldAndLabel(
          labelValue: 'Label Settings-3',
          fieldValue: 'Contained Text Settings-3',
          axis: Axis.horizontal,
          enabled: true,
        ),
      ],
    );
  }
}

class SettingsPanel2 extends StatelessWidget {
  final String suffix;

  //
  SettingsPanel2({Key key, this.suffix}) : super(key: key);

  //
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        FieldAndLabel(
          labelValue: 'Label Settings-2-1',
          fieldValue: 'Contained Text Settings-2-1',
          axis: Axis.horizontal,
          enabled: true,
        ),
        FieldAndLabel(
          labelValue: 'Label Settings-2-2',
          fieldValue: 'Contained Text Settings-2-2',
          axis: Axis.horizontal,
          enabled: true,
        ),
        FieldAndLabel(
          labelValue: 'Label Settings-2-3',
          fieldValue: 'Contained Text Settings-2-3',
          axis: Axis.horizontal,
          enabled: true,
        ),
      ],
    );
  }
}
