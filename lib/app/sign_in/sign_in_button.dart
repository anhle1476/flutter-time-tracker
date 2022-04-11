import 'package:flutter/material.dart';
import 'package:time_tracker_flutter_course/common_widgets/custom_raised_button.dart';

class SignInButton extends CustomRaisedButton {
  SignInButton(
      {Key? key,
      required final String text,
      required VoidCallback onPressed,
      Color backgroundColor = Colors.white,
      Color textColor = Colors.black87,
      String? image})
      : assert (text != ''),
        super(
          key: key,
          child: _buildChildContent(
              text: text, textColor: textColor, image: image),
          onPressed: onPressed,
          backgroundColor: backgroundColor,
          borderRadius: 2.0,
          height: 40,
        );

  static Widget _buildChildContent(
      {String text = '', Color? textColor, String? image}) {
    if (image == null || image == '') {
      return Text(
        text,
        style: TextStyle(
          color: textColor,
          fontSize: 15.0
        ),
      );
    } else {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Image.asset(image),
          Text(
            text,
            style: TextStyle(
                color: textColor,
                fontSize: 15.0
            ),
          ),
          Opacity(
            opacity: 0.0,
            child: Image.asset(image),
          ),
        ],
      );
    }
  }
}
