import 'package:dio/dio.dart';
import 'package:it_home/entity/news_model.dart';
import 'HttpUtil.dart';

class ApiService {
  Future<News> getNews() async {
    var response = await HttpUtil().get(
        '/everything?q=tesla&from=2021-10-05&sortBy=publishedAt&apiKey=989e07f02f47475daa7020cb0498af8e');
    if (response is DioError) {
      print(response.response!.statusCode);
      return News();
    }
    return News.fromJson(response.data);
  }
}
