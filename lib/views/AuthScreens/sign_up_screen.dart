import 'package:flutter_bloc/flutter_bloc.dart';

import '../../controller/AuthBloc/auth_cubit.dart';
import '../../routes/routes_helper.dart';

class SignUpScreen extends StatefulWidget {
 static const id = "/sign_up";

  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
 final _formKey = GlobalKey<FormState>();
 final TextEditingController emailController = TextEditingController();
 final TextEditingController passwordController = TextEditingController();
 bool isVisible = true;
 bool _isFormValid = false;

 void _validateForm() {
  setState(() {
   _isFormValid = _formKey.currentState?.validate() ?? false;
  });
 }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
       const SizedBox(height: 50),
       const Text("Sign Up", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
       const SizedBox(height: 50),
       Form(
        key: _formKey,
        onChanged: _validateForm,
        child: Column(
         children: [
          Padding(
           padding: const EdgeInsets.all(8.0),
           child: TextFormField(
            controller: emailController,
            decoration: const InputDecoration(
             hintText: "Email",
             focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blue, width: 2.0),
             ),
             enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey, width: 2.0),
             ),
             errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red, width: 2.0),
             ),
             focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red, width: 2.0),
             ),
            ),
            validator: (value) {
             if (value == null || value.isEmpty) {
              return '';
             } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+')
                 .hasMatch(value)) {
              return 'Please enter a valid email address';
             }
             return null;
            },
           ),
          ),
          const SizedBox(height: 10),
          Padding(
           padding: const EdgeInsets.all(8.0),
           child: TextFormField(
            controller: passwordController,
            decoration: InputDecoration(
             hintText: "Password",
             suffixIcon: IconButton(
              onPressed: () {
               setState(() {
                isVisible = !isVisible;
               });
              },
              icon: Icon(isVisible
                  ? Icons.visibility
                  : Icons.visibility_off),
             ),
             focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blue, width: 2.0),
             ),
             enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey, width: 2.0),
             ),
             errorBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red, width: 2.0),
             ),
             focusedErrorBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red, width: 2.0),
             ),
            ),
            validator: (value) {
             if (value == null || value.isEmpty) {
              return '';
             } else if (value.length < 8) {
              return 'Password must be at least 8 characters long';
             }
             return null;
            },
            obscureText: isVisible,
           ),
          ),
         ],
        ),
       ),
       const Spacer(),
       ElevatedButton(
        onPressed: _isFormValid ? () {
         if (_formKey.currentState?.validate() ?? false) {
          context.read<AuthCubit>().signUp(emailController.text, passwordController.text, context);
         }
        } : null,
        child: const Text("Sign Up"),
       ),
       const Spacer(),
       Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
         const Text("Already have an account?"),
         TextButton(
          onPressed: () {
           Navigator.of(context).pushNamed(LoginScreen.id);
          },
          child: const Text("Login"),
         ),
        ],
       ),
      ],
     ),
    );
  }
}
