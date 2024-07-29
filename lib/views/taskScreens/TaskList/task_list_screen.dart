import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_economy/helper/bot_toast.dart';
import 'package:go_economy/routes/routes_helper.dart';
import 'package:go_economy/style/pallet.dart';
import 'package:go_economy/style/styles.dart';
import 'package:go_economy/views/taskScreens/TaskForm/task_form_cubit.dart';
import 'package:go_economy/views/taskScreens/TaskList/task_list_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../controller/AuthBloc/auth_cubit.dart';
import '../../../main.dart';
import '../../../models/task/task.dart';

class TaskListScreen extends StatefulWidget {
  static const id = "/taskListScreen";

  const TaskListScreen({super.key});

  @override
  State<TaskListScreen> createState() => _TaskListScreenState();
}

class _TaskListScreenState extends State<TaskListScreen> {
  void toggleTheme() async {
    showLoading();
    final prefs = await SharedPreferences.getInstance();
    bool isDarkMode = prefs.getBool('isDarkMode') ?? false;
    isDarkMode = !isDarkMode;
    await prefs.setBool('isDarkMode', isDarkMode);
    themeNotifier.value = isDarkMode;
    hideLoading();
  }
@override
  void initState() {
    super.initState();
    context.read<TaskListCubit>().getTasks();

}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Task List"),
          actions: [
            ValueListenableBuilder(
              valueListenable: themeNotifier,
              builder: (BuildContext context, value, Widget? child) {
                return IconButton(
                  icon: Icon(
                      themeNotifier.value ? Icons.dark_mode : Icons.light_mode),
                  onPressed: () => toggleTheme(),
                );
              },
            ),
            IconButton(
                onPressed: () {
                  context.read<AuthCubit>().logout();
                },
                icon: const Icon(Icons.logout)),
          ],
        ),
        body: BlocConsumer<TaskListCubit, TaskListState>(
          listener: (context, state) {
          },
          builder: (context, state) {
            List<Task> tasks = [];
            if (state.tasks.isNotEmpty) {
              tasks = state.tasks;
            }
            return tasks.isEmpty
                ? const Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: Text('No data available here Pleas add some tasks'),
                      )
                    ],
                  )
                : ListView.builder(
                    shrinkWrap: true,
                    itemCount: tasks.length,
                    scrollDirection: Axis.vertical,
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Container(
                        decoration: BoxDecoration(
                            color: Pallet.secondary,
                            borderRadius: BorderRadius.circular(10.w),
                            boxShadow: [Style.containerBoxShadow]),
                        margin: EdgeInsets.only(top: 10.h),
                        padding: EdgeInsets.symmetric(horizontal: 10.w),
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(tasks[index].title,
                                  style: TextStyle(
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.bold,
                                    color: Pallet.primary
                                  )),
                                  Text(tasks[index].description,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w400,
                                    color: Pallet.secondary == Color(0xFF232C63) ? Colors.white : Colors.black
                                  ),),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                ],
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                IconButton(
                                  onPressed: () {
                                    context.read<TaskFormCubit>().updatingTask(tasks[index]);
                                    Navigator.pushNamed(context, TaskFormScreen.id);
                                  },
                                  icon: Icon(Icons.edit,
                                  color: Pallet.secondary == Color(0xFF232C63) ? Colors.white : Colors.black,
                                  ),
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                IconButton(
                                  onPressed: () {
                                    context.read<TaskListCubit>().deleteTask(tasks[index]);
                                  },
                                  icon: Icon(Icons.delete,
                                     color: Pallet.secondary == Color(0xFF232C63) ? Colors.white : Colors.black
                                  ),
                                ),
                              ],
                            ),

                          ],
                        ),
                      );
                    });
          },
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.white,
          onPressed: () {
            Navigator.pushNamed(context, TaskFormScreen.id);
          },
          child: const Icon(
            Icons.add,
            color: Pallet.primary,
          ),
        ));
  }
}
