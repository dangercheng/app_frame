import 'package:app_frame/common/app_colors.dart';
import 'package:app_frame/main/route_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class LoginPage extends StatefulWidget {
  @override
    State<StatefulWidget> createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  @override
    Widget build(BuildContext context) {
      return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: Text('登录'),
          backgroundColor: AppColors.gray_F3F3F3,
          leading: CupertinoButton(
            child: Text('取消', style: TextStyle(color: AppColors.black_666666)),
            padding: EdgeInsets.all(2.0),
            onPressed: (){
              Navigator.of(context).pop();
            },
          ),
          transitionBetweenRoutes: false,
        ),
        child: Center(
          child: CupertinoButton(
            color: AppColors.blue_0078FF,
            child: Text('注册', style: TextStyle(color: Colors.white)),
            onPressed: (){
              RouteManager.route(context, RouteConfig.RegisterRoute);
            },
          ),
        ),
      );
    }
}