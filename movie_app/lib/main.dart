import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/screen/signin_screen.dart';
import 'package:movie_app/services/auth/auth_services.dart';
import 'package:movie_app/services/auth_bloc/auth_bloc.dart';

void main() {
   Authentication? authentication;
  runApp(
    MaterialApp(
      home: BlocProvider<AuthBloc>(
        create: (context) => AuthBloc(authentication!),
        child: const Signin(),
      ),
      debugShowCheckedModeBanner: false,
    ),
  );
}