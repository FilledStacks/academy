import 'native_interaction_service.dart';

class NativeInteractionImplementation implements NativeInteractionInterface {
  @override
  Future<String> openPopup() {
    return Future.value('');
  }
}
