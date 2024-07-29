import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_economy/views/AuthScreens/sign_up_screen.dart';
import 'package:go_economy/views/taskScreens/TaskList/task_list_screen.dart';

import '../../helper/bot_toast.dart';
import '../../main.dart';
import '../../style/pallet.dart';
import '../../views/splash_screen.dart';
import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(const AuthState());

  void checkAuthStatus(BuildContext context) async {
    User? user = FirebaseAuth.instance.currentUser;
    debugPrint(user.toString());
    if (user!=null ) {
       Navigator.of(context).pushReplacementNamed(TaskListScreen.id);
    } else {
      Navigator.of(context).pushReplacementNamed(SignUpScreen.id);
    }
  }

  void login(String email, String password, BuildContext context) async {
    try {
        await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: password
      ).then((value) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("User Logged In")));
        Navigator.of(context).pushReplacementNamed(TaskListScreen.id);
        return value;
      });
    }catch(e){
      if(e.toString() == "[firebase_auth/invalid-credential] The supplied auth credential is incorrect, malformed or has expired."){
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          backgroundColor: Pallet.blue,
            content: Text("User Not Found or The Credentials is incorrect please check again or create new")));}
      debugPrint(e.toString());
    }

  }
  void signUp(String email, String password, BuildContext context) async {
    try {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email,
          password: password
      ).then((value) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("User Created")));
        Navigator.of(context).pushReplacementNamed(TaskListScreen.id);
        return value;
      });
  }catch(e){
      debugPrint(e.toString());
    }
  }

   Future<void> logout() async {
    try {
      showLoading();
        await FirebaseAuth.instance.signOut().then((value) {
          Navigator.of(globalContext!).pushReplacementNamed(SplashScreen.id);
        });
    } catch (error) {
      debugPrint(error.toString());
    } finally {
      hideLoading();
    }
  }

}
