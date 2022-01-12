import 'package:flutter/material.dart';

class CheckBox extends StatefulWidget {
  const CheckBox({Key? key}) : super(key: key);

  @override
  _CheckBoxState createState() => _CheckBoxState();
}

class _CheckBoxState extends State<CheckBox> {
  bool _value = false;
  @override
  Widget build(BuildContext context) {
    return  Checkbox(
        value: _value,
        onChanged: (val) {
          setState(() {
            _value = val!;
            print(_value);
          });
        });
  }
}
