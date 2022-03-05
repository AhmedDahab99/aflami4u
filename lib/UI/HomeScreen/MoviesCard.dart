import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_app_with_provider/ProviderServices/ProvierServices.dart';
import 'package:movie_app_with_provider/UI/MoviesDetails/MovieDetails.dart';
import 'package:movie_app_with_provider/constants.dart';
import 'package:provider/provider.dart';

class MovieCard extends StatelessWidget {
  String image =
      "https://thumbs.dreamstime.com/b/no-image-available-icon-flat-vector-no-image-available-icon-flat-vector-illustration-132482953.jpg";

  @override
  Widget build(BuildContext context) {
    return Consumer<ProviderMovies>(builder: (context, value, child) {
      return Padding(
        padding: const EdgeInsets.only(top: 16.0),
        child: GridView.builder(
            physics: BouncingScrollPhysics(),
            itemCount: (ProviderMovies.myResult == null)
                ? 0
                : ProviderMovies.myResult.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: MediaQuery.of(context).size.aspectRatio * 1.25,
            ),
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MovieDetail(
                                index: index,
                              )));
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(children: [
                    Hero(
                      tag: index,
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20)),
                        child: Image(
                          image: (NetworkImage(
                            ProviderMovies.myResult[index].posterPath == null
                                ? image
                                : "${imageUrlPrefix + ProviderMovies.myResult[index].posterPath}",
                          )),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SingleChildScrollView(
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(20),
                                bottomLeft: Radius.circular(20)),
                            color: darkTextColor.withOpacity(0.1)),
                        alignment: Alignment.center,
                        height: 90,
                        width: 342,
                        child: Text(
                          "${ProviderMovies.myResult[index].title}",
                          style: thinTextStyleDark,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    )
                  ]),
                ),
              );
            }),
      );
    });
  }
}
