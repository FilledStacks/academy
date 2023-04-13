@JS()
library app_function.js;

import 'package:js/js.dart';
import 'package:js/js_util.dart';

import 'native_interaction_service.dart';

@JS('jsOpenPopup')
external dynamic _jsOpenPopup(String url);

class NativeInteractionImplementation implements NativeInteractionsInterface {
  @override
  Future<String> callOpenPopup() async {
    return await promiseToFuture(_jsOpenPopup('https://google.com/'));
  }
}
