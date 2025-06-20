import 'package:flutter/material.dart';

class RootLayout extends StatelessWidget {
  const RootLayout({
    super.key,
    required this.child,
    this.title = "ECG Analysis  ",
    this.showAppBar = true,
  });

  final Widget child;
  final String title;
  final bool showAppBar;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: showAppBar
          ? AppBar(
              backgroundColor: Theme.of(context).colorScheme.inversePrimary,
              title: Text("ECG Analysis"),
            )
          : null,
      body: child,
    );
  }
}
