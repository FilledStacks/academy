import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:filledstacked_academy/app/app.logger.dart';
import 'package:filledstacked_academy/models/models.dart';
import 'package:filledstacked_academy/services/environment_service.dart';

import 'app_api.dart';

enum _HttpMethod { get, post, put, delete }

/// An implementation of the [AppApi] that talks to the real Academy backend
class AcademyApi implements AppApi {
  final log = getLogger('AcademyApi');

  late final Dio _httpClient;

  AcademyApi() {
    _httpClient = Dio(
      BaseOptions(
        receiveDataWhenStatusError: true,
        baseUrl: EnvironmentService.baseUrl,
      ),
    );
  }

  @override
  Future<List<Course>> getCourses() async {
    final response = await _makeHttpRequest(
      method: _HttpMethod.get,
      path: '9e7938e8-92d1-4a4b-9ee8-6a95d8b6fee3',
    );

    if (response.statusCode != 200) return [];

    return List<Course>.from(response.data.map((c) => Course.fromJson(c)));
  }

  @override
  Future<Course> getCourse({required String id}) async {
    final response = await _makeHttpRequest(
      method: _HttpMethod.get,
      path: '01706ed5-636d-4a7d-96cb-dccb3d3d2d9d',
      queryParameteres: {
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
    Map<String, dynamic> queryParameteres = const {},
    Map<String, dynamic> body = const {},
    bool verbose = false,
    bool verboseResponse = false,
  }) async {
    Response response;

    try {
      switch (method) {
        case _HttpMethod.post:
          response = await _httpClient.post(
            path,
            queryParameters: queryParameteres,
            data: body,
          );
          break;
        case _HttpMethod.put:
          response = await _httpClient.put(
            path,
            queryParameters: queryParameteres,
            data: body,
          );
          break;
        case _HttpMethod.delete:
          response = await _httpClient.delete(
            path,
            queryParameters: queryParameteres,
          );
          break;
        case _HttpMethod.get:
        default:
          response = await _httpClient.get(
            path,
            queryParameters: queryParameteres,
          );
      }
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
        'A response error occurred. ${e.response?.statusCode}\nERROR: ${e.response?.data}',
      );
      rethrow;
    } catch (e) {
      log.e('Request to $path failed. Error details: $e');
      rethrow;
    }

    final statusText = 'Status Code: ${response.statusCode}';
    final responseText = 'Response Data: ${response.data}';

    if (verbose) {
      log.v('$statusText${verboseResponse ? responseText : ''}');
    }

    return response;
  }
}
