import 'package:flutter/material.dart';
import 'package:movie_app/screen/signin_screen.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool _isObscure = true;

  @override
  void dispose() {
    // ignore: todo
    // TODO: implement dispose
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign Up"),
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
              TextField(
                controller: nameController,
                keyboardType: TextInputType.name,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      gapPadding: 30,
                    ),
                    hintText: "Enter Your Name"),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                controller: emailController,
                keyboardType: TextInputType.name,
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
                keyboardType: TextInputType.name,
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
                onPressed: () => {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Signin(),
                      ))
                },
                child: const Text("Sign Up"),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text("Have Already Your Account ?"),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () => {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Signin(),
                            ))
                      },
                  child: const Text("Sign in")),
            ],
          ),
        ),
      ),
    );
  }
}
