import 'dart:async';

import 'package:filledstacked_academy/app/app.locator.dart';
import 'package:filledstacked_academy/app/app.logger.dart';
import 'package:filledstacked_academy/enums/sign_in_result.dart';
import 'package:filledstacked_academy/models/user/user.dart' as academy;
import 'package:stacked/stacked.dart';
import 'package:stacked_firebase_auth/stacked_firebase_auth.dart';

import 'google_cloud_logger_service.dart';

typedef AppUser = academy.User;
typedef FirebaseUser = User;

class UserService with ListenableServiceMixin {
  final log = getLogger('UserService');
  final _authenticationService = locator<FirebaseAuthenticationService>();
  final _cloudLogger = locator<GoogleCloudLoggerService>();

  UserService() {
    _initialise();
  }

  AppUser? _currentUser;
  AppUser get currentUser => _currentUser!;

  bool get hasUser => _currentUser != null;

  bool get hasFirebaseUser =>
      _authenticationService.firebaseAuth.currentUser != null;

  Future<void> _initialise() async {
    _setUserFromFirebaseAuth(
      firebaseUser: _authenticationService.firebaseAuth.currentUser,
    );
    await _cloudLogger.initialise();
    _trackUserSessionDetails(currentUser);
  }

  /// Sets User from FirebaseAuth
  void _setUserFromFirebaseAuth({FirebaseUser? firebaseUser}) {
    if (firebaseUser == null) {
      _currentUser = null;
    } else {
      _currentUser = _extractUserFromFirebaseUser(firebaseUser);
    }

    notifyListeners();
  }

  Future<void> _trackUserSessionDetails(AppUser user) async {
    _cloudLogger.setUserId(
      userId: user.id,
      sessionId: 0,
    );
  }

  /// Authenticates a User through Firebase using Google Provider.
  Future<SignInResult> signInWithGoogle() async {
    log.i('Google sign in initialized');
    return handleSocialSignInResult(
      await _authenticationService.signInWithGoogle(),
    );
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
      _setUserFromFirebaseAuth(firebaseUser: result.user);

      if (result.additionalUserInfo?.isNewUser ?? false) {
        log.v('Current signed up user: $_currentUser');
        await _trackUserSessionDetails(_currentUser!);
        return SignInResult.createdAccount;
      }

      log.v('Current signed in user: $_currentUser');
      return SignInResult.login;
    } catch (e) {
      log.d('No profile found for user');
      return SignInResult.failure;
    }
  }

  AppUser _extractUserFromFirebaseUser(FirebaseUser user) {
    final hasEmail = user.email != null;
    final hasDisplayName = user.displayName != null;

    String? firstName;
    String? lastName;

    if (hasDisplayName) {
      final nameParts = user.displayName!.split(' ');
      firstName = nameParts.first;
      lastName = nameParts.getRange(1, nameParts.length).join(' ');
    }

    return AppUser.empty().copyWith(
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
    log.i('');

    await _authenticationService.logout();
    _setUserFromFirebaseAuth();
  }
}
