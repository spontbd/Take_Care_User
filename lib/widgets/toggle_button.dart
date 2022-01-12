import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:takecare_user/pages/account_info_page.dart';
import 'package:takecare_user/pages/sign_in_page.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'AnimatedToggleButton.dart';


class ToggleButtonSTF extends StatefulWidget {


  const ToggleButtonSTF({Key? key, required this.value,  required this.lableValue}) : super(key: key);

  final double value;
  final List<String> lableValue;

  @override
  _ToggleButtonSTFState createState() => _ToggleButtonSTFState();
}

class _ToggleButtonSTFState extends State<ToggleButtonSTF> {
  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.only(right: 30.0,top: 10),
      child: ToggleSwitch(
        minWidth: widget.value,
        inactiveBgColor: Colors.grey,
        cornerRadius: 10,
        initialLabelIndex: 0,
        totalSwitches: widget.lableValue.length,
        labels: widget.lableValue,
        onToggle: (index) {
          print('switched to: $index');

          if(index == 0)
          {
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (_) => SignInPage()));
          }
          else if(index == 1){
            Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => AccountInfoPage()));
          }

        },
      ),
    );
  }
}




class ToggleButton extends StatefulWidget {
  const ToggleButton({Key? key}) : super(key: key);

  @override
  _ToggleButtonState createState() => _ToggleButtonState();
}

class _ToggleButtonState extends State<ToggleButton> {
  List<bool> _isSelected = [true, false];

  @override
  Widget build(BuildContext context) {
    return ToggleButtons(
      selectedColor: Colors.white,
      children: <Widget>[

        Container(width: (MediaQuery.of(context).size.width - 36)/3, child: new Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[new Icon(Icons.whatshot,size: 16.0,color: Colors.red,),new SizedBox(width: 4.0,), new Text("HOT",style: TextStyle(color: Colors.red),)],)),
        Container(width: (MediaQuery.of(context).size.width - 36)/3, child: new Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[new Icon(Icons.invert_colors,size: 16.0,color: Colors.yellow[800],),new SizedBox(width: 4.0,), new Text("WARM",style: TextStyle(color: Colors.yellow[800]))],)),

/*        Text("English",style: ,),
        Text("Bangla",*//*style: TextStyle(color: Colors.white),*//* )*/
      ],
      isSelected: _isSelected,
      onPressed: (int index) {
        setState(() {
          _isSelected[index] = !_isSelected[index];
        });
      },
    );
  }
}

class AnimationButton extends StatefulWidget {
  const AnimationButton({Key? key}) : super(key: key);

  @override
  _AnimationButtonState createState() => _AnimationButtonState();
}

class _AnimationButtonState extends State<AnimationButton> {
  int _toggleValue = 0;
  @override
  Widget build(BuildContext context) {
    return AnimatedToggle(
      values: ['English', 'Bangla'],
      onToggleCallback: (value) {
        setState(() {
          _toggleValue = value;
        });
      },
      buttonColor: const Color(0xFF0A3157),
      backgroundColor: const Color(0xFFB5C1CC),
      textColor: const Color(0xFFFFFFFF),
    );
  }
}



