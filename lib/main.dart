import 'package:flutter/material.dart';
import 'package:flutter_block/bloc/counter/counterk_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_block/bloc/image_picker/image_picker_bloc.dart';
import 'package:flutter_block/bloc/switch_block/switch_block.dart';
import 'package:flutter_block/presentation/image_picker/image_picker_screen.dart';

import 'core/utils/image_picker_utils.dart';

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
        BlocProvider(
          create: (context) => ImagePickerBloc(ImagePickerUtils()),
        ),
      ],
      child: MaterialApp(
          title: 'Bloc Example',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: const ImagePickerScreen()
          // home: const SwitchWidget()
          // home: const CounterScreen()
          ),
    );
  }
}
