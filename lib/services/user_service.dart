import 'dart:async';

import 'package:filledstacked_academy/app/app.locator.dart';
import 'package:filledstacked_academy/app/app.logger.dart';
import 'package:filledstacked_academy/enums/sign_in_result.dart';
import 'package:filledstacked_academy/models/user/user.dart';
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

  bool get hasUser => _currentUser != null;

  Future<SignInResult> signInWithGoogle() async {
    log.i('Google sign in initialized');
    final result = await _authenticationService.signInWithGoogle();
    return handleSocialSignInResult(result);
  }

  Future<SignInResult> handleSocialSignInResult(
    FirebaseAuthenticationResult result,
  ) async {
    assert(
      result.user != null,
      'User cannot be null after we have autheticated.',
    );

    try {
      if (result.additionalUserInfo?.isNewUser ?? false) {
        _currentUser = await _extractUserFromFirebaseResult(result);
        log.v('Current signed up user: $_currentUser');

        return SignInResult.createdAccount;
      }

      /// TODO: assign the user recovered from API or DB because was already
      /// signed up and stored. Otherwise, can be unified with above code.
      _currentUser = await _extractUserFromFirebaseResult(result);
      log.v('Current signed in user: $_currentUser');

      return SignInResult.login;
    } catch (e) {
      log.d('no profile found for user');
      return SignInResult.failure;
    }
  }

  Future<User> _extractUserFromFirebaseResult(
    FirebaseAuthenticationResult result,
  ) async {
    final user = result.user!;
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

  Future<void> logout() async {
    log.i('');

    await _authenticationService.logout();
    _currentUser = null;
  }
}
