import 'package:flutter/material.dart';
import 'package:movie_app/model/movie.dart';

@immutable
abstract class MovieState {}

class MovieIntialize extends MovieState {}

class MovieDisplay extends MovieState {
  Future<List<Movie>> movies;
  MovieDisplay(this.movies);
}

// abstract class MoviesState extends Equatable {}

// class InitialState extends MoviesState {
//   @override
//   List<Object> get props => [];
// }

// class LoadedState extends MoviesState {
//   LoadedState(this.movies);

//   final List<Movie> movies;

//   @override
//   List<Object> get props => [movies];
// }
