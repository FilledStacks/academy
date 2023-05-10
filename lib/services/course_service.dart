import 'package:filledstacked_academy/app/app.locator.dart';
import 'package:filledstacked_academy/app/app.logger.dart';
import 'package:filledstacked_academy/exceptions/resource_not_found.dart';
import 'package:filledstacked_academy/models/models.dart';

import 'http_service.dart';

class CourseService {
  final log = getLogger('CourseService');
  final _httpService = locator<HttpService>();

  Future<Course> getCourseForId(String id) async {
    try {
      return await _httpService.getCourse(id: id);
    } on StateError catch (_) {
      log.w('Course with id equal "$id" not found');
      throw ResourceNotFoundException(name: 'courses', id: id);
    } catch (e) {
      log.e(e.toString());
      rethrow;
    }
  }
}
