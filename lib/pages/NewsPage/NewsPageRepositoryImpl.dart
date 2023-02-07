import 'package:it_home/entity/news_model.dart';
import 'package:it_home/network/api_service.dart';

abstract class NewsPageRepository {
  Future<List<Loaction>> getNews();
}

class NewsPageRepositoryImpl implements NewsPageRepository {
  NewsPageRepositoryImpl();

  final apiService = ApiService();

  @override
  Future<List<Loaction>> getNews() async {
    return await apiService.getNews();
  }
}
