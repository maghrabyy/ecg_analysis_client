import 'package:ecg_analysis2/Layout/root-layout.dart';
import 'package:ecg_analysis2/Widgets/mat-file-uploader.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  static const String path = "/";
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return RootLayout(
      showAppBar: false,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[MatFileUploader()],
        ),
      ),
    );
  }
}
