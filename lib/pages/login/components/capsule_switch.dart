import 'package:flutter/material.dart';

class CapsuleSwitch extends StatefulWidget {
  final ValueChanged<bool>? onChanged;

  CapsuleSwitch({this.onChanged});

  @override
  _CapsuleSwitchState createState() => _CapsuleSwitchState();
}

class _CapsuleSwitchState extends State<CapsuleSwitch> {
  bool _isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return Switch(
      value: _isSwitched,
      onChanged: (bool value) {
        setState(() {
          _isSwitched = value;
        });
        if (widget.onChanged != null) {
          widget.onChanged!(value);
        }
      },
      activeColor: Colors.white,
      inactiveThumbColor: Colors.white,
      inactiveTrackColor: Colors.white24,
    );
  }
}
