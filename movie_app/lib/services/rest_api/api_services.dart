import 'dart:convert';
import 'dart:developer';
import 'package:movie_app/model/movie.dart';
import 'package:http/http.dart' as http;

class ApiServices {
  Future<List<Movie>> getMovie() async {
    var client = http.Client();

    var uri = Uri.parse("https://jsonplaceholder.typicode.com/photos");
    var response = await client.get(uri);

    if (response.statusCode == 200) {
      var json = response.body;
      log("in side ApiServices  $json");
      List<Movie> sample = Movie.fromJson(jsonDecode(json)) as List<Movie>;
      return sample;
    }
    return [];
  }
}
