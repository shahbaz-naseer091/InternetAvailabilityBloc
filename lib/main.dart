import 'package:bloc_imp/ui/connectivity.dart';
import 'package:bloc_imp/utils/extensions.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(HomeScreen());
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.redAccent, // Change the primary color
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.redAccent,
          title: const Text(
            "Learning Bloc",
            style: TextStyle(fontSize: 14),
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RoundButton(
                  text: "Internet connectivity bloc",
                  nextWidget: const Connectivity()),
              RoundButton(
                text: "Api implementation with bloc",
                nextWidget: const Connectivity(),
              )
            ],
          ),
        ),
      ),
    );
  }

  void handleButtonPress() {
    print('Button pressed from parent widget');
  }
}

class RoundButton extends StatelessWidget {
  final String? text;
  final Widget? nextWidget;

  RoundButton({required this.text, required this.nextWidget, super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10))),
        onPressed: () {
          context.pushToNextScreen(nextWidget!);
        },
        child: Text(text ?? ""),
      ),
    );
  }
}
