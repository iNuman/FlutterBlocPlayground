import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final List<String> todoList = [];
  TodoBloc() : super(const TodoState()) {
    on<AddToDoEvent>(_addTodo);
    on<RemoveToDoEvent>(_removeTodo);
  }
  void _addTodo(AddToDoEvent event , Emitter<TodoState> emit) {
    todoList.add(event.task);
    emit(state.copyWith(todo: List.from(todoList)));
  }

  void _removeTodo(RemoveToDoEvent event , Emitter<TodoState> emit) {
    todoList.remove(event.removeTask);
    emit(state.copyWith(todo:  List.from(todoList)));
  }
}
