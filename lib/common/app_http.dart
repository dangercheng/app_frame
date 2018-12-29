import 'dart:async';

import 'package:app_frame/common/app_toast.dart';
import 'package:dio/dio.dart';

class AppHttp {
  static AppHttp _instance;
  static AppHttp get instance => _getInstance();
  factory AppHttp() => _getInstance();
  
  Dio dio;

  static AppHttp _getInstance() {
    if(_instance == null) {
      _instance = AppHttp._internal();
    }
    return _instance;
  }
  
  AppHttp._internal() {
    var options = Options(
      baseUrl: 'http://api.douban.com',
      connectTimeout: 200000,
      receiveTimeout: 3000,
      headers: {},
    );
    dio = new Dio(options);
  }

  Future get(
    String path,
   {Map data,
    CancelToken cancelToken,
    }) async {
    Completer completer = Completer();
    try {
      Response response = await dio.get(
        path,
        data: data,
        cancelToken: cancelToken
      );
      completer.complete(response.data);
    } on DioError catch (err) {
      if(CancelToken.isCancel(err)) {
        print('Request canceled ! ' + err.message);
      } else if(err.type == DioErrorType.CONNECT_TIMEOUT || err.type == DioErrorType.RECEIVE_TIMEOUT) {
        AppToast.showToast('请求超时，请稍后重试！');
        completer.completeError(err);
      } else {
        AppToast.showToast('请求失败，请检查网络链接！');
        completer.completeError(err);
      }
    }
    return completer.future;
  }

}
