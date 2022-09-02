import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:movie_app/services/cubit/movie_state.dart';
import 'package:movie_app/services/rest_api/api_services.dart';
import 'package:movie_app/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MoviesCubit extends Cubit<MoviesState> {
  MoviesCubit() : super(InitialState()) {
    displayData();
  }

  displayData() async {
    bool isLoaded = false;
    emit(InitialState());
    ApiServices repository = ApiServices();
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    bool? isLoggedIn = sharedPreferences.getBool(isLoggedKey);

    if (isLoggedIn = true) {
      log("$isLoggedIn");
      isLoaded = true;
      final movieList = await repository.getMovie();
      log("inside MoviesCubit $movieList");
      emit(LoadedState(movieList));
      log("isLoggedIn $isLoggedIn");
    } else {
      isLoaded = false;
      log("Else MoviesCubit $isLoaded");
    }
  }
}
