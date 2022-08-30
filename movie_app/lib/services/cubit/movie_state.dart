import 'package:equatable/equatable.dart';
import 'package:movie_app/model/movie.dart';

// @immutable
// abstract class MovieState {}

// class MovieIntialize extends MovieState {}

// class MovieDisplay extends MovieState {
//   MovieDisplay();
// }

abstract class MoviesState extends Equatable {}

class InitialState extends MoviesState {
  @override
  List<Object> get props => [];
}

class LoadedState extends MoviesState {
  LoadedState(this.movies);

  final List<Movie> movies;

  @override
  List<Object> get props => [movies] as dynamic;
}
