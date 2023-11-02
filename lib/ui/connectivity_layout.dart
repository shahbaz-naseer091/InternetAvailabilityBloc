import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../blocs/internet_bloc/internet_bloc.dart';
import '../../../blocs/internet_bloc/internet_state.dart';

class ConnectivityLayout extends StatelessWidget {
  const ConnectivityLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: BlocConsumer<InternetBloc, InternetState>(
            listener: (context, state) {
          if (state is InternetLostState) {
            showMessage(context, "Internet Not Connected", Colors.red);
          } else if (state is InternetGainedState) {
            showMessage(context, "Connected", Colors.green);
          } else {
            showMessage(context, "Loading...", Colors.yellow);
          }
        }, builder: (context, state) {
          if (state is InternetLostState) {
            return const Text("Not Connected!");
          } else if (state is InternetGainedState) {
            return const Text("Internet Connected!");
          } else {
            return const Text("Loading...");
          }
        }),
      ),
    );
  }

  void showMessage(BuildContext context, String message, MaterialColor color) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
      backgroundColor: color,
    ));
  }
}
