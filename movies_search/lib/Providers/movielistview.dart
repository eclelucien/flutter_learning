import 'package:flutter/material.dart';
import 'package:movies_search/Services/webService.dart';
import 'package:movies_search/ViewModels/movieviewmodel.dart';


class MovieListViewModel extends ChangeNotifier {

  List<MovieViewModel> movies = [];

  Future<void> fetchMovies(String keyword) async {
    final results =  await Webservice().fetchMovies(keyword);
    this.movies = results.map((item) => MovieViewModel(movie: item)).toList();
    notifyListeners();
  }

}