import 'package:flutter/material.dart';

class NotLoginTemplate extends StatelessWidget {
  const NotLoginTemplate(
      {required this.appTitle, required this.child, super.key});

  final Widget child;
  final String appTitle;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(appTitle)),
      body: SafeArea(child: child),
    );
  }
}
