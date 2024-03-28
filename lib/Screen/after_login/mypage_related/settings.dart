import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  Settings(this.test, {super.key});

  String test;

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: Text(widget.test),
    );
  }
}
