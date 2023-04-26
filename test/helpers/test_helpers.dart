import 'package:filledstacks_academy/app/app.locator.dart';
import 'package:filledstacks_academy/services/course_service.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:stacked_services/stacked_services.dart';

import 'package:filledstacks_academy/services/layout_service.dart';
import 'package:filledstacks_academy/services/user_service.dart';
import 'package:filledstacks_academy/services/google_cloud_logger_service.dart';
import 'package:filledstacks_academy/services/analytics_service.dart';
import 'package:filledstacks_academy/services/native_interactions/native_interaction_service.dart';
import 'package:filledstacks_academy/services/environment_service.dart';
// @stacked-import

import 'test_helpers.mocks.dart';

@GenerateMocks([], customMocks: [
  MockSpec<RouterService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<BottomSheetService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<DialogService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<CourseService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<LayoutService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<UserService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<GoogleCloudLoggerService>(
      onMissingStub: OnMissingStub.returnDefault),
  MockSpec<AnalyticsService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<NativeInteractionService>(
      onMissingStub: OnMissingStub.returnDefault),
  MockSpec<EnvironmentService>(onMissingStub: OnMissingStub.returnDefault),
// @stacked-mock-spec
])
void registerServices() {
  getAndRegisterRouterService();
  getAndRegisterBottomSheetService();
  getAndRegisterDialogService();
  getAndRegisterCourseService();
  getAndRegisterLayoutService();
  getAndRegisterUserService();
  getAndRegisterGoogleCloudLoggerService();
  getAndRegisterAnalyticsService();
  getAndRegisterNativeInteractionService();
  getAndRegisterEnvironmentService();
// @stacked-mock-register
}

MockRouterService getAndRegisterRouterService() {
  _removeRegistrationIfExists<RouterService>();
  final service = MockRouterService();
  locator.registerSingleton<RouterService>(service);
  return service;
}

MockBottomSheetService getAndRegisterBottomSheetService<T>({
  SheetResponse<T>? showCustomSheetResponse,
}) {
  _removeRegistrationIfExists<BottomSheetService>();
  final service = MockBottomSheetService();

  when(service.showCustomSheet<T, T>(
    enableDrag: anyNamed('enableDrag'),
    enterBottomSheetDuration: anyNamed('enterBottomSheetDuration'),
    exitBottomSheetDuration: anyNamed('exitBottomSheetDuration'),
    ignoreSafeArea: anyNamed('ignoreSafeArea'),
    isScrollControlled: anyNamed('isScrollControlled'),
    barrierDismissible: anyNamed('barrierDismissible'),
    additionalButtonTitle: anyNamed('additionalButtonTitle'),
    variant: anyNamed('variant'),
    title: anyNamed('title'),
    hasImage: anyNamed('hasImage'),
    imageUrl: anyNamed('imageUrl'),
    showIconInMainButton: anyNamed('showIconInMainButton'),
    mainButtonTitle: anyNamed('mainButtonTitle'),
    showIconInSecondaryButton: anyNamed('showIconInSecondaryButton'),
    secondaryButtonTitle: anyNamed('secondaryButtonTitle'),
    showIconInAdditionalButton: anyNamed('showIconInAdditionalButton'),
    takesInput: anyNamed('takesInput'),
    barrierColor: anyNamed('barrierColor'),
    barrierLabel: anyNamed('barrierLabel'),
    customData: anyNamed('customData'),
    data: anyNamed('data'),
    description: anyNamed('description'),
  )).thenAnswer((realInvocation) =>
      Future.value(showCustomSheetResponse ?? SheetResponse<T>()));

  locator.registerSingleton<BottomSheetService>(service);
  return service;
}

MockDialogService getAndRegisterDialogService() {
  _removeRegistrationIfExists<DialogService>();
  final service = MockDialogService();
  locator.registerSingleton<DialogService>(service);
  return service;
}

MockCourseService getAndRegisterCourseService() {
  _removeRegistrationIfExists<CourseService>();
  final service = MockCourseService();
  locator.registerSingleton<CourseService>(service);
  return service;
}

MockLayoutService getAndRegisterLayoutService() {
  _removeRegistrationIfExists<LayoutService>();
  final service = MockLayoutService();
  locator.registerSingleton<LayoutService>(service);
  return service;
}

MockUserService getAndRegisterUserService() {
  _removeRegistrationIfExists<UserService>();
  final service = MockUserService();
  locator.registerSingleton<UserService>(service);
  return service;
}

MockGoogleCloudLoggerService getAndRegisterGoogleCloudLoggerService() {
  _removeRegistrationIfExists<GoogleCloudLoggerService>();
  final service = MockGoogleCloudLoggerService();
  locator.registerSingleton<GoogleCloudLoggerService>(service);
  return service;
}

MockAnalyticsService getAndRegisterAnalyticsService() {
  _removeRegistrationIfExists<AnalyticsService>();
  final service = MockAnalyticsService();
  locator.registerSingleton<AnalyticsService>(service);
  return service;
}

MockNativeInteractionService getAndRegisterNativeInteractionService() {
  _removeRegistrationIfExists<NativeInteractionService>();
  final service = MockNativeInteractionService();
  locator.registerSingleton<NativeInteractionService>(service);
  return service;
}

MockEnvironmentService getAndRegisterEnvironmentService() {
  _removeRegistrationIfExists<EnvironmentService>();
  final service = MockEnvironmentService();
  locator.registerSingleton<EnvironmentService>(service);
  return service;
}
// @stacked-mock-create

void _removeRegistrationIfExists<T extends Object>() {
  if (locator.isRegistered<T>()) {
    locator.unregister<T>();
  }
}
