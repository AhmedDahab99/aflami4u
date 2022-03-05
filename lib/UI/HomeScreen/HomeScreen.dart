import 'package:flutter/material.dart';
import 'package:movie_app_with_provider/ProviderServices/ProvierServices.dart';
import 'package:movie_app_with_provider/UI/HomeScreen/AppBar/CustomAppBar.dart';
import 'package:movie_app_with_provider/UI/HomeScreen/MoviesList.dart';
import 'package:movie_app_with_provider/constants.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  static TabController tabController;

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    HomeScreen.tabController =
        TabController(length: categoriesNames.length, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    HomeScreen.tabController.dispose();
    Provider.of<ProviderMovies>(context).dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Aflami 4U",
        size: Size(double.infinity, 125),
        tabController: HomeScreen.tabController,
      ),
      body: Center(
        child: TabBarView(
            controller: HomeScreen.tabController,
            children: categoriesListApi.map((category) {
              return MoviesList(
                category: category, //
              );
            }).toList()),
      ),
    );
  }
}
