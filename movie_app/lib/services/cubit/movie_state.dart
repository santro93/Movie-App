import 'package:movie_app/model/movie.dart';
import 'package:equatable/equatable.dart';

abstract class MoviesState extends Equatable {}

class InitialState extends MoviesState {
  @override
  List<Object> get props => [];
}

class LoadedState extends MoviesState {
  LoadedState(this.movies);

  final List<Movie> movies;

  @override
  List<Object> get props => [movies];
}
