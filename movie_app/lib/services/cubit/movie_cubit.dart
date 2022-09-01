import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:movie_app/services/cubit/movie_state.dart';
import 'package:movie_app/services/rest_api/api_services.dart';

import '../../model/movie.dart';

class MoviesCubit extends Cubit<MoviesState> {
  MoviesCubit() : super(InitialState()) {
    displayData();
  }

  ApiServices repository = ApiServices();

  displayData() async {
    bool? isLoaded;
    emit(InitialState());
    if (ApiServices().getMovie() != null) {
      isLoaded = true;
      final movieList = await repository.getMovie();
      log("inside MoviesCubit $movieList");
      emit(LoadedState(movieList));
    } else {
      isLoaded = false;
      log("Else MoviesCubit $isLoaded");
    }
  }
}
