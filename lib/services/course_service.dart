import 'package:filledstacks_academy/api/app_api.dart';
import 'package:filledstacks_academy/app/app.locator.dart';
import 'package:filledstacks_academy/app/app.logger.dart';
import 'package:filledstacks_academy/exceptions/resource_not_found.dart';
import 'package:filledstacks_academy/models/models.dart';

class CourseService {
  final log = getLogger('CourseService');
  final _api = locator<AppApi>();

  Future<List<Course>> getCourses() async {
    return await _api.getCourses();
  }

  Future<Course> getCourseForId(String id) async {
    try {
      return await _api.getCourse(id: id);
    } on StateError catch (_) {
      log.w('Course with id equal "$id" not found');
      throw ResourceNotFoundException(name: 'courses', id: id);
    } catch (e) {
      log.e(e.toString());
      rethrow;
    }
  }
}
