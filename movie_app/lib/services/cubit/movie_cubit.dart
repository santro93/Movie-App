import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/model/movie.dart';
import 'package:movie_app/services/cubit/movie_state.dart';
import 'package:movie_app/services/rest_api/api_services.dart';

// class MovieCubit extends Cubit<List<Movie>?> {
//   MovieCubit() : super(null);

//   displayData() async {
//     List<Movie>? showData = await ApiServices().getMovie();
//     emit(showData);
//   }
// }

class MoviesCubit extends Cubit<MoviesState> {
  MoviesCubit({this.repository}) : super(InitialState()) ;

  ApiServices? repository;

  displayData() async {
    try {
      final movies = await ApiServices().getMovie();
      log("inside MoviesCubit $movies");
      emit(LoadedState(movies));
    } catch (e) {
      String result = e.toString();
      log("${result}");
    }
  }
}
