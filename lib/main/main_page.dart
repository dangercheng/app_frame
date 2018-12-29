import 'package:flutter/material.dart';
import 'bottom_nav_widget.dart';
import 'package:app_frame/common/app_colors.dart';
import 'package:app_frame/common/app_icons.dart';
import 'package:app_frame/mine/mine_page.dart';
import 'package:app_frame/discover/discover_page.dart';
import 'package:app_frame/movie/movie_list_page.dart';

class MainPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int selectIndex = 0;
  final List<TabItemBar> tabItemBarList = [
    TabItemBar(
      title: '电影',
      titleNormalColor: AppColors.black_666666,
      titleSelectedColor: AppColors.green_85D761,
      normalIcon: Icon(
        AppIcons.movie,
        size: 30.0,
        color: AppColors.black_666666,
      ),
      selectedIcon: Icon(
        AppIcons.movie, 
        size: 30.0,
        color: AppColors.green_85D761),
    ),
    TabItemBar(
      title: '发现',
      titleNormalColor: AppColors.black_666666,
      titleSelectedColor: AppColors.green_85D761,
      normalIcon: Icon(
        AppIcons.discover,
        size: 30.0,
        color: AppColors.black_666666,
      ),
      selectedIcon: Icon(
        AppIcons.discover,
        size: 30.0,
        color: AppColors.green_85D761),
    ),
    TabItemBar(
      title: '我的',
      titleNormalColor: AppColors.black_666666,
      titleSelectedColor: AppColors.green_85D761,
      normalIcon: Icon(
        AppIcons.user,
        size: 30.0,
        color: AppColors.black_666666,
      ),
      selectedIcon: Icon(
        AppIcons.user, 
        size: 30.0,
        color: AppColors.green_85D761),
    ),
  ];
  final List<Widget> tabPageList = [
    MoviveListPage(),
    DiscoverPage(),
    MinePage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: _buildStackChildren(),
      ),
      bottomNavigationBar: BottomNavWidget(
        defaultSelectIndex: selectIndex,
        tabItemBarList: tabItemBarList,
        tabItemBarDidSelect: _bottomNavDidSelect,
      ),
    );
  }

  List<Widget> _buildStackChildren() {
    var children = <Widget>[];
    for (int i = 0; i < tabItemBarList.length; i++) {
      children.add(Offstage(
        offstage: selectIndex != i,
        child: tabPageList[i],
      ));
    }
    return children;
  }

  void _bottomNavDidSelect(int index) {
    if(selectIndex == index) {
      return;
    }
    setState(() {
      this.selectIndex = index;
    });
  }
}
