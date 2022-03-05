import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:movie_app_with_provider/DataModel/Movies.dart';
import 'package:movie_app_with_provider/DataModel/MoviesTrailer.dart';
import 'package:movie_app_with_provider/DataModel/Results.dart';
import 'package:url_launcher/url_launcher.dart';

import '../constants.dart';

class ProviderMovies with ChangeNotifier {
  static Movies movies;
  static List<Results> myResult;

  static List<Results> get moviesResults => movies.results;

//  int currentValue = 5;
  static String category = 'now_playing';
  var trailers = Trailers();

  void changeCategory(String newCategory) {
    category = newCategory;
    if (category != newCategory) {
      notifyListeners();
    }
  }

  static Future<Movies> getMovies(String category) async {
    String url = (baseUrl +
        category +
        '?api_key=' +
        apiKey +
        '&language=en-us' +
        "&page=1"); //
    final response = await http.get(url);
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      ProviderMovies.category = category;
      movies = Movies.fromJson(json); //res;//
      myResult = movies.results;
    } else {
      throw Exception('Error Loading Movies');
    }
    return movies;
  }

  Future<TrailersResults> getVideoUrl(int movieID) async {
    String videoURL = (baseUrl +
        "$movieID" +
        '/videos?api_key=' +
        apiKey +
        '&language=en-us');

    final res = await http.get(videoURL);
    if (res.statusCode == 200) {
      var json = jsonDecode(res.body);
      trailers = Trailers.fromJson(json);
    } else {
      throw Exception("Failed to load data"); //or e
    }
    notifyListeners();
    return trailers.results[1];
  }

// launch Youtube
  launchYoutube({int movieID}) async {
    String movieKey;
    await getVideoUrl(movieID).whenComplete(() {
      movieKey = trailers.results[0].key;
    });

    if (Platform.isIOS) {
      if (await canLaunch('youtube://$baseYoutubeUrl' + movieKey)) {
        await launch('youtube://$baseYoutubeUrl' + movieKey,
            forceSafariVC: false);
      } else {
        throw 'Could not launch $baseYoutubeUrl' + movieKey;
      }
    } else {
      var url = '$baseYoutubeUrl' + movieKey;
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        throw 'Could not launch $url';
      }
    }
  }
}
