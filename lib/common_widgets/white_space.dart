import 'package:flutter/material.dart';

enum WhiteSpaceSize { small, medium, large, extraLarge }

class WhiteSpaceSizeResolver {
  static double resolveSize(WhiteSpaceSize size) {
    switch (size) {
      case WhiteSpaceSize.small:
        return 8.0;
      case WhiteSpaceSize.medium:
        return 16.0;
      case WhiteSpaceSize.large:
        return 24.0;
      case WhiteSpaceSize.extraLarge:
        return 48.0;
    }
  }
}

class VerticalWhiteSpace extends StatelessWidget {
  const VerticalWhiteSpace({
    Key? key,
    this.size = WhiteSpaceSize.small,
  }) : super(key: key);

  final WhiteSpaceSize size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: WhiteSpaceSizeResolver.resolveSize(size));
  }
}

class HorizontalWhiteSpace extends StatelessWidget {
  const HorizontalWhiteSpace({
    Key? key,
    this.size = WhiteSpaceSize.small,
  }) : super(key: key);

  final WhiteSpaceSize size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: WhiteSpaceSizeResolver.resolveSize(size));
  }
}
