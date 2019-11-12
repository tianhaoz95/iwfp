import 'package:flutter/material.dart';

typedef setIsDevValFuncType = void Function(bool);

class DevelopmentModeToggle extends StatefulWidget {
  final bool initIsDevVal;
  final setIsDevValFuncType setIsDevCallbackFunc;
  const DevelopmentModeToggle(this.initIsDevVal, this.setIsDevCallbackFunc);
  @override
  _DevelopmentModeToggle createState() {
    return _DevelopmentModeToggle();
  }
}

class _DevelopmentModeToggle extends State<DevelopmentModeToggle> {
  bool isDevVal = false;
  @override
  void initState() {
    super.initState();
    isDevVal = widget.initIsDevVal;
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 0.0),
      child: Row(
        children: <Widget>[
          Text('Development Mode', style: TextStyle(color: Colors.white)),
          Switch(
            value: isDevVal,
            activeColor: Colors.orange[100],
            onChanged: (bool nextIsDevVal) {
              isDevVal = nextIsDevVal;
              widget.setIsDevCallbackFunc(nextIsDevVal);
            },
          ),
        ],
      ),
    );
  }
}