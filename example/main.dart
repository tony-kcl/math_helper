import 'package:flutter/material.dart';
import 'package:math_helper/math_helper.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: GestureDetector(
            onTap: () {
              final line = MathHelper.getLineEquation(Offset(0, 0), Offset(5, 5));
              debugPrint(line.toString());
            },
            child: Text(
              'Calculate A line with Offset(0,0) and Offset(5,5)'
            ),
          ),
        ),
      ),
    );
  }
}