import 'package:flutter/material.dart';
import 'package:movie_app/model/movie.dart';
import 'package:equatable/equatable.dart';
// @immutable
// abstract class MovieState {
//   const MovieState();
// }

// class MovieIntialize extends MovieState {
//   const MovieIntialize();
// }

// class MovieDisplay extends MovieState {
//   final Future<List<Movie>> movies;
//   const MovieDisplay(this.movies);
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
  List<Object> get props => [movies];
}
