import 'package:flutter/material.dart';

final class LoadingView extends StatelessWidget {
  final double size;
  final double strokeWidth;
  final Color strokeColor;

  const LoadingView({
    super.key,
    this.size = 20,
    this.strokeWidth = 2,
    this.strokeColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: size,
        width: size,
        child: CircularProgressIndicator(
          strokeWidth: strokeWidth,
          color: strokeColor,
        ),
      ),
    );
  }
}
