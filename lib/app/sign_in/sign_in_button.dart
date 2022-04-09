import 'package:flutter/material.dart';
import 'package:time_tracker_flutter_course/common_widgets/custom_raised_button.dart';

class SignInButton extends CustomRaisedButton {
  SignInButton({
    Key? key,
    required final String text,
    required VoidCallback onPressed,
    Color backgroundColor = Colors.white,
    Color textColor = Colors.black87,
  }) : super(
          key: key,
          child: Text(
            text,
            style: TextStyle(color: textColor, fontSize: 15),
          ),
          onPressed: onPressed,
          backgroundColor: backgroundColor,
          borderRadius: 2.0,
          height: 40,
        );
}
