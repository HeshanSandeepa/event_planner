import 'package:flutter/material.dart';

final class ISpacer extends StatelessWidget {
  final double height;
  const ISpacer({super.key, hei, this.height = 32});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
    );
  }
}
