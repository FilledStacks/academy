import 'package:dio/dio.dart';

final dio = Dio();

class HttpService {
  Future<void> addEmail(String email) async {
    await dio.post(
      'https://us-central1-academy-c7fa3.cloudfunctions.net/users-api/uploadWidgetDescription',
      data: {
        'email': email,
      },
    );
  }
}
