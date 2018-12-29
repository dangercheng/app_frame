import 'package:app_frame/common/app_colors.dart';
import 'package:app_frame/main/route_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

class MinePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MinePageState();
  }
}

class _MinePageState extends State<MinePage> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    
    return CupertinoPageScaffold(
      child: Center( 
        child: CupertinoButton(
          color: AppColors.blue_0078FF,
          child: Text('登录', style: TextStyle(color: Colors.white)),
          onPressed: (){
            RouteManager.route(context, RouteConfig.LoginRoute);
          },
        )
      ),
    );
  }
}
