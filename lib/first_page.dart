import 'package:flutter/material.dart';
import 'css_style.dart';

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('First Page')),
      body: Center(child: Text('Welcome to the First Page!')),
    );
  }
}
