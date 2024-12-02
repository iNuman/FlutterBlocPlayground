part of 'todo_bloc.dart';

class TodoState extends Equatable {
  final List<String> todo;

  const TodoState({this.todo = const []});

  TodoState copyWith({List<String>? todo}) {
    return TodoState(todo: todo ?? this.todo);
  }

  @override
  List<Object?> get props => [todo];
}
