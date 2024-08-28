import 'package:flutter/material.dart';

class Sidewindow extends StatefulWidget {
  const Sidewindow({super.key});

  @override
  State<Sidewindow> createState() => _SidewindowState();
}

class _SidewindowState extends State<Sidewindow> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A0A0A),
      body: Padding(
        padding: const EdgeInsets.only(top: 100, left: 20),
        child: Column(
          children: [
            ClipOval(
              child: Image.asset(
                "assets/image/myphoto.jpeg",
                width: 70.0, // You can adjust the width and height
                height: 70.0,
                fit: BoxFit.cover, // This will ensure the image covers the circular area
              ),
            ),
          ],
        ),
      ),
    );
  }
}
