import 'package:flutter/material.dart';

final class NoticeView extends StatelessWidget {
  final String notice;

  const NoticeView({super.key, required this.notice});

  @override
  Widget build(BuildContext context) {
    return Padding(padding: const EdgeInsets.all(16.0), child: Text(notice));
  }
}
