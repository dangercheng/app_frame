import 'package:app_frame/common/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TabItemBar {
  TabItemBar({
    this.title, 
    this.titleNormalColor,
    this.titleSelectedColor,
    this.normalIcon,
    this.selectedIcon
  });
  String title;
  Color titleSelectedColor;
  Color titleNormalColor;
  Icon normalIcon;
  Icon selectedIcon;
}

class BottomNavWidget extends StatelessWidget {
  BottomNavWidget(
      {this.defaultSelectIndex = 0,
      this.tabItemBarList,
      this.tabItemBarDidSelect});
  final int defaultSelectIndex;
  final List<TabItemBar> tabItemBarList;
  final ValueChanged<int> tabItemBarDidSelect;

  @override
  Widget build(BuildContext context) {
    return CupertinoTabBar(
      currentIndex:defaultSelectIndex,
      iconSize: 40.0,
      items: _buildBarItemList(),
      onTap: (index) => tabItemBarDidSelect(index),
      backgroundColor: AppColors.gray_F3F3F3,
    );
  }

  List<BottomNavigationBarItem> _buildBarItemList() {
    List<BottomNavigationBarItem> barItemList = List();
    for (int i = 0; i < tabItemBarList.length; i++) {
      final tabBarItem = tabItemBarList[i];
      final barItem = BottomNavigationBarItem(
        icon: defaultSelectIndex == i ? tabBarItem.selectedIcon : tabBarItem.normalIcon,
        title: Text(
          tabBarItem.title, 
          style: TextStyle(
            fontSize: 12.0,
            color: defaultSelectIndex == i ? tabBarItem.titleSelectedColor : tabBarItem.titleNormalColor),
        ),
      );
      barItemList.add(barItem);
    }
    return barItemList;
  }
}
