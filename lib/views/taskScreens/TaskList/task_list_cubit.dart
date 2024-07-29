import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:go_economy/services/db_service.dart';

import '../../../models/task/task.dart';

part 'task_list_state.dart';

class TaskListCubit extends Cubit<TaskListState> {
  TaskListCubit() : super(TaskList(tasks: []));
  DBService dbService = DBService();
  getTasks() {
    dbService.fetchTasks().then((tasks) {
      emit(TaskList(tasks: tasks));
    });
  }

  updateTask(Task task) {
    dbService.updateTask(task).then((_) {
      getTasks();
    });
  }

  deleteTask(Task task) {
    dbService.deleteTask(task.id!).then((_) {
      getTasks();
    });
  }

}
