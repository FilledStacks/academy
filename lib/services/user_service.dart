import 'dart:async';

import 'package:filledstacked_academy/app/app.locator.dart';
import 'package:filledstacked_academy/app/app.logger.dart';
import 'package:filledstacked_academy/enums/sign_in_result.dart';
import 'package:filledstacked_academy/models/user/user.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth show User;
import 'package:stacked/stacked.dart';
import 'package:stacked_firebase_auth/stacked_firebase_auth.dart';

class UserService with ListenableServiceMixin {
  final _log = getLogger('UserService');
  final _authenticationService = locator<FirebaseAuthenticationService>();

  UserService() {
    listenToReactiveValues([_currentUser]);
    _authenticationService.firebaseAuth.authStateChanges().listen(_restoreUser);
  }

  User? _currentUser;
  User get currentUser => _currentUser!;

  bool get hasUser => _currentUser != null;

  /// Restore User from Firebase Auth on authStateChanges
  void _restoreUser(firebase_auth.User? user) {
    if (user == null) {
      _log.i('User is currently signed out!');
      return;
    }

    _currentUser = _extractUserFromFirebaseUser(user);
    _log.d('User is signed in, currentUser:$currentUser');
    notifyListeners();
  }

  /// Authenticates a User through Firebase using Google Provider.
  Future<SignInResult> signInWithGoogle() async {
    _log.i('Google sign in initialized');
    final result = await _authenticationService.signInWithGoogle();
    return handleSocialSignInResult(result);
  }

  /// Assigns extracted User from Firebase User to [_currentUser] and returns
  /// [SignInResult].
  Future<SignInResult> handleSocialSignInResult(
    FirebaseAuthenticationResult result,
  ) async {
    assert(
      result.user != null,
      'User cannot be null after we have autheticated.',
    );

    try {
      _currentUser = _extractUserFromFirebaseUser(result.user!);

      if (result.additionalUserInfo?.isNewUser ?? false) {
        _log.v('Current signed up user: $_currentUser');
        return SignInResult.createdAccount;
      }

      _log.v('Current signed in user: $_currentUser');
      return SignInResult.login;
    } catch (e) {
      _log.d('No profile found for user');
      return SignInResult.failure;
    }
  }

  User _extractUserFromFirebaseUser(
    firebase_auth.User user,
  ) {
    final hasEmail = user.email != null;
    final hasDisplayName = user.displayName != null;

    String? firstName;
    String? lastName;

    if (hasDisplayName) {
      final nameParts = user.displayName!.split(' ');
      firstName = nameParts.first;
      lastName = nameParts.getRange(1, nameParts.length).join(' ');
    }

    return User.empty().copyWith(
      id: user.uid,
      email: hasEmail ? user.email! : 'NO_EMAIL',
      firstName: firstName,
      lastName: lastName,
      phoneNumber: user.phoneNumber,
      profilePicture: user.photoURL,
    );
  }

  /// Signs out User from Firebase and clear [_currentUser]
  Future<void> logout() async {
    _log.i('');

    await _authenticationService.logout();
    _currentUser = null;
  }
}
