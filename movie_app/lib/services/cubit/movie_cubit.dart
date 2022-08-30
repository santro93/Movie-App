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

class MoviesCubit extends Cubit<MovieState> {
  MoviesCubit() : super(MovieDisplay(ApiServices().getMovie()));

  displayData() async {
    bool? isLoaded;
    // try {
    // ignore: unnecessary_null_comparison
    if (ApiServices().getMovie() != null) {
      isLoaded = true;
      Future<List<Movie>> movies =
          (await ApiServices().getMovie()) as Future<List<Movie>>;
      log("inside MoviesCubit $movies");
      emit(MovieDisplay(movies));
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
