import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:filledstacked_academy/app/app.locator.dart';
import 'package:filledstacked_academy/app/app.logger.dart';
import 'package:filledstacked_academy/models/api_response/api_response.dart';
import 'package:filledstacked_academy/models/models.dart';
import 'package:filledstacked_academy/services/user_service.dart';

import 'app_api.dart';

const String kApiEndpoint = '';
const int kDefaultRetryTimes = 2;
const bool kUseEmulator = true;

enum _HttpMethod {
  get,
  post,
  put,
  delete,
}

/// An implementation of the [AppApi] that talks to the real Academy backend
class AcademyApi implements AppApi {
  final log = getLogger('AcademyApi');

  final _userService = locator<UserService>();

  late final Dio _httpClient;

  AcademyApi() {
    _httpClient = Dio(
      BaseOptions(
        receiveDataWhenStatusError: true,
        baseUrl: kUseEmulator ? 'http://localhost' : kApiEndpoint,
      ),
    );
  }

  @override
  Future<List<Course>> getCourses() async {
    final response = await _makeHttpRequest<Course>(
      method: _HttpMethod.get,
      path: kUseEmulator ? ':5000' : 'v1_host-payment_method',
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
      path: kUseEmulator ? ':5000' : 'v1',
      queryParameteres: {
        'id': id,
      },
    );

    if (response.hasErrors) {
      return Future.error(Exception(response.errors.join(',')));
    }

    return response.data.first;
  }

  Future<Map<String, dynamic>> _getHeaders() async {
    try {
      final hasUser = _userService.hasUser;
      return {
        // if (hasUser) 'authorization': 'Bearer $kVimeoToken',
      };
    } catch (error) {
      log.e(error);
      return {};
    }
  }

  Future<ApiResponse<T>> _makeHttpRequest<T>({
    required _HttpMethod method,
    required String path,
    Map<String, dynamic> queryParameteres = const {},
    Map<String, dynamic> body = const {},
    bool verbose = false,
    bool verboseResponse = false,
    int maxRetryTimes = kDefaultRetryTimes,
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
    final requestOptions = Options(
      headers: await _getHeaders(),
      // We don't throw exceptions for anything under 500
      // we need to handle it
      validateStatus: (status) =>
          (status ?? 500) < 500 || (status ?? 500) == 505,
    );

    try {
      switch (method) {
        case _HttpMethod.post:
          response = await _httpClient.post(
            path,
            queryParameters: queryParameteres,
            data: body,
            options: requestOptions,
          );
          break;
        case _HttpMethod.put:
          response = await _httpClient.put(
            path,
            queryParameters: queryParameteres,
            data: body,
            options: requestOptions,
          );
          break;
        case _HttpMethod.delete:
          response = await _httpClient.delete(
            path,
            queryParameters: queryParameteres,
            options: requestOptions,
          );
          break;
        case _HttpMethod.get:
        default:
          response = await _httpClient.get(
            path,
            queryParameters: queryParameteres,
            options: requestOptions,
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
