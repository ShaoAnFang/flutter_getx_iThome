import 'package:get/get.dart';
import 'package:it_home/entity/news_model.dart';
import 'package:it_home/network/api_service.dart';

class NewsPageController extends GetxController {
  final _isLoading = true.obs;
  set isLoading(value) => this._isLoading.value = value;
  get isLoading => this._isLoading.value;

  final _dataList = <Articles>[].obs;
  get dataList => this._dataList.toList();
  // final _dataList = <ProjectData>[].obs;

  @override
  void onInit() async {
    await fetchData();
    super.onInit();
  }

  fetchData() async {
    isLoading = true;
    final newsResult = await ApiService().getNews();
    _dataList.assignAll(newsResult.articles);
    isLoading = false;

  }
}
