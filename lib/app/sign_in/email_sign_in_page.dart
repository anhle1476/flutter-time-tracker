import 'package:flutter/material.dart';
import 'package:time_tracker_flutter_course/common_widgets/custom_app_bar.dart';

class EmailSignInPage extends StatelessWidget {
  const EmailSignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: CustomAppBar(title: 'Sign in'),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          child: _buildContent(),
        ),
      ),
    );
  }

  Widget _buildContent() {
    return Container();
  }
}
