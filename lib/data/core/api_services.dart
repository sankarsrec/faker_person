import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:dio/dio.dart' as dio;

import '../../domain/entities/error_entity.dart';
import '../../utils/exceptions/app_exceptions.dart';
import '../models/server_response_model.dart';
import 'api_constants.dart';

class ApiServices {
  static final BaseOptions _options = BaseOptions(
    baseUrl: ApiConstants.baseURL,
  );

  static dynamic get(
    String path, {
    Map<String, dynamic>? queryParameters,
    bool hideError = false,
  }) async {
    _options.headers = await getHeader();
    final dio = Dio(_options);
    try {
      bool isConnected = await checkInternetConnection();
      if (isConnected) {
        final response = await dio.get(
          getPath(path, queryParameters),
        );

        if (response.statusCode == 200 || response.statusCode == 201) {
          return response.data;
        } else {
          return ServerResponseModel.fromJson(response.data);
        }
      } else {
        return const ServerResponseModel(
          success: false,
          message: '',
        );
      }
    } catch (exception) {
      return ServerResponseModel(
        success: false,
        message: hideError ? '' : AppExceptions.handleException(exception),
      );
    }
  }

  static dynamic post(
    String path, {
    dynamic params,
    dio.FormData? formData,
    Map<String, dynamic>? queryParameters,
  }) async {
    _options.headers = await getHeader();
    final dio = Dio(_options);
    try {
      bool isConnected = await checkInternetConnection();
      if (isConnected) {
        final response = await dio.post(
          path,
          data: formData ?? jsonEncode(params ?? {}),
          queryParameters: queryParameters,
        );

        if (response.statusCode == 200 || response.statusCode == 201) {
          return response.data;
        } else {
          return ServerResponseModel.fromJson(response.data);
        }
      } else {
        return const ServerResponseModel(
          success: false,
          message: '',
        );
      }
    } catch (exception) {
      return ServerResponseModel(
        success: false,
        message: AppExceptions.handleException(exception),
      );
    }
  }

  static dynamic put(
    String path, {
    Map<String, dynamic>? params,
    Map<String, dynamic>? queryParameters,
  }) async {
    _options.headers = await getHeader();
    final dio = Dio(_options);
    try {
      bool isConnected = await checkInternetConnection();
      if (isConnected) {
        final response = await dio.put(
          getPath(path, queryParameters),
          data: jsonEncode(params ?? {}),
        );

        if (response.statusCode == 200 || response.statusCode == 201) {
          return response.data;
        } else {
          return ServerResponseModel.fromJson(response.data);
        }
      } else {
        return const ServerResponseModel(
          success: false,
          message: '',
        );
      }
    } catch (exception) {
      return ServerResponseModel(
        success: false,
        message: AppExceptions.handleException(exception),
      );
    }
  }

  static Future<Map<String, dynamic>> getHeader() async {
    Map<String, String> header = <String, String>{};
    String authToken = await getAuthToken();
    if (authToken.isNotEmpty) {
      header.putIfAbsent(ApiConstants.authorization, () => authToken);
    }
    return header;
  }

  static String getPath(String path, Map<dynamic, dynamic>? params) {
    String paramsString = '';
    if (params?.isNotEmpty ?? false) {
      int count = 0;
      params?.forEach((key, value) {
        if (count == 0) {
          paramsString = '$key=$value';
        } else {
          paramsString += '&$key=$value';
        }
        count++;
      });
    }
    return '${ApiConstants.baseURL}$path?$paramsString';
  }

  static Future<String> getAuthToken() async {
    String authToken = '';
    return authToken;
  }

  static Future<bool> checkInternetConnection() async {
    bool isConnected = false;
    try {
      ConnectivityResult connectivityResult =
          await Connectivity().checkConnectivity();
      if (connectivityResult == ConnectivityResult.mobile) {
        isConnected = true;
      } else if (connectivityResult == ConnectivityResult.wifi) {
        isConnected = true;
      } else if (connectivityResult == ConnectivityResult.ethernet) {
        isConnected = true;
      } else if (connectivityResult == ConnectivityResult.vpn) {
        isConnected = true;
      } else if (connectivityResult == ConnectivityResult.other) {
        isConnected = true;
      } else {
        isConnected = false;
      }
    } catch (exception) {
      isConnected = false;
    }
    if (!isConnected) {
      AppExceptions.throwError(
        errorEntity: const ErrorEntity(
          appErrorType: AppErrorType.network,
        ),
      );
    }
    return isConnected;
  }
}
