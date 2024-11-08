import 'package:dio/dio.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class ApiClient {
  late final Dio dio;

  ApiClient() {
    dio = Dio(BaseOptions(
      baseUrl: 'https://672dded4fd89797156440cf0.mockapi.io/todo-task/v1/',
      receiveDataWhenStatusError: true,
      connectTimeout: const Duration(seconds: 3),
      receiveTimeout: const Duration(seconds: 3),
      headers: {'Content-Type': 'application/json'},
    ));

    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        // Xử lý trước khi gửi request
        print('Request [${options.method}] => PATH: ${options.path}');
        EasyLoading.show();
        return handler.next(options);
      },
      onResponse: (response, handler) {
        // Xử lý khi nhận được response
        EasyLoading.dismiss();
        print('Response [${response.statusCode}] => DATA: ${response.data}');
        return handler.next(response);
      },
      onError: (error, handler) {
        // Xử lý khi có lỗi
        EasyLoading.dismiss();
        print('Error: ${error.message}');
        return handler.next(error);
      },
    ));
  }

  Future<Response> post(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    var result = await dio.post(
      path,
      data: data,
      queryParameters: queryParameters,
      options: Options(
        followRedirects: false,
        validateStatus: (status) {
          return (status ?? 0) < 1500;
        },
      ),
    );

    return result;
  }

  Future<Response> put(
    String path, {
    Object? data,
  }) async {
    var result = await dio.put(
      path,
      data: data,
      options: Options(
        followRedirects: false,
        validateStatus: (status) {
          return (status ?? 0) < 1500;
        },
      ),
    );

    return result;
  }

  Future<Response> get(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    var result = await dio.get(
      path,
      queryParameters: queryParameters,
      options: Options(
        followRedirects: false,
        validateStatus: (status) {
          return (status ?? 0) < 1500;
        },
      ),
    );

    return result;
  }

  Future<Response> delete(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    var result = await dio.delete(
      path,
      queryParameters: queryParameters,
      options: Options(
        followRedirects: false,
        validateStatus: (status) {
          return (status ?? 0) < 1500;
        },
      ),
    );

    return result;
  }
}
