import 'package:it_home/utils/static_name.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserDefault {
  static UserDefault instance = UserDefault._internal();
  factory UserDefault() => instance;

  UserDefault._internal();
  late SharedPreferences _prefs;

  init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  bool get isLogin => this.accessToken.isNotEmpty ? true : false;

  String get fcmToken {
    return _prefs.getString(FCM_TOKEN) ?? "";
  }

  set fcmToken(String value) {
    _prefs.setString(FCM_TOKEN, value);
  }

  String get accessToken => _prefs.getString(ACCESS_TOKEN) ?? "";
  set accessToken(String? value) {
    if (value != null) {
      _prefs.setString(ACCESS_TOKEN, value);
    }
  }

  set userName(String name) => _prefs.setString(USER_NAME, name);
  String get userName => _prefs.getString(USER_NAME) ?? "";

  
  logout() {
    _prefs.clear();
  }
}
