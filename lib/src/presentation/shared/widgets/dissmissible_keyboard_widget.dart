import 'package:flutter/material.dart';

class DismissibleKeyboardWidget extends StatelessWidget {
  final Widget child;

  const DismissibleKeyboardWidget({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      onPanUpdate: (data) => FocusManager.instance.primaryFocus?.unfocus(),
      child: child,
    );
  }
}