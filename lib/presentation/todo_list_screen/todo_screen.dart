import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_block/bloc/todo/todo_bloc.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Todo List")),
      body: BlocBuilder<TodoBloc, TodoState>(
        builder: (context, state) {
          if (state.todo.isEmpty) {
            return const Center(
              child: Text("No Data found"),
            );
          } else if (state.todo.isNotEmpty) {
            return ListView.builder(
              itemCount: state.todo.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(state.todo[index]),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () {
                      BlocProvider.of<TodoBloc>(context)
                          .add(RemoveToDoEvent(removeTask: state.todo[index]));
                    },
                  ),
                );
              },
            );
          } else {
            return const Center(
              child: Text('Unknown state.'),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          BlocProvider.of<TodoBloc>(context)
              .add(const AddToDoEvent(task: "task 1"));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
