import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/model/movie.dart';
import 'package:movie_app/services/rest_api/api_services.dart';

part 'movie_state.dart';

class MovieCubit extends Cubit<List<Movie>?> {
  MovieCubit() : super(null);

  displayData() async {
    var showData = await ApiServices().getMovie();
    emit(showData);
  }
}
