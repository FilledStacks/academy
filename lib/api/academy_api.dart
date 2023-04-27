import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:filledstacked_academy/app/app.locator.dart';
import 'package:filledstacked_academy/app/app.logger.dart';
import 'package:filledstacked_academy/models/api_response/api_response.dart';
import 'package:filledstacked_academy/models/models.dart';
import 'package:filledstacked_academy/services/environment_service.dart';

import 'app_api.dart';

enum _HttpMethod {
  get,
  post,
  put,
  delete,
}

/// An implementation of the [AppApi] that talks to the real Academy backend
class AcademyApi implements AppApi {
  final log = getLogger('AcademyApi');
  final _environmentService = locator<EnvironmentService>();

  late final Dio _httpClient;

  AcademyApi() {
    _httpClient = Dio(
      BaseOptions(
        receiveDataWhenStatusError: true,
        baseUrl: _environmentService.baseUrl,
      ),
    );
  }

  @override
  Future<List<Course>> getCourses() async {
    final response = await _makeHttpRequest<Course>(
      method: _HttpMethod.get,
      path: '4fc35623-1a19-4042-8333-1282724485f4',
      queryParameteres: {
        'mocky-delay': '1s',
      },
    );

    if (response.hasErrors) {
      return Future.error(Exception(response.errors.join(',')));
    }

    return response.data;
  }

  @override
  Future<Course> getCourse({required String id}) async {
    final response = await _makeHttpRequest<Course>(
      method: _HttpMethod.get,
      path: 'a8bdae3c-fdae-4541-9c63-2521e0a1a266',
      queryParameteres: {
        'id': id,
        'mocky-delay': '1s',
      },
    );

    if (response.hasErrors) {
      return Future.error(Exception(response.errors.join(',')));
    }

    return response.data.first;
  }

  Future<ApiResponse<T>> _makeHttpRequest<T>({
    required _HttpMethod method,
    required String path,
    Map<String, dynamic> queryParameteres = const {},
    Map<String, dynamic> body = const {},
    bool verbose = false,
    bool verboseResponse = false,
    int maxRetryTimes = 2,
  }) async {
    Future<ApiResponse<T>> _retryHttpRequest<T>() async {
      if (maxRetryTimes == 0) {}

      maxRetryTimes--;
      return _makeHttpRequest(
        method: method,
        path: path,
        queryParameteres: queryParameteres,
        body: body,
        verbose: verbose,
        verboseResponse: verboseResponse,
        maxRetryTimes: maxRetryTimes,
      );
    }

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
        return ApiResponse(errors: [
          'This seems to be a network issue. Please check your network and try again.'
        ]);
      }

      if (e.type == DioErrorType.connectionTimeout) {
        return ApiResponse(errors: [
          'This seems to be a network issue. Please check your network and try again.'
        ]);
      }

      log.e(
        'A response error occurred. ${e.response?.statusCode}\nERROR: ${e.response?.data}',
      );
      return ApiResponse(errors: [
        'Our service is not responding. Please contact support with this message. ${e.response?.statusCode}-${e.response?.data}'
      ]);
    } catch (e) {
      log.e('Request to $path failed. Error details: $e');
      return ApiResponse(
        errors: ['The server didn\'t respond with anything. Check the logs'],
      );
    }

    ApiResponse<T> apiResponse;

    if (verbose) {
      log.v('Status Code: ${response.statusCode}');
    }

    switch (response.statusCode) {
      case 400:
      case 404:
        apiResponse = ApiResponse.fromJson(response.data);
        break;
      case 204:
        apiResponse = ApiResponse();
        break;
      case 200:
      default:
        if (verboseResponse) {
          log.v('Response Data: ${response.data}');
        }

        apiResponse = ApiResponse<T>.fromJson(response.data);
    }

    return apiResponse;
  }
}
