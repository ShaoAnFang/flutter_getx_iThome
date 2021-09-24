import 'package:dio/dio.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:it_home/component/TextToast.dart';
import 'package:it_home/entity/news_model.dart';
import 'HttpUtil.dart';

class ApiService {
  // final HttpUtil http;
  // ApiService({required this.http});

  callToast({String contentString = ""}) {
    TextToast.show("please_try_again".tr);
  }

  Future<News> getNews() async {
    var response = await HttpUtil().get(
        '/everything?q=tesla&from=2021-09-15&sortBy=publishedAt&apiKey=989e07f02f47475daa7020cb0498af8e');
    if (response is DioError) {
      print(response.response!.statusCode);
      return News();
    }

    return News.fromJson(response.data);
  }

  Future postLogin(String account, String password) async {
    // final loginParams = {
    //   "UserNameOrEmailAddress": account,
    //   "Password": password,
    //   "RememberMe": true,
    //   "FcmToken": UserDefault().fcmToken,
    // };
    // final response = await http.post('/ids/api/Account/login-with-captcha',
    //     params: loginParams);
    // if (response is DioError) {
    //   print("Login error");
    //   callToast();
    //   print(response);
    //   return null;
    // } else {
    //   final login = Login.fromJson(response.data);
    //   if (login.accessToken != "") {
    //     UserDefault().accessToken = login.accessToken;
    //     UserDefault().refreshToken = login.refreshToken;
    //     AuthManager().setLoginData(account, password);
    //   }
    //   return Login.fromJson(response.data);
    // }
  }

  Future<bool> sendRestPasswordEmail(String account) async {
    final params = {
      "email": account,
      "appName": "SmartHome_App",
    };
    final response = await HttpUtil()
        .post('/api/api/account/send-password-reset-code', params: params);
    if (response is DioError) callToast();
    //statusCode = 204, 沒有回傳值 代表成功;
    return response.statusCode == 204 ? true : false;
  }

  Future getUserProfile() async {
    // final response = await http.get('/api/api/account/my-profile');
    // if (response is DioError) {
    //   print(response.response?.statusCode);
    //   return UserProfile();
    // }
    // final userProfile = UserProfile.fromJson(response.data);
    // if (userProfile.profileKey != null)
    //   UserDefault().profileKey = userProfile.profileKey!;
    // if (userProfile.id != "") UserDefault().userID = userProfile.id;
    // return userProfile;
  }
}
