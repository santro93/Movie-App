import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:movie_app/services/cubit/movie_state.dart';
import 'package:movie_app/services/rest_api/api_services.dart';

class MoviesCubit extends Cubit<MoviesState> {
  MoviesCubit() : super(InitialState()) {
    displayData();
  }

  ApiServices repository = ApiServices();

  displayData() async {
    bool? isLoaded;
    emit(InitialState());
    // ignore: unnecessary_null_comparison
    if (isLoaded != false) {
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
