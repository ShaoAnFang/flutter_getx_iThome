// import 'dart:convert';

// import 'package:dio/dio.dart';
// import 'package:smart_home_app/core/network/HttpUtil.dart';
// import 'package:smart_home_app/features/authentication/data/datasources/authentication_local_data_source.dart';
// import 'package:smart_home_app/features/authentication/data/models/account_model.dart';
// import 'package:smart_home_app/injection_container.dart';

// class RefreshTokenInterceptor extends Interceptor {
//   @override
//   Future onError(DioError err, ErrorInterceptorHandler handler) async {
//     if (err.response != null && err.response.statusCode == 401) {
//       Dio dio = HttpUtil().client;
//       dio.lock();
//       String token = await getToken();
//       dio.unlock();
//       var request = err.response.requestOptions;
//       request.headers["Authorization"] = token;

//       try {
//         var response = await dio.request(request.path,
//             data: request.data,
//             queryParameters: request.queryParameters,
//             options: Options(method: err.response.requestOptions.method),
//             //https://github.com/flutterchina/dio/issues/50
//         );
//         return response;
//       } on DioError catch (e) {
//         return e;
//       }
//     }
//     super.onError(err, handler);
//   }

//   Future<String> getToken() async {
//     Dio dio = Dio();
//     dio.options.baseUrl = SIXSTAR_BASEURL;
//     try {
//       AccountModel account = await sl<AuthenticationLocalDataSource>().getAccount();
//       var response = await dio.post('/api/authentication', data: account.toJson());
//       String employeeId = response.data['data'][0]['employeeId'];
//       String accessToken = response.data['data'][0]['accessToken'];
//       String token = "Bearer " + base64Encode(utf8.encode('$employeeId:$accessToken'));
//       return token;
//     } on DioError catch (e) {
//       throw e;
//     }
//   }
// }