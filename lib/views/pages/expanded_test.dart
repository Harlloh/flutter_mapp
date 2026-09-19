import 'package:flutter/material.dart';

class ExpandedTestPage extends StatelessWidget {
  const ExpandedTestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Row(
        children: [
          Expanded(child: Container(color: Colors.teal)),
          Expanded(child: Container(color: Colors.orange)),
        ],
      ),
    );
  }
}
