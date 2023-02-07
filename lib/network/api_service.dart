import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:it_home/entity/news_model.dart';
import 'HttpUtil.dart';

class ApiService {
  Future<List<Loaction>> getNews() async {
    var response = await HttpUtil().get('/qn5566/travel/main/all_data.json');
    if (response is DioError) {
      print(response.response!.statusCode);
      return <Loaction>[];
    }
    final data = json.decode(response.data);

    return List<Loaction>.from(data.map((e) => Loaction.fromJson(e)));
  }
}
