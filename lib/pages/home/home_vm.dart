import 'package:code01/datas/home_banner_data.dart';
import 'package:code01/datas/home_list_data.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class HomeViewModel with ChangeNotifier{

  List<BannerItemData>? bannerList = [];
  List<HomeItemData>? homeArticleList = [];
  Dio dio = Dio();
  void initDio(){
    dio.options = BaseOptions(baseUrl: 'https://www.wanandroid.com',
      connectTimeout: Duration(seconds: 30),receiveTimeout: Duration(seconds: 30),
      sendTimeout: Duration(seconds: 30),
    );
  }

  Future getBanner() async {
    Response res = await dio.get('/banner/json');
    HomeBannerData bannerData = HomeBannerData.fromJson(res.data);
    bannerList = bannerData.data;
    print(bannerList.toString());
    notifyListeners();
  }

// 获取文章列表
  Future getArticle() async {
    Response response = await dio.get('/article/list/1/json');
    HomeData homeData = HomeData.fromJson(response.data);
    homeArticleList = homeData.data?.datas ?? [];
    print(homeArticleList.toString());
    notifyListeners();
  }
}