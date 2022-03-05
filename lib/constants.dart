import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// API Key form Movies Api
String apiKey = "285ffa3c79dadc3e9c4c089a8d861142";

// start of url of movie's Poster
String imageUrlPrefix = 'https://image.tmdb.org/t/p/w342';

// Base URL of httpURL
String baseUrl = "https://api.themoviedb.org/3/movie/";

// BaseUrl of trailers
String baseYoutubeUrl = 'https://www.youtube.com/watch?v=';

var categoriesListApi = [
  'now_playing',
  'popular',
  'top_rated',
  'upcoming'
]; // list name of Api Movies

var categoriesNames = ['Now Playing', 'Popular', 'Top Rated', 'Upcoming'];

var iconsCategoriesList = [
  Icon(FontAwesomeIcons.play, // now playing
      color: Color(0xffffffff)),
  Icon(
    FontAwesomeIcons.fireAlt, // popular
    color: Color(0xffffffff),
  ),
  Icon(
    FontAwesomeIcons.grinHearts, // top rated
    color: Color(0xffffffff),
  ),
  Icon(FontAwesomeIcons.hourglassHalf, //upcoming
      color: Color(0xffffffff)),
];

// colors
Color darkTextColor = Color(0xff000221);
Color lightTextColor = Color(0xffffffff);

// dark textStyle
TextStyle thinTextStyleDark =TextStyle(
  fontWeight: FontWeight.w300,
  fontSize: 14,
  color: darkTextColor
);
TextStyle regularTextStyleDark =TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 14,
    color: darkTextColor
);
TextStyle boldTextStyleDark =TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 28,
    color: darkTextColor
);
TextStyle boldTextStyleLightAppBar =TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 20,
    color: lightTextColor
);
TextStyle boldTextStyleDarkAppBar =TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 20,
    color: darkTextColor
);

// light textStyle
TextStyle thinTextStyleLight=TextStyle(
    fontWeight: FontWeight.w300,
    fontSize: 15,
    color: lightTextColor
);
TextStyle regularTextStyleLight =TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 14,
    color: lightTextColor
);
TextStyle boldTextStyleLight =TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 28,
    color: lightTextColor
);

