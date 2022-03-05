import 'package:flutter/material.dart';
import 'package:movie_app_with_provider/DataModel/Movies.dart';
import 'package:movie_app_with_provider/ProviderServices/ProvierServices.dart';
import 'package:movie_app_with_provider/UI/HomeScreen/MoviesCard.dart';
import 'package:provider/provider.dart';

class MoviesList extends StatelessWidget {
  final String category;
  Movies movies;

  MoviesList({this.category});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ProviderMovies>(context);
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return FutureBuilder(
        future: ProviderMovies.getMovies(category),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return MovieCard();
          } else {
            return Center(
                child: Container(
                    height: height / 7.5,
                    width: width / 3.5,
                    child: CircularProgressIndicator()));
          }
        });
  }
}
