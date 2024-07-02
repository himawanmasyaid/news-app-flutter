import 'package:flutter/material.dart';
import 'package:news_app_flutter/data/constants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const routeName = '/home';

  @override
  State<HomeScreen> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Image.asset('${Asset.image}news_api_logo.png',
            width: 70, height: 60),
        elevation: 1.0,
        backgroundColor: Colors.black,
      ),
      body: const Center(
        child: Text('Hello, World!'),
      ),
    );
  }
}
