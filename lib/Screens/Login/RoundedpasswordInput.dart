import 'package:flutter/material.dart';

import 'TextFieldContainer.dart';

class RounderpasswordTextField extends StatefulWidget {
  final String hint;
  final IconData icon;
  final Color color;
  final TextEditingController controller;
  final ValueChanged<String> onChanged;
  const RounderpasswordTextField(
      {Key key,
      this.hint,
      this.icon,
      this.controller,
      this.onChanged,
      this.color})
      : super(key: key);

  @override
  _RounderpasswordTextFieldState createState() =>
      _RounderpasswordTextFieldState();
}

class _RounderpasswordTextFieldState extends State<RounderpasswordTextField> {
  bool _passwordVisible = false;
  @override
  void initState() {
    _passwordVisible = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextFieldCOntainer(
      child: TextFormField(
        onChanged: widget.onChanged,
        keyboardType: TextInputType.text,
        obscureText: !_passwordVisible,
        controller: widget.controller,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: widget.hint,
            hintStyle: TextStyle(
             fontSize: 10
           ),
          icon: Icon(
            widget.icon,
          ),
          suffixIcon: IconButton(
            icon: Icon(
              _passwordVisible ? Icons.visibility : Icons.visibility_off,
            ),
            onPressed: () {
              setState(() {
                _passwordVisible = !_passwordVisible;
              });
            },
          ),
        ),
      ),
    );
  }
}
