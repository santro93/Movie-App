import 'dart:convert';
import 'dart:developer';
import 'package:movie_app/model/movie.dart';
import 'package:http/http.dart' as http;

class ApiServices {
  final List<Movie> sample = [];
  Future<List<Movie>> getMovie() async {
    var client = http.Client();

    var uri = Uri.parse("https://jsonplaceholder.typicode.com/photos");
    var response = await client.get(uri);

    if (response.statusCode == 200) {
      try {
        var json = response.body;
        //   log("in side ApiServices  $json");
        final sample = movieFromJson(json);
        log("in side ApiServices  $sample");
        return sample;
      } catch (e) {
        print(e.toString());
      }
    }
    return sample;
  }
}

// import 'dart:convert';
// import 'dart:developer';
// import 'package:movie_app/model/movie.dart';
// import 'package:http/http.dart' as http;

// class ApiServices {
//   final List<Movie> sample = [];
//   Future<List<Movie>> getMovie() async {
//     var client = http.Client();

//     var uri = Uri.parse("https://jsonplaceholder.typicode.com/photos");
//     var response = await client.get(uri);

//     if (response.statusCode == 200) {
//       try {
//         var json = response.body;
//         //   log("in side ApiServices  $json");
//         final sample = movieFromJson(json);
//         log("in side ApiServices  $sample");
//         return sample;
//       } catch (e) {
//         print(e.toString());
//       }
//     }
//     return sample;
//   }
// }
