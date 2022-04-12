import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:time_tracker_flutter_course/app/sign_in/email_sign_in_page.dart';
import 'package:time_tracker_flutter_course/app/sign_in/sign_in_button.dart';
import 'package:time_tracker_flutter_course/common_widgets/custom_app_bar.dart';
import 'package:time_tracker_flutter_course/common_widgets/white_space.dart';
import 'package:time_tracker_flutter_course/services/auth.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({
    Key? key,
    required this.auth,
  }) : super(key: key);

  final AuthBase auth;

  Future<void> _signInAnonymously() async {
    try {
      await auth.signInAnonymously();
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }

  Future<void> _signInWithGoogle() async {
    try {
      await auth.signInWithGoogle();
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }

  Future<void> _signInWithFacebook() async {
    try {
      await auth.signInWithFacebook();
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }

  void _signInWithEmail(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
      fullscreenDialog: true,
      builder: (context) => const EmailSignInPage(),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: CustomAppBar(),
      body: _buildContent(context),
    );
  }

  Widget _buildContent(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text(
            'Sign in',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 32.0, fontWeight: FontWeight.w600),
          ),
          const VerticalWhiteSpace(size: WhiteSpaceSize.extraLarge),
          SignInButton(
            text: 'Sign in with Google',
            onPressed: _signInWithGoogle,
            image: 'images/google-logo.png',
          ),
          const VerticalWhiteSpace(),
          SignInButton(
            text: 'Sign in with Facebook',
            textColor: Colors.white,
            backgroundColor: const Color(0xFF334D92),
            onPressed: _signInWithFacebook,
            image: 'images/facebook-logo.png',
          ),
          const VerticalWhiteSpace(),
          SignInButton(
            text: 'Sign in with email',
            textColor: Colors.white,
            backgroundColor: Colors.teal[700] ?? Colors.teal,
            onPressed: () => _signInWithEmail(context),
          ),
          const VerticalWhiteSpace(),
          const Text(
            'or',
            style: TextStyle(fontSize: 14.0, color: Colors.black87),
            textAlign: TextAlign.center,
          ),
          const VerticalWhiteSpace(),
          SignInButton(
            text: 'Go anonymous',
            textColor: Colors.black87,
            backgroundColor: Colors.lime[300] ?? Colors.lime,
            onPressed: _signInAnonymously,
          ),
        ],
      ),
    );
  }
}
