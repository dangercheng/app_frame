import 'package:app_frame/common/app_colors.dart';
import 'package:app_frame/main/route_manager.dart';
import 'package:app_frame/movie/model/recommend_movie.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:app_frame/common/app_networking.dart';
import 'package:cached_network_image/cached_network_image.dart';

class MoviveListPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MoviveListPageState();
  }
}

class _MoviveListPageState extends State<MoviveListPage> {
  var _movieFuture;
  RecommendMovie _recommendMovie;
  @override
  void initState() {
    super.initState();
    _movieFuture = _loadRecommendMovies();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('热门电影'),
        backgroundColor: AppColors.gray_F3F3F3,
        actionsForegroundColor: AppColors.black_666666,
        transitionBetweenRoutes: false,
      ),
      child: Container(
        color: AppColors.gray_F3F3F3,
        child: FutureBuilder(
          builder: _movieBuildFuture,
          future: _movieFuture,
        ),
      ),
    );
  }

  Widget _movieBuildFuture(BuildContext context, AsyncSnapshot snapshot) {
    switch (snapshot.connectionState) {
      case ConnectionState.waiting:
        return Center(
          child: CircularProgressIndicator(),
        );
      case ConnectionState.done:
        if(snapshot.hasError) {
          return Center(
            child: Text('请求错误，请稍后重试'),
          );
        } else if(snapshot.hasData) {
          _recommendMovie = snapshot.data as RecommendMovie;
          return _buildListView(context);
        } else {
          return Center(
            child: Text('暂无推荐电影'),
          );
        }
        break;
      default:
        return Container();
    }
  }

  Future _loadRecommendMovies() async {
    return AppNetworking.instance.getRecommendMovie();
  }

  Widget _buildListView(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.all(0),
      itemCount: _recommendMovie.subjects.length,
      itemBuilder: _buildListItem,
      primary: true,
    );
  }
  
  Widget _buildListItem(BuildContext context, int index) {
    return GestureDetector(
      onTap: () {
        RouteManager.route(context, RouteConfig.MovieDetailRoute, params: {'movie_name': _recommendMovie.subjects[index].title});
      },
      child: Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: 80.0,
                  width: 80.0,
                  child: Container(
                    color: AppColors.gray_F3F3F3,
                    child: CachedNetworkImage(
                      imageUrl: _recommendMovie.subjects[index].images.small,
                      errorWidget: new Icon(Icons.error),
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.only(left: 15.0),
                        child: Text(
                          _recommendMovie.subjects[index].title, 
                          style: TextStyle(
                            fontSize: 14.0, 
                            color: AppColors.black_333333,
                            decoration: TextDecoration.none,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            SizedBox(
              height: 8.0,
              child: Container(
                color: AppColors.gray_F3F3F3,
              ),
            ),
          ],
        ),
      ),
    ); 
  }
}
