import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/screen/signin_screen.dart';
import 'package:movie_app/services/cubit/movie_cubit.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MaterialApp(
      home: BlocProvider<MoviesCubit>(
        create: ((context) => MoviesCubit()),
        child: const Signin(),
      ),
      debugShowCheckedModeBanner: false,
    ),
  );
}
