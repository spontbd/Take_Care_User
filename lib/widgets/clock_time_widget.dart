import 'dart:async';

import 'package:flutter/material.dart';
import 'package:takecare_user/public_variables/all_colors.dart';
import 'package:takecare_user/public_variables/size_config.dart';
class ClockTimeWidget extends StatefulWidget {
  final Function callback;
  const ClockTimeWidget({Key? key,required this.callback}) : super(key: key);

  @override
  State<ClockTimeWidget> createState() => _ClockTimeWidgetState();
}

class _ClockTimeWidgetState extends State<ClockTimeWidget> {




  late Timer _timer;
  int _start = 0;
  int _min = 0;
  int _hour = 0;

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    startTimer();
  }


  void startTimer() {
    _timer = Timer.periodic(const Duration(milliseconds: 1000), (timer) => _update());
  }

  _update() {
    if (_start == 60) {
      setState(() {
        _start = 0;
        _min++;
        if (_min == 60){
          _min = 0;
          _hour++;
        }

          // _timer.cancel();
        // widget.callback();
      });
    } else {
      setState(() {
        _start++;
      });
    }
    widget.callback("$_hour Hour $_min Min");
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child:  Padding(
        padding: const EdgeInsets.only(left: 30.0, top: 20),
        child: Row(mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('$_hour',style: TextStyle(color: AllColor.pink_button,
                    fontSize: dynamicSize(.07))),
                Text('Hour',style: TextStyle(color: AllColor.black,
                    fontSize: dynamicSize(.035)))
              ],
            ),
            Text(' : ',style: TextStyle(color: AllColor.pink_button,
                fontWeight: FontWeight.bold,
                fontSize: dynamicSize(.07))),

            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('$_min',style: TextStyle(color: AllColor.pink_button,
                    fontSize: dynamicSize(.07))),
                Text('Min',style: TextStyle(color: AllColor.black,
                    fontSize: dynamicSize(.035)))
              ],
            ),
            Text(' : ',style: TextStyle(color: AllColor.pink_button,
                fontWeight: FontWeight.bold,
                fontSize: dynamicSize(.07))),

            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('${_start}',style: TextStyle(color: AllColor.pink_button,
                    fontSize: dynamicSize(.07))),
                Text('Sec',style: TextStyle(color: AllColor.black,
                    fontSize: dynamicSize(.035)))
              ],
            )
          ],
        ),
      ),
    );
  }

}

