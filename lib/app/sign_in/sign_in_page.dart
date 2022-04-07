import 'package:flutter/material.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: const Text("Time Tracker"),
        centerTitle: true,
        elevation: 2.00,
      ),
      body: _buildContent(),
    );
  }

  Widget _buildContent() {
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
          const SizedBox(height: 8.0),
          _buildSignInBtn('Ola'),
          const SizedBox(height: 8.0),
          _buildSignInBtn('Muchacho'),
        ],
      ),
    );
  }

  Widget _buildSignInBtn(String text, {Color bgColor = Colors.white}) {
    return ElevatedButton(
      child: Text(text, style: const TextStyle(color: Colors.black87)),
      onPressed: () => {},
      style: ButtonStyle(
        backgroundColor: MaterialStateColor.resolveWith((states) => bgColor),
        shape: MaterialStateProperty.all(
          const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(4.0),
            ),
          ),
        ),
      ),
    );
  }
}
