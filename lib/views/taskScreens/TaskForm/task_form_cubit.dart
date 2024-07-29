import 'package:bloc/bloc.dart';
import 'package:go_economy/models/task/task.dart';
import 'package:go_economy/views/taskScreens/TaskForm/task_form_state.dart';
import 'package:intl/intl.dart';

import '../../../routes/routes_helper.dart';
import '../../../services/db_service.dart';

class TaskFormCubit extends Cubit<TaskFormState> {
  TaskFormCubit() : super(TaskFormState());

  DBService dbService = DBService();

  void setPriority(String? value) {
    emit(state.copyWith(priority: value));
    validateForm();
  }

  void validateForm() {
    debugPrint("validateForm");
    final isFormValid = state.taskName != null &&
        state.taskName!.isNotEmpty &&
        state.priority != null &&
        state.priority!.isNotEmpty &&
        state.taskDate != null &&
        state.taskDate!.isNotEmpty &&
        state.taskDescription != null &&
        state.taskDescription!.isNotEmpty;
    emit(state.copyWith(isFormValid: isFormValid));
  }

  void setTaskName(String? value) {
    emit(state.copyWith(taskName: value));
    validateForm();
  }

  void setTaskDescription(String? value) {
    emit(state.copyWith(taskDescription: value));
    validateForm();
  }

  void setTaskDate(String? value) {
    emit(state.copyWith(taskDate: value));
    validateForm();
  }

  void setTaskTime(String? value) {
    emit(state.copyWith(taskTime: value));
    validateForm();
  }

  void sendDataToDatabase(BuildContext context) {
    debugPrint("sendDataToDatabase");
    dbService
        .insertTask(Task(
      title: state.taskName!,
      description: state.taskDescription!,
      dueDate: convertDateString(state.taskDate!),
      priority: state.priority!,
      isCompleted: false,
    ))
        .then((value) {
      eraseAllStates();
      dbService.fetchTasks().then((tasks) {
        debugPrint("tasks  coming from the local database: $tasks");
        Navigator.of(context).pushReplacementNamed(TaskListScreen.id);
        // Repo().postTask(tasks).then((value){
        //   Repo().getAllProducts().then((value){
        //      debugPrint("tasks  coming from api: $tasks");
        //   });
        //  });
      });
    });
  }

  updatingTask(Task task) {
    emit(state.copyWith(
        priority: task.priority,
        taskName: task.title,
        taskDescription: task.description,
        taskDate: task.dueDate.toString(),
        taskTime: "",
        isFormValid: true));
  }

  DateTime convertDateString(String dateString) {
    final inputFormat = DateFormat('dd/MM/yyyy');
    final outputFormat = DateFormat('yyyy/MM/dd');

    final dateTime = inputFormat.parse(dateString);

    final formattedDate = outputFormat.format(dateTime);

    return DateTime.parse(formattedDate.replaceAll(
        '/', '-')); // DateTime.parse() uses '-' as separator
  }

  void eraseAllStates() {
    debugPrint("eraseAllStates");
    emit(state.copyWith(
        initalValue: "",
        priority: "",
        taskName: "",
        taskDescription: "",
        taskDate: "",
        taskTime: "",
        isFormValid: false));
  }
}
