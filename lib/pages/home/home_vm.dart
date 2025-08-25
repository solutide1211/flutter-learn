import 'package:code01/datas/home_banner_data.dart';
import 'package:dio/dio.dart';

class HomeViewModel {

  static Future<List<BannerItemData>?> getBanner() async {
    Dio dio = Dio();
    dio.options = BaseOptions(baseUrl: 'https://www.wanandroid.com',
        connectTimeout: Duration(seconds: 30),receiveTimeout: Duration(seconds: 30),
      sendTimeout: Duration(seconds: 30),
    );
    Response res = await dio.get('/banner/json');
    HomeBannerData bannerData = HomeBannerData.fromJson(res.data);
    return bannerData.data;
  }
}