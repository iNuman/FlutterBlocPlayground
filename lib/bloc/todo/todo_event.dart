part of 'todo_bloc.dart';

abstract class TodoEvent extends Equatable {
  const TodoEvent();
}

class AddToDoEvent extends TodoEvent{
  final String task;
  const AddToDoEvent({required this.task});

  @override
  List<Object?> get props => [task];
}

class RemoveToDoEvent extends TodoEvent{
  final Object removeTask;
  const RemoveToDoEvent({required this.removeTask});

  @override
  List<Object?> get props => [removeTask];
}
