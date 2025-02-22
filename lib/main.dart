import 'package:flutter/material.dart';
import '/pages/HomePage.dart';
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const CloudFileManagerUI());
}

class CloudFileManagerUI extends StatelessWidget {
  const CloudFileManagerUI({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: true,
      title: "Cloud files",
      home: HomePage(),
    );
  }
}