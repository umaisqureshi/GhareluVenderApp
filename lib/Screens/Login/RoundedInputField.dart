import 'dart:ui';

import 'package:flutter/material.dart';

import 'TextFieldContainer.dart';

class RounderTextField extends StatelessWidget {
  final String hint;
  final IconData icon;
  final Function onchanged;
  const RounderTextField({Key key, this.hint, this.icon, this.onchanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldCOntainer(
        child: TextFormField(
      onChanged: onchanged,
      decoration: InputDecoration(
          hintText: hint,
          border: InputBorder.none,
          icon: Icon(
            icon,
          ),
          hintStyle: TextStyle(fontSize: 10)),
    ));
  }
}
