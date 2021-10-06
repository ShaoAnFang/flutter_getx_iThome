import 'package:it_home/entity/news_model.dart';
import 'package:it_home/network/api_service.dart';

abstract class NewsPageRepository {
  Future getNews();
}

class NewsPageRepositoryImpl implements NewsPageRepository {
  NewsPageRepositoryImpl();

  final apiService = ApiService();

  @override
  Future<News> getNews() async {
    return await apiService.getNews();
  }
}
