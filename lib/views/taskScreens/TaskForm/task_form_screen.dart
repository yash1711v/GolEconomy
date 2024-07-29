import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_economy/views/taskScreens/TaskForm/task_form_cubit.dart';
import 'package:go_economy/views/taskScreens/TaskForm/task_form_state.dart';
import 'package:intl/intl.dart';

import '../../../style/pallet.dart';

class TaskFormScreen extends StatefulWidget {
  static const id = "/taskFormScreen";

  const TaskFormScreen({super.key});

  @override
  State<TaskFormScreen> createState() => _TaskFormScreenState();
}

class _TaskFormScreenState extends State<TaskFormScreen> {
  TextEditingController taskNameController = TextEditingController();
  TextEditingController taskDisController = TextEditingController();

  Future<void> _selectDate(BuildContext context, TaskFormState state) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      currentDate: state.taskDate == null || state.taskDate == ""
          ? DateTime.now()
          : DateFormat('dd/MM/yyyy').parse(state.taskDate!),
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      // Prevents selecting previous dates
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      context
          .read<TaskFormCubit>()
          .setTaskDate(DateFormat('dd/MM/yyyy').format(picked));
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TaskFormCubit, TaskFormState>(
      listener: (context, state) {
      },
      builder: (context, state) {
        taskNameController = TextEditingController(text: state.taskName);
        taskDisController = TextEditingController(text: state.taskDescription);
        return Scaffold(
          appBar: AppBar(
              title: const Text("Task Form"),
              leading: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  context.read<TaskFormCubit>().eraseAllStates();
                  Navigator.pop(context);
                },
              )),
          body: SingleChildScrollView(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
              const Padding(
                padding: EdgeInsets.only(left: 10.0, top: 15),
                child: Text("Task Name",
                    style: TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold)),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 10.0, right: 10.0, top: 8.0),
                child: TextFormField(
                  controller: taskNameController,
                  decoration: const InputDecoration(
                    hintText: "Task Name",
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                      BorderSide(color: Colors.blue, width: 2.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                      BorderSide(color: Colors.grey, width: 2.0),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide:
                      BorderSide(color: Colors.red, width: 2.0),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide:
                      BorderSide(color: Colors.red, width: 2.0),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter task name';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    context.read<TaskFormCubit>().setTaskName(value);
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0, top: 10),
                child: Row(
                  children: [
                    const Text(
                      "Set Task Priority: ",
                      style: TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    DropdownButton(
                      elevation: 16,
                      value: state.priority?.isEmpty ?? true ? null : state.priority,
                      items: const [
                        DropdownMenuItem(
                            value: "High", child: Text("High")),
                        DropdownMenuItem(
                            value: "Medium", child: Text("Medium")),
                        DropdownMenuItem(
                            value: "Low", child: Text("Low")),
                      ],
                      onChanged: (value) {
                        context
                            .read<TaskFormCubit>()
                            .setPriority(value);
                      },
                      hint: const Text("Select Priority"),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: Text("Select Date and time of task",
                    style: TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold)),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0, top: 8.0, right: 10.0),
                child: Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          _selectDate(context, state);
                        },
                        child: Container(
                          padding: const EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                            border:
                            Border.all(color: Pallet.primary),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Text(
                            state.taskDate == null || state.taskDate == ""
                                ? "Select Task Date"
                                : "Task Date: ${state.taskDate}",
                            style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 15.h,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: Text("Task Description",
                    style:
                    TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold)),
              ),
              SizedBox(
                height: 5.h,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                child: TextFormField(
                  controller: taskDisController,
                  maxLines: 10,
                  decoration: const InputDecoration(
                    hintText: "Task Description",
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                      BorderSide(color: Colors.blue, width: 2.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                      BorderSide(color: Colors.grey, width: 2.0),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide:
                      BorderSide(color: Colors.red, width: 2.0),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide:
                      BorderSide(color: Colors.red, width: 2.0),
                    ),
                  ),
                  validator: (value){
                    if(value == null || value.isEmpty){
                      return 'Please enter task description';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    context.read<TaskFormCubit>().setTaskDescription(value);
                  },
                ),
              ),
              SizedBox(
                height: 50.h,
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed:
                    (state.isFormValid ?? false) ? () {
                     debugPrint("Hello");
                      context.read<TaskFormCubit>().sendDataToDatabase(context);
                      // Navigator.pop(context);
                    } : null,
                    child: const Text("Submit"),
                  ),
                ),
              ),
            ]),
          ),
        );
      },
    );
  }
}
