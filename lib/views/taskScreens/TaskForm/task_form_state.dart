import 'package:equatable/equatable.dart';

import '../../../models/task/task.dart';

class TaskFormState extends Equatable {
  final String? priority;
  final String? taskName;
  final String? taskDescription;
  final String? taskDate;
  final String? taskTime;
  final bool? isFormValid;
  final Task? task;
  String initalValue = "Select Priority";
   TaskFormState(
      {this.priority,
      this.taskName,
      this.taskDescription,
      this.taskDate,
      this.taskTime,
      this.isFormValid,
      this.initalValue = "Select Priority",
      this.task});

  TaskFormState copyWith(
      {String? priority,
      String? taskName,
      String? taskDescription,
      String? taskDate,
      String? taskTime,
      bool? isFormValid,
      String? initalValue,
      Task? task}) {
    return TaskFormState(
        priority: priority ?? this.priority,
        taskName: taskName ?? this.taskName,
        taskDescription: taskDescription ?? this.taskDescription,
        taskDate: taskDate ?? this.taskDate,
        taskTime: taskTime ?? this.taskTime,
        isFormValid: isFormValid ?? this.isFormValid,
        initalValue: initalValue ?? this.initalValue,
        task: task ?? this.task);
  }

  @override
  List<Object?> get props {
    return [
      priority,
      taskName,
      taskDescription,
      taskDate,
      taskTime,
      isFormValid,
      initalValue,
      task
    ];
  }
}
