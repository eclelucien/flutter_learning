import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movies_search/Models/movie.dart';

class Webservice {
  Future<List<Movie>> fetchMovies(String keyword) async {
    final url = "http://www.omdbapi.com/?s=$keyword&apikey=eb0d5538";
    final response = await http.get(Uri.parse(url));
    print(response.body);
    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      final Iterable json = body["Search"];
      return json.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      throw Exception("Unable to perform request!");
    }
  }
}
