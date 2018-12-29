import 'package:app_frame/common/app_colors.dart';
import 'package:app_frame/main/route_manager.dart';
import 'package:flutter/material.dart';
import 'main/main_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: AppColors.green_85D761,
        backgroundColor: Colors.white,
        accentColor: AppColors.green_85D761,
      ),
      home: MainPage(),
      onGenerateRoute: RouteManager.mapRouteWithSettings,
    );
  }
}

