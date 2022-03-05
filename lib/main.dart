import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:movie_app_with_provider/ProviderServices/ProvierServices.dart';
import 'package:provider/provider.dart';

import 'UI/HomeScreen/HomeScreen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  if(kDebugMode){
    print("testing");
  }

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ProviderMovies>(
      create: (context)=>ProviderMovies(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
        theme: ThemeData.light(),
      ),
    );
  }
}
