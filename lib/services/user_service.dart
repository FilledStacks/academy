import 'dart:async';

import 'package:filledstacked_academy/app/app.locator.dart';
import 'package:filledstacked_academy/app/app.logger.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_firebase_auth/stacked_firebase_auth.dart';

class UserService with ListenableServiceMixin {
  final log = getLogger('UserService');
  final _authenticationService = locator<FirebaseAuthenticationService>();

  UserService() {
    listenToReactiveValues([_currentUser]);
  }

  User? _currentUser;
  User get currentUser => _currentUser!;

  bool get hasAuthenticatedUser => _authenticationService.hasUser;

  Future<void> syncUserAccount() async {
    log.i('userId:${_authenticationService.currentUser?.uid}');

    if (_authenticationService.currentUser == null) return;

    try {
      _currentUser = User(
        id: _authenticationService.currentUser!.uid,
        email: _authenticationService.currentUser!.email!,
      );

      notifyListeners();

      log.i('User account information retrieved: $_currentUser');
    } catch (e, s) {
      log.w('User account sync failed. : $e. StackTrace: $s');
    }
  }

  Future<FirebaseAuthenticationResult?> _runAuthentication({
    required Future<FirebaseAuthenticationResult> Function()
        authenticationAction,
  }) async {
    final authResult = await authenticationAction();

    log.v(
        'Auth Result - UserId:${_authenticationService.firebaseAuth.currentUser?.uid}');

    if (authResult.hasError) {
      if (authResult.exceptionCode != null) {
        throw FirebaseAuthException(
          code: authResult.exceptionCode!,
          message: authResult.errorMessage,
        );
      } else {
        throw Exception(authResult.errorMessage);
      }
    }

    return authResult;
  }

  Future<void> signUp({
    required String email,
    required String password,
  }) async {
    log.i('email:$email password:$password');

    await _runAuthentication(
      authenticationAction: () => _authenticationService.createAccountWithEmail(
        email: email,
        password: password,
      ),
    );

    await syncUserAccount();

    log.v("Current signedup user: $_currentUser");
  }

  Future<void> login({
    required String email,
    required String password,
    bool performAdditionalReload = false,
  }) async {
    log.i('email:$email');

    await _runAuthentication(
      authenticationAction: () => _authenticationService.loginWithEmail(
        email: email,
        password: password,
      ),
    );

    await syncUserAccount();
  }

  Future<void> logout() async {
    log.i('');

    await _authenticationService.logout();
    _currentUser = null;
  }
}

class UserServiceException implements Exception {
  final String exception;
  UserServiceException(this.exception);

  @override
  String toString() => exception;
}

class User {
  final String id;
  final String email;

  User({
    required this.id,
    required this.email,
  });

  @override
  String toString() {
    return 'User $id has email:$email';
  }
}

enum SignInResult {
  login,
  createdAccount,
  failure,
}
