import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/model/movie.dart';
import 'package:movie_app/screen/signin_screen.dart';
import 'package:movie_app/services/auth_bloc/auth_bloc.dart';
import 'package:movie_app/services/auth_bloc/auth_event.dart';
import 'package:movie_app/services/auth_bloc/auth_state.dart';
import 'package:movie_app/services/rest_api/api_services.dart';
import 'package:movie_app/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Movie>? movies;
  var isLoaded = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  getData() async {
    movies = await ApiServices().getMovie();
    if (movies != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // context.read<AuthBloc>().add(const AuthEventInitialize());
    // return BlocBuilder<AuthBloc, AuthState>(builder: context, state);
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
              },
              icon: const Icon(Icons.logout))
        ],
        title: const Text("Movie"),
        centerTitle: true,
      ),
      body: isLoaded
          ? ListView.builder(
              itemCount: movies!.length,
              itemBuilder: ((context, index) {
                return Container(
                  child: Text(movies![index].thumbnailUrl!),
                );
              }),
            )
          : const Center(child: CircularProgressIndicator()),
    );
  }
}
