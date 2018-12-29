import 'package:app_frame/common/app_colors.dart';
import 'package:app_frame/main/route_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MovieDetailPage extends StatefulWidget {
  final String movieName;

  const MovieDetailPage({
    Key key, 
    @required this.movieName}) 
    : super(key: key);

  @override
  State<StatefulWidget> createState() => MovieDetailPageState();
}

class MovieDetailPageState extends State<MovieDetailPage> {
  @override
  Widget build(BuildContext context) {
    final movieName = widget.movieName;

    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('影片详情'),
        backgroundColor: AppColors.gray_F3F3F3,
        actionsForegroundColor: AppColors.black_333333,
        transitionBetweenRoutes: false,
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,

          children: <Widget>[
            Text(
              '电影：$movieName', 
              style: TextStyle(
                color: AppColors.black_666666, 
                fontSize: 18.0, 
                decoration: TextDecoration.none),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20.0),
            ),
            SizedBox(
              width: 100.0,
              child: CupertinoButton(
                padding: EdgeInsets.all(2.0),
                child: Text('登录'),
                color: Colors.red,
                onPressed: () {
                  RouteManager.route(context, RouteConfig.LoginRoute);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
