import 'dart:async';
import 'package:app_frame/movie/model/recommend_movie.dart';
import 'app_http.dart';

class AppNetworking {
  static AppNetworking _instance;
  factory AppNetworking() => _getInstance();
  static AppNetworking get instance => _getInstance();
  AppNetworking._internal();
  static AppNetworking _getInstance() {
    if(_instance == null) {
      _instance = AppNetworking._internal();
    }
    return _instance;
  }

  Future getRecommendMovie() async {
    Completer completer = Completer();
    AppHttp.instance.get(
    AppNetWorkingConfig.recommendMoviePath, 
    data: {'count': 50},
    ).then((dynamic data){
      var recommendMovie = RecommendMovie.fromJson(data);
      completer.complete(recommendMovie);
    }, onError: (error){
      completer.completeError(error);
    });

    return completer.future;
  }
}

class AppNetWorkingConfig {
  static String recommendMoviePath = '/v2/movie/top250';
}