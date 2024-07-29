import 'routes_helper.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case SplashScreen.id:
        return MaterialPageRoute(
          builder: (context) => const SplashScreen(),
        );
      case TaskListScreen.id:
        return MaterialPageRoute(
          builder: (context) => const TaskListScreen(),
        );
      case LoginScreen.id:
        return MaterialPageRoute(
          builder: (context) => const LoginScreen(),
        );
      case SignUpScreen.id:
        return MaterialPageRoute(
          builder: (context) => const SignUpScreen(),
        );
      case TaskFormScreen.id:
        return MaterialPageRoute(
          builder: (context) => const TaskFormScreen(),
        );
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
              body: Center(
                  child: Text('No route defined for ${settings.name}')),
            ));
    }
  }
}