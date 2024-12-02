import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_block/bloc/counter/counter_event.dart';
import 'package:flutter_block/bloc/counter/counter_state.dart';
import 'package:flutter_block/bloc/counter/counterk_bloc.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(
        "Counter Block",
        style: TextStyle(fontSize: 24),
      )
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          BlocBuilder<CounterBloc, CounterState>(builder: (context, state) {
            return Center(
              child: Text(
                state.counter.toString(),
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 60),
              ),
            );
          }),
          const SizedBox(
            height: 24,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(onPressed: () {
                context.read<CounterBloc>().add(IncrementCounter());
              }, child: const Text("Increment")),
              const SizedBox(
                width: 20,
              ),
              ElevatedButton(onPressed: () { 
                context.read<CounterBloc>().add(DecrementCounter());
              }, child: const Text("Decrement"))
            ],
          )
        ],
      ),
    );
  }
}
