import 'package:flutter/material.dart';
import 'package:movie_app_with_provider/constants.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Size size;
  final String title;
  final TabController tabController;

  CustomAppBar({this.size, this.title, this.tabController});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor:darkTextColor ,
      title: Text(
        "Aflami 4U",
        style: boldTextStyleLightAppBar,
      ),
      bottom: TabBar(
        controller: tabController,
        unselectedLabelColor: Colors.black,
        indicator: BoxDecoration(
            borderRadius: BorderRadius.only(topRight: Radius.circular(20.0),topLeft: Radius.circular(20.0)),
            color: Colors.white.withOpacity(0.4)
        ),
//        indicatorColor: darkTextColor,
        tabs: List.generate(
            categoriesNames.length,
                (index) => Tab(
                  icon: iconsCategoriesList[index],
                  child: Text(
                    categoriesNames[index],
                    style: regularTextStyleLight,
                    textAlign: TextAlign.center,
                  ),
                ),
        ).toList(),
      ),
    );
  }

  @override
  Size get preferredSize => size;
}
