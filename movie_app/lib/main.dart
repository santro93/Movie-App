import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/screen/home_screen.dart';
import 'package:movie_app/screen/signin_screen.dart';
import 'package:movie_app/services/auth/auth_services.dart';
import 'package:movie_app/services/auth_bloc/auth_bloc.dart';
import 'package:movie_app/services/cubit/movie_cubit.dart';

void main() {
  runApp(
    MaterialApp(
      home: MultiBlocProvider(
        providers: [
          BlocProvider<AuthBloc>(
            create: (context) => AuthBloc(Authentication()),
            child: const HomeScreen(),
          ),
          BlocProvider<MoviesCubit>(
            create: (context) => MoviesCubit(),
            child: const HomeScreen(),
          ),
        ],
        child: const Signin(),
      ),
      debugShowCheckedModeBanner: false,
    ),
  );
}
