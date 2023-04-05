import 'package:filledstacked_academy/services/native_interaction_service.dart';

class NativeInteractionImplementation implements NativeInteractionsInterface {
  @override
  String getPlatformFromJS() {
    return '';
  }

  @override
  Future<String> callJSPromise() {
    return Future.value('');
  }

  @override
  Future<String> callOpenTab() {
    return Future.value('');
  }
}
