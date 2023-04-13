import 'package:filledstacked_academy/models/models.dart';

/// The interface that represents the Api functionality required for Academy
abstract class AppApi {
  Future<List<Course>> getCourses();

  Future<Course> getCourse({required String id});
}
