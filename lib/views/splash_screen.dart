import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../controller/AuthBloc/auth_cubit.dart';
import '../controller/AuthBloc/auth_state.dart';
import '../routes/routes_helper.dart';

class SplashScreen extends StatefulWidget {
  static const id = "/";
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3)).then((value){
      context.read<AuthCubit>().checkAuthStatus(context);
    });
  }
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
      },
      builder: (context, state) {
        return const Scaffold(
          body: Center(
            child: Text("Welcome to Go Economy ❤️"),
          ),
        );
      },
    );
  }
}
