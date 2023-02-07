import 'package:get/get.dart';
import 'package:it_home/entity/news_model.dart';
import 'package:it_home/pages/NewsPage/NewsPageRepositoryImpl.dart';

class NewsPageController extends GetxController {
  NewsPageController({required this.repository});

  final NewsPageRepository repository;

  final _isLoading = true.obs;
  set isLoading(value) => this._isLoading.value = value;
  get isLoading => this._isLoading.value;

  final _dataList = <Loaction>[].obs;
  List<Loaction> get dataList => this._dataList.toList();

  @override
  void onInit() async {
    await fetchData();
    super.onInit();
  }

  fetchData() async {
    isLoading = true;
    final result = await repository.getNews();
    _dataList.assignAll(result.sublist(0, result.length ~/ 3));
    isLoading = false;
  }
}
