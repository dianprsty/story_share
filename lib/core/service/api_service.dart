import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../constant/strings.dart';

class ApiService {
  final Dio _dio =
      Dio(
          BaseOptions(
            baseUrl: baseUrl,
            connectTimeout: const Duration(seconds: 60),
            receiveTimeout: const Duration(seconds: 60),
          ),
        )
        ..transformer = BackgroundTransformer()
        ..options.validateStatus = (int? status) => true;

  ApiService() {
    if (kDebugMode) {
      final logger = PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 180,
      );
      _dio.interceptors.add(logger);
    }
  }

  Future<Response> fetchDataWithToken({required String url, required String token}) async {
    try {
      _dio.options.headers['Authorization'] = 'Bearer $token';
      final response = await _dio.get(url);
      return response;
    } catch (e) {
      throw Exception('Failed to fetch data');
    }
  }

  Future<Response> postData(String url, Map<String, dynamic> data) async {
    try {
      final response = await _dio.post(url, data: data);
      return response;
    } catch (e) {
      throw Exception('Failed to post data');
    }
  }

  Future<Response> putData(String url, Map<String, dynamic> data) async {
    try {
      final response = await _dio.put(url, data: data);
      return response;
    } catch (e) {
      throw Exception('Failed to put data');
    }
  }

  Future<Response> deleteData(String url) async {
    try {
      final response = await _dio.delete(url);
      return response;
    } catch (e) {
      throw Exception('Failed to delete data');
    }
  }

  Future<Response> uploadFile(String url, FormData formData) async {
    try {
      final response = await _dio.post(url, data: formData);
      return response;
    } catch (e) {
      throw Exception('Failed to upload file');
    }
  }
}


