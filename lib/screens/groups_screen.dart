import 'package:flutter/material.dart';

class GroupScreen extends StatelessWidget {
  const GroupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Group Screen',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
