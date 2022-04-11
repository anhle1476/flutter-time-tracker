import 'package:flutter/material.dart';

class CircularProgressScaffold extends Scaffold {
  const CircularProgressScaffold({Key? key})
      : super(
          key: key,
          body: const Center(
            child: CircularProgressIndicator(),
          ),
        );
}
