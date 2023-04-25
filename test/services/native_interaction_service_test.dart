import 'package:flutter_test/flutter_test.dart';
import 'package:filledstacks_academy/app/app.locator.dart';

import '../helpers/test_helpers.dart';

void main() {
  group('NativeInteractionServiceTest -', () {
    setUp(() => registerServices());
    tearDown(() => locator.reset());
  });
}