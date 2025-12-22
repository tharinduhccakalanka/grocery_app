import 'package:flutter/material.dart';

class Trail extends StatefulWidget {
  const Trail({super.key});

  @override
  State<Trail> createState() => _TrailState();
}

class _TrailState extends State<Trail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "Trail Page Screen",
          style: TextStyle(fontSize: 40),
        ),
      ),
    );
  }
}