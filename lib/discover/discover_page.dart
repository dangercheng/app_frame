import 'package:app_frame/common/app_colors.dart';
import 'package:app_frame/main/route_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class DiscoverPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _DiscoverPageState();
  }
}

class _DiscoverPageState extends State<DiscoverPage> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('发现'),
        backgroundColor: AppColors.gray_F3F3F3,
      ),
      child: Center(
        child: Text('探索奇迹，发现未知。'),
      ),
    );
  }
}
