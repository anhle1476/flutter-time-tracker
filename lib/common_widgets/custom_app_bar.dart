import 'package:flutter/material.dart';

class CustomAppBar extends AppBar {
  CustomAppBar({
    Key? key,
    String title = 'Time tracker',
    List<Widget>? actions,
  }) : super(
          key: key,
          title: Text(title),
          elevation: 2.0,
          centerTitle: actions == null,
          actions: actions
        );
}
