import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/screen/home_screen.dart';
import 'package:movie_app/screen/signup_screen.dart';
import 'package:movie_app/services/auth_bloc/auth_bloc.dart';
import 'package:movie_app/services/auth_bloc/auth_event.dart';
import 'package:movie_app/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Signin extends StatefulWidget {
  const Signin({Key? key}) : super(key: key);

  @override
  State<Signin> createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool _isObscure = true;

  Future<void> signInButton() async {
    const snackBar = SnackBar(
      content: Text("User is logged In"),
      duration: Duration(milliseconds: 1000),
    );
    if (emailController.text == "test@gmail.com" &&
        passwordController.text == "1234567") {
      try {
        context
            .read<AuthBloc>()
            .add(AuthEventLogIn(emailController.text, passwordController.text));

        final SharedPreferences sharedPreferences =
            await SharedPreferences.getInstance();
        sharedPreferences.setBool(isLoggedKey, true);
      } catch (Exception) {
        String result = Exception.toString();
      }
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const HomeScreen(),
          ));
    } else {
      const snackBar = SnackBar(
          content: Text("User Can't logged In"),
          duration: Duration(milliseconds: 1000));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign In"),
        centerTitle: true,
      ),
      body: Container(
        alignment: Alignment.topCenter,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(gapPadding: 30),
                    hintText: "Enter Your Email"),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                controller: passwordController,
                obscureText: _isObscure,
                keyboardType: TextInputType.visiblePassword,
                decoration: InputDecoration(
                    suffixIcon: IconButton(
                      onPressed: (() {
                        setState(() {
                          _isObscure = !_isObscure;
                        });
                      }),
                      icon: Icon(
                          _isObscure ? Icons.visibility : Icons.visibility_off),
                    ),
                    border: const OutlineInputBorder(gapPadding: 30),
                    hintText: "Enter Your Password"),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () => {signInButton()},
                  child: const Text("Sign In")),
              const SizedBox(
                height: 20,
              ),
              const Text("Have Not Yet Your Account ?"),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () => {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Signup(),
                            )),
                      },
                  child: const Text("Sign up")),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
