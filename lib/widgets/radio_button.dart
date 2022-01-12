import 'package:cupertino_radio_choice/cupertino_radio_choice.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RadioButton extends StatefulWidget {
  @override
  _RadioButtonState createState() => new _RadioButtonState();
}

class _RadioButtonState extends State<RadioButton> {
  static final Map<String, String> genderMap = {
    'male': 'Male',
    'female': 'Female',
    'other': 'Other',

  };

  String _selectedGender = genderMap.keys.first;

  @override
  Widget build(BuildContext context) {
    final genderSelectionTile = Material(
      color: Colors.white,
      child: Expanded(
        child: CupertinoRadioChoice(
            choices: genderMap,
            onChange: onGenderSelected,
            initialKeyValue: _selectedGender),
      ),
    );

    return Scaffold(
      body: Center(child: genderSelectionTile),
    );
  }

  void onGenderSelected(String genderKey) {
    setState(() {
      _selectedGender = genderKey;
    });
  }
}
