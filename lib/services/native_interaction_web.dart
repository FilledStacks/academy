@JS()
library script.js;

import 'dart:js' as js;

import 'package:js/js.dart';
import 'package:js/js_util.dart';

@JS('jsPromiseFunction')
external dynamic _jsPromiseFunction(String message);

@JS('jsOpenTabFunction')
external dynamic _jsOpenTabFunction(String url);

class NativeInteractionService {
  String getPlatformFromJS() {
    return js.context.callMethod('getPlatform');
  }

  Future<String> callJSPromise() async {
    return await promiseToFuture(_jsPromiseFunction("I am back from JS"));
  }

  Future<String> callOpenTab() async {
    return await promiseToFuture(_jsOpenTabFunction('https://google.com/'));
  }
}
