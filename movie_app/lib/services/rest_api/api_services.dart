import 'package:movie_app/model/movie.dart';
import 'package:http/http.dart' as http;

class ApiServices {
  Future<List<Movie>?> getMovie() async {
    var client = http.Client();

    var uri = Uri.parse("https://jsonplaceholder.typicode.com/photos");
    var response = await client.get(uri);

    if (response.statusCode == 200) {
      var json = response.body;
      return movieFromJson(json);
    }
  }
}
