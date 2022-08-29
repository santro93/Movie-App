part of 'movie_cubit.dart';

@immutable
abstract class MovieState {}

class MovieIntialize extends MovieState {}

class MovieDisplay extends MovieState {
  final String showData;
  MovieDisplay(this.showData);
}
