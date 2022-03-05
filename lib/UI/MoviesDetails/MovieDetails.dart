import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:movie_app_with_provider/DataModel/Movies.dart';
import 'package:movie_app_with_provider/ProviderServices/ProvierServices.dart';
import 'package:movie_app_with_provider/constants.dart';
import 'package:provider/provider.dart';
import 'package:share/share.dart';

// ignore: must_be_immutable
class MovieDetail extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final int movieId;
  String image =
      "https://thumbs.dreamstime.com/b/no-image-available-icon-flat-vector-no-image-"
      "available-icon-flat-vector-illustration-132482953.jpg";
  final int index;
  final Movies movies;

//  Movies _movies = new Movies();
  MovieDetail({this.index, this.movies, this.movieId});

  // share movie
  Future<void> share(BuildContext context, int index) async {

    var movie=Provider.of<ProviderMovies>(context,listen: false);
    String movieKey;
    await movie.getVideoUrl(ProviderMovies.myResult[index].id).then((value) {
      movieKey=value.key;
    });
    final RenderBox box = context.findRenderObject();
    Share.share(  '$baseYoutubeUrl' + '$movieKey',
        subject: ProviderMovies.myResult[index].title,
        sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size );


  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
          ),
          backgroundColor: Colors.white,
          title: Text('${ProviderMovies.myResult[index].title}',
              style: boldTextStyleDarkAppBar),
          actions: [
            Padding(
                padding: EdgeInsets.only(right: 16),
                child: IconButton(
                  onPressed: () => share(context, index),
                  tooltip: "Share The Movie",
                  iconSize: 30,
                  icon: Icon(
                    Icons.share_rounded,
                    color: Colors.black,
                  ),
                ))
          ],
        ),
        body: SafeArea(child: Consumer<ProviderMovies>(
          builder: (context, movie, child) {
            return SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Stack(
                children: [
                  Column(
                    children: [
                      Container(
                          width: width,
                          height: height / 4,
                          child: ClipRRect(
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(40),
                                bottomRight: Radius.circular(40)),
                            child: Image(
                                alignment: Alignment.topCenter,
                                fit: BoxFit.cover,
                                filterQuality: FilterQuality.high,
                                image: NetworkImage(
                                    "${imageUrlPrefix + ProviderMovies.myResult[index].backdropPath}")),
                          )),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 30.0, left: 10),
                            child: Hero(
                              tag: index,
                              child: ClipRRect(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    topRight: Radius.circular(20),
                                    bottomLeft: Radius.circular(20),
                                    bottomRight: Radius.circular(20)),
                                child: Image(
                                  image: (NetworkImage(
                                    ProviderMovies.myResult[index].posterPath ==
                                            null
                                        ? image
                                        : "${imageUrlPrefix + ProviderMovies.myResult[index].posterPath}",
                                  )),
                                  fit: BoxFit.cover,
                                  height: height / 3,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 16),
                            child: Container(
                                width: MediaQuery.of(context).size.width / 2.5,
                                child: Column(
                                  children: <Widget>[
                                    // title
                                    Text(
                                      '${ProviderMovies.myResult[index].title}',
                                      style: boldTextStyleDark,
                                      textAlign: TextAlign.left,
                                      maxLines: 4,
                                      softWrap: true,
                                    ),
                                    Divider(
                                      color: Colors.grey,
                                    ),
                                    // release date
                                    Text(
                                        'Release Date: ${ProviderMovies.myResult[index].releaseDate}',
                                        style: thinTextStyleDark,
                                        textAlign: TextAlign.left),
                                    Divider(
                                      color: Colors.grey,
                                    ),
                                    // language
                                    Text(
                                      'Language: ${ProviderMovies.myResult[index].originalLanguage}',
                                      style: thinTextStyleDark,
                                      textAlign: TextAlign.left,
                                    ),
                                    Divider(
                                      color: Colors.grey,
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        Provider.of<ProviderMovies>(context,
                                                listen: false)
                                            .launchYoutube(
                                                movieID: ProviderMovies
                                                    .myResult[index].id);
//                                        catch (e){
//                                          return Flushbar(
//                                            padding: EdgeInsets.symmetric(horizontal: 20.0,vertical: 20),
//                                            margin: EdgeInsets.only(bottom: 15.0,left: 20,right: 20),
//                                            borderRadius: 20,
//                                            backgroundGradient: LinearGradient(
//                                              colors: [Color(0xff000221),Color(0xffffffff)],
//                                              stops: [0.3,1],
//                                            ),
//                                            boxShadows: [
//                                              BoxShadow(
//                                                  color: Colors.black.withOpacity(0.6),
//                                                  offset: Offset(1, 3),
//                                                  blurRadius: 10,
//                                                  spreadRadius: 5
//                                              ),
//                                            ],
//                                            duration: Duration(seconds: 2),
//                                            forwardAnimationCurve: Curves.easeOutCirc,
//                                            messageText: Row(
//                                              children: [
//                                                Text('Product Added To ',style:TextStyle(
//                                                  color: Color(0xffffffff),
//                                                  fontSize: 22,
//                                                  fontWeight: FontWeight.bold,
//                                                ),),
//                                                Text('Your Cart',style:TextStyle(
//                                                  color: Color(0xff000221),
//                                                  fontSize: 22,
//                                                  fontWeight: FontWeight.w900,
//                                                ),),
//                                              ],
//                                            ),
//                                          )..show(context);
//
                                      },
                                      child: Card(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(12)),
                                        color: Color(0xffd8d8d8),
                                        elevation: 6,
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 2, vertical: 14),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Icon(
                                                FontAwesomeIcons.youtube,
                                                color: Colors.redAccent[700],
                                              ),
                                              SizedBox(
                                                width: width / 30,
                                              ),
                                              Text(
                                                "Watch Trailer",
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w600,
                                                    color:
                                                        Colors.redAccent[700]),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                )),
                          )
                        ],
                      ),
                      Divider(
                        color: darkTextColor,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                                child: Column(
                              children: <Widget>[
                                Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50.0),
                                      border: Border.all(
                                          width: 2.0,
                                          color: darkTextColor,
                                          style: BorderStyle.solid)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                        '${ProviderMovies.myResult[index].voteAverage}',
                                        style: regularTextStyleDark),
                                  ),
                                ),
                                SizedBox(
                                  height: 8.0,
                                ),
                                Text('Vote average', style: thinTextStyleDark)
                              ],
                            )),
                            Expanded(
                                child: Column(
                              children: <Widget>[
                                Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50.0),
                                      border: Border.all(
                                          width: 2.0,
                                          color: darkTextColor,
                                          style: BorderStyle.solid)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                        '${ProviderMovies.myResult[index].voteCount}',
                                        style: regularTextStyleDark),
                                  ),
                                ),
                                SizedBox(
                                  height: 8.0,
                                ),
                                Text('Voted Count', style: thinTextStyleDark)
                              ],
                            )),
                            Expanded(
                                child: Column(
                              children: <Widget>[
                                Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50.0),
                                      border: Border.all(
                                          width: 2.0,
                                          color: darkTextColor,
                                          style: BorderStyle.solid)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                        '${ProviderMovies.myResult[index].popularity}',
                                        style: regularTextStyleDark),
                                  ),
                                ),
                                SizedBox(
                                  height: 8.0,
                                ),
                                Text('Popularity', style: thinTextStyleDark)
                              ],
                            )),
                          ],
                        ),
                      ),
                      Divider(
                        color: darkTextColor,
                      ),
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(
                              '${ProviderMovies.myResult[index].overview}',
                              style: TextStyle(
                                  color: darkTextColor.withOpacity(0.6),
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.w300)),
                        ),
                      ),
                    ],
                  ),
                  Positioned(
                    right: 15,
                    top: 170,
                    child: Container(
                        width: width / 5.5,
                        height: height / 14,
                        decoration: BoxDecoration(
                          color: Colors.redAccent[700],
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: IconButton(
                          tooltip: "Add To Favourite",
                          onPressed: () {},
                          icon: Icon(
                            CupertinoIcons.heart,
                            size: 40,
                            color: Colors.white,
                          ),
                        )),
                  ),
                ],
              ),
            );
          },
        )));
  }
}
