import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../blocs/internet_bloc/internet_bloc.dart';
import 'connectivity_layout.dart';

class Connectivity extends StatelessWidget {
  const Connectivity({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => InternetBloc(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: ConnectivityLayout(),
        ),
      ),
    );
  }
}
