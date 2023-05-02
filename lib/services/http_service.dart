import 'dart:io';

import 'package:dio/dio.dart';
import 'package:filledstacked_academy/app/app.logger.dart';
import 'package:filledstacked_academy/models/models.dart';

import 'environment_service.dart';

enum _HttpMethod { get, post, put, delete }

class HttpService {
  final log = getLogger('HttpService');

  late final Dio _httpClient;

  HttpService() {
    _httpClient = Dio(
      BaseOptions(
        receiveDataWhenStatusError: true,
        baseUrl: EnvironmentService.baseUrl,
      ),
    );
  }

  Future<List<Course>> getCourses() async {
    final response = await _makeHttpRequest(
      method: _HttpMethod.get,
      path: '9e7938e8-92d1-4a4b-9ee8-6a95d8b6fee3',
    );

    if (response.statusCode != 200) return [];

    return List<Course>.from(response.data.map((c) => Course.fromJson(c)));
  }

  Future<Course> getCourse({required String id}) async {
    final response = await _makeHttpRequest(
      method: _HttpMethod.get,
      path: '01706ed5-636d-4a7d-96cb-dccb3d3d2d9d',
      queryParameters: {
        'id': id,
      },
    );

    if (response.statusCode != 200) {
      return Future.error(Exception(response.statusMessage));
    }

    return Course.fromJson(response.data);
  }

  Future<Response> _makeHttpRequest({
    required _HttpMethod method,
    required String path,
    Map<String, dynamic> queryParameters = const {},
    Map<String, dynamic> body = const {},
    bool verbose = false,
    bool verboseResponse = false,
  }) async {
    try {
      final response = await _sendRequest(
        method: method,
        path: path,
        queryParameters: queryParameters,
        body: body,
      );

      final statusText = 'Status Code: ${response.statusCode}';
      final responseText = 'Response Data: ${response.data}';

      if (verbose) {
        log.v('$statusText${verboseResponse ? responseText : ''}');
      }

      return response;
    } on DioError catch (e) {
      if (e.type == DioErrorType.unknown && e.error is SocketException) {
        log.e(
          'This seems to be a network issue. Please check your network and try again.',
        );
        rethrow;
      }

      if (e.type == DioErrorType.connectionTimeout) {
        log.e(
          'This seems to be a network issue. Please check your network and try again.',
        );
        rethrow;
      }

      log.e(
        'A response error occurred. ${e.response?.statusCode}\nERROR: ${e.message}',
      );
      rethrow;
    } catch (e) {
      log.e('Request to $path failed. Error details: $e');
      rethrow;
    }
  }

  Future<Response> _sendRequest({
    required _HttpMethod method,
    required String path,
    Map<String, dynamic> queryParameters = const {},
    Map<String, dynamic> body = const {},
  }) async {
    Response response;

    switch (method) {
      case _HttpMethod.post:
        response = await _httpClient.post(
          path,
          queryParameters: queryParameters,
          data: body,
        );
        break;
      case _HttpMethod.put:
        response = await _httpClient.put(
          path,
          queryParameters: queryParameters,
          data: body,
        );
        break;
      case _HttpMethod.delete:
        response = await _httpClient.delete(
          path,
          queryParameters: queryParameters,
        );
        break;
      case _HttpMethod.get:
      default:
        response = await _httpClient.get(
          path,
          queryParameters: queryParameters,
        );
    }

    return response;
  }

  Future<void> addEmail(String email) async {
    await _makeHttpRequest(
      method: _HttpMethod.post,
      path:
          'https://us-central1-academy-c7fa3.cloudfunctions.net/users-api/uploadWidgetDescription',
      body: {'email': email},
    );
  }
}
