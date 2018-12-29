import 'dart:core';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:app_frame/discover/discover_page.dart';
import 'package:app_frame/movie/movie_detail_page.dart';
import 'package:app_frame/mine/mine_page.dart';
import 'package:app_frame/login_register/login_page.dart';
import 'package:app_frame/movie/movie_list_page.dart';
import 'package:app_frame/login_register/register_page.dart';

class RouteManager {
  static Route<dynamic> mapRouteWithSettings(RouteSettings settings) {
    final uri = Uri.parse(settings.name);
    final routeName = uri.pathSegments[0];
    final routeParams = uri.queryParameters;
    Route<dynamic> route;
    switch (routeName) {
      case 'movie_list':
        route = _routeWithPage(settings, MoviveListPage());
        break;
      case 'discover':
        route = _routeWithPage(settings, DiscoverPage());
        break;
      case 'mine':
        route = _routeWithPage(settings, MinePage());
        break;
      case 'login':
        route = _routeWithPage(settings, LoginPage(), routeName: routeName);
        break;
      case 'movie_detail':
        route = _routeWithPage(settings, MovieDetailPage(movieName: routeParams['movie_name'],));
        break;
      case 'register':
        route = _routeWithPage(settings, RegisterPage());
        break;
      default:
        return null;
    }
    return route;
  }

  static Future<dynamic> route(BuildContext context, String url, {Map<String, String> params}) {
    if (params != null) {
      url += '?';
      for (var key in params.keys) {
        var value = params[key];
        if (value != null)
        url += '$key=$value';
      }
    }
    final uri = Uri.parse(url);
    // final path = uri.pathSegments[0];
    switch (uri.host) {
      case 'page':
        {
          return Navigator.of(context).pushNamed(url);
        }
      break;
      case 'dialog':
        return null;
      break;
      default:
        return null;
    }
  }

  static Route<dynamic> _routeWithPage(RouteSettings settings, Widget page, {String routeName}) {
    return CupertinoPageRoute(
      settings: settings, 
      builder: (_) => page,
      fullscreenDialog: routeName == 'login',
    );
  }
}

abstract class RouteConfig {
  static const String MovieListRoute = "myapp://page/movie_list";
  static const String MovieDetailRoute = "myapp://page/movie_detail";
  static const String DisCoverRoute = "myapp://page/discover";
  static const String MineRoute = "myapp://page/mine";
  static const String LoginRoute = "myapp://page/login";
  static const String RegisterRoute = "myapp://page/register";
}