import 'dart:developer';
import 'package:bloc/bloc.dart';
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
  MoviesCubit() : super(LoadedState(ApiServices.getMovie()));

  displayData() async {
    bool? isLoaded;
    // try {
    if (ApiServices.getMovie() != null) {
      isLoaded = true;
      final movies = await ApiServices.getMovie();
      log("inside MoviesCubit $isLoaded");
      emit(LoadedState(movies!));
    } else {
      isLoaded = false;
      log("Else MoviesCubit $isLoaded");
    }
    // } catch (e) {
    //   String result = e.toString();
    //   log("${result}");
    // }
  }
}
