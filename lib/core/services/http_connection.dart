import 'package:dio/dio.dart';
import 'package:dio/dio.dart' as doi;
import 'package:get/get.dart';
import 'package:whatsapp/core/constant/constant.dart';
import 'package:whatsapp/core/models/api_response_model.dart';
import 'package:whatsapp/core/utils/dialog_util.dart';
import 'package:whatsapp/core/utils/storage_util.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

abstract class HttpConnection {
  // dio init
  Dio _dio() {
    final options = BaseOptions(
      receiveTimeout: 3000,
      connectTimeout: 19000,
      sendTimeout: 10000,
      baseUrl: baseURL + 'v1',
      contentType: "application/json",

      //! this is important so error code below 500 will not get thrown
      // such as validation error
      validateStatus: (status) {
        return status < 499;
      },
    );
    var dio = Dio(options);

    dio.interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: false,
      error: true,
      compact: true,
    ));

    return dio;
  }

  Dio get dio => _dio();
  StorageUtils storageUtils = Get.find();

  var headers = {
    'Accept': 'application/json',
  };

  //if pure == true, it will return data without parse it to ApiResponseModel
  Future post(
    String url, {
    Map<String, String> params,
    dynamic data,
    bool needsToken = true,
    bool pure = false,
    bool bypassError = false,
  }) async {
    if (needsToken) {
      headers['Authorization'] = "Bearer ${storageUtils.token}";
    }
    try {
      doi.Response resp = await dio.post(url, data: data, queryParameters: params, options: Options(headers: headers));
      if (resp.statusCode != null) {
        if (pure) return resp;
        if (resp.data != null) {
          return ApiResponseModel.fromJson(resp.data);
        }
      }
    } catch (e) {
      // so error will not thrown
      if (bypassError) {
        if (DialogUtils.isLoadingOpen) DialogUtils.closeDialog();
        DialogUtils.showWarning('Koneksi Internet Bermasalah, silahkan periksa dan coba lagi');
      }
      return null;
    }
  }

  //if pure == true, it will return data without parse it to ApiResponseModel
  Future get(String url, {Map<String, String> params, bool needsToken = true, bool pure = false}) async {
    if (needsToken) {
      headers['Authorization'] = "Bearer ${storageUtils.token}";
    }
    try {
      doi.Response resp = await dio.get(url, queryParameters: params, options: Options(headers: headers));
      if (resp.statusCode != null) {
        if (pure) return resp;
        if (resp.data != null) {
          return ApiResponseModel.fromJson(resp.data);
        }
      }
    } catch (e) {
      if (DialogUtils.isLoadingOpen) DialogUtils.closeDialog();
      DialogUtils.showWarning('Internet connection problem, please check and try again');
      return null;
    }
  }
}