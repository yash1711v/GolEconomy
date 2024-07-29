part of 'task_list_cubit.dart';

sealed class TaskListState extends Equatable {
  const TaskListState();

  List<Task> get tasks => [];
}

final class TaskList extends TaskListState {
  final List<Task> tasks;
  TaskList({required this.tasks});

  TaskListState copyWith({List<Task>? tasks}) {
    return TaskList(tasks: tasks ?? this.tasks);
  }



  @override
  List<Object> get props => [
    tasks,
  ];
}
