import 'package:flutter/material.dart';

class DataViewScreen extends StatelessWidget {
  const DataViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.amberAccent,
      body: Center(
        child: CircleAvatar(radius: 40,backgroundColor: Colors.deepPurpleAccent),
      ),
    );
  }
}