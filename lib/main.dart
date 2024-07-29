import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_economy/routes/routes.dart';
import 'package:go_economy/services/shared_pref.dart';
import 'package:go_economy/util/network/internet_handler.dart';
import 'package:go_economy/views/splash_screen.dart';
import 'package:go_economy/views/taskScreens/TaskForm/task_form_cubit.dart';
import 'package:go_economy/views/taskScreens/TaskList/task_list_cubit.dart';
import 'package:go_economy/widgets/responsive/responsive_builder.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Themes/theme.dart';
import 'controller/AuthBloc/auth_cubit.dart';
import 'flavors/config/flavor_config.dart';

// global context used for logout
BuildContext? globalContext;
final navigatorKey = GlobalKey<NavigatorState>();

Future mainCommon() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await Pref.instance.init();

  final prefs = await SharedPreferences.getInstance();
  final isDarkMode = prefs.getBool('isDarkMode') ?? false;
  themeNotifier.value = isDarkMode;

  runApp(const MyApp(),);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthCubit>(
          create: (BuildContext context) => AuthCubit(),
        ),
        BlocProvider<TaskFormCubit>(
          create: (BuildContext context) => TaskFormCubit(),
        ),
        BlocProvider<TaskListCubit>(
          create: (BuildContext context) => TaskListCubit(),
        ),
      ],
      child: InternetHandler(
        child: ValueListenableBuilder<bool>(
          valueListenable: themeNotifier,
          builder: (context, isDarkMode, child) {
            return MaterialApp(
              navigatorKey: navigatorKey,
              title: FlavorConfig.instance.appName,
              debugShowCheckedModeBanner: false,
              builder: (context, child) => ResponsiveBuilder(
                builder: (context) {
                  return BotToastInit()(context, child);
                },
              ),
              navigatorObservers: [BotToastNavigatorObserver()],
              theme: isDarkMode ? Themes.dark : Themes.light,
              onGenerateRoute: Routes.generateRoute,
              initialRoute: SplashScreen.id,
            );
          },
        ),
      ),
    );
  }
}

final ValueNotifier<bool> themeNotifier = ValueNotifier(false);
