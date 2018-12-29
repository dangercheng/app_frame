import 'package:app_frame/common/app_colors.dart';
import 'package:flutter/cupertino.dart';

class RegisterPage extends StatefulWidget {
  @override
    State<StatefulWidget> createState() => RegisterPageState();
}

class RegisterPageState extends State<RegisterPage> {
  @override
    Widget build(BuildContext context) {
      return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: Text('注册'),
          backgroundColor: AppColors.gray_F3F3F3,
          transitionBetweenRoutes: false,
          actionsForegroundColor: AppColors.black_666666,
        ),
        child: Center(
          child: Text('一键注册，畅通无阻'),
        ),
      );
    }
}