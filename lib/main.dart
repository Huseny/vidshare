import 'package:flutter/material.dart';
import 'package:vid_share/presentation/screens/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "VidShare",
      home: LoginPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
