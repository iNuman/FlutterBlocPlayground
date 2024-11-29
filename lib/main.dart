import 'package:flutter/material.dart';
import 'package:flutter_block/block/counter/counterk_bloc.dart';
import 'package:flutter_block/presentation/counter_screen/counter_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterBloc(),
      child: MaterialApp(
          title: 'Bloc Example',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: const CounterScreen()
      ),
    );
  }
}
