import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/model/movie.dart';
import 'package:movie_app/screen/signin_screen.dart';
import 'package:movie_app/services/cubit/movie_cubit.dart';
import 'package:movie_app/services/cubit/movie_state.dart';
import 'package:movie_app/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Movie>? movies = [];
  var isLoaded = false;
  MoviesCubit moviesCubit = MoviesCubit();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  getData() async {
    log("message");
    movies = await moviesCubit.displayData() as List<Movie>?;
    log(" getData Movies $movies");
    // if (movies != null) {
    //   setState(() {
    //     isLoaded = true;
    //     log("isLoaded $isLoaded");
    //   });
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () async {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Signin(),
                      ));
                  final SharedPreferences sharedPreferences =
                      await SharedPreferences.getInstance();
                  sharedPreferences.setBool(isLoggedKey, false);
                  // context.read<MoviesCubit>().displayData();
                },
                icon: const Icon(Icons.logout))
          ],
          title: const Text("Movie"),
          centerTitle: true,
        ),
        body:
            //  isLoaded
            //     ?
            BlocBuilder<MoviesCubit, MoviesState>(
          builder: (context, state) {
            if (state is InitialState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is LoadedState) {
              log("inside BlocBuilder $movies");
              return ListView.builder(
                itemCount: state.movies.length,
                itemBuilder: ((context, index) {
                  return Container(
                    child: Text(state.movies[index].thumbnailUrl!),
                  );
                }),
              );
            } else {
              return Container();
              // ? ListView.builder(
              //     itemCount: movies!.length,
              //     itemBuilder: ((context, index) {
              //       return Container(
              //         child: Text(movies![index].thumbnailUrl!),
              //       );
            }
            //   )
          },
        )
        // : const Center(child: CircularProgressIndicator()),
        );
  }
}
