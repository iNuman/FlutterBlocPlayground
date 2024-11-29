import 'package:flutter/material.dart';
import 'package:flutter_block/block/counter/counterk_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_block/block/switch_block/switch_block.dart';
import 'package:flutter_block/presentation/switch_button/switch_button.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CounterBloc(),
        ),
        BlocProvider(
          create: (context) => SwitchBloc(),
        ),
      ],
      child: MaterialApp(
          title: 'Bloc Example',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: const SwitchWidget()
        // home: const CounterScreen()
      ),
    );
  }
}
