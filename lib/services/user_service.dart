import 'package:filledstacks_academy/app/app.locator.dart';
import 'package:filledstacks_academy/enums/sign_in_result.dart';
import 'package:filledstacks_academy/models/user.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_firebase_auth/stacked_firebase_auth.dart'
    as firebase_auth;

class UserService with ListenableServiceMixin {
  final _authenticationService =
      locator<firebase_auth.FirebaseAuthenticationService>();

  User? _currentUser;
  User? get currentUser => _currentUser;

  UserService() {
    _setUserFromFirebaseAuth(_authenticationService.firebaseAuth.currentUser);
  }

  void _setUserFromFirebaseAuth(firebase_auth.User? firebaseUser) {
    if (firebaseUser == null) {
      _currentUser = null;
    } else {
      _currentUser = _extractUserFromFirebaseUser(firebaseUser);
    }

    notifyListeners();
  }

  User _extractUserFromFirebaseUser(firebase_auth.User user) {
    final hasEmail = user.email != null;
    final hasDisplayName = user.displayName != null;

    String? firstName;
    String? lastName;

    if (hasDisplayName) {
      final nameParts = user.displayName!.split(' ');
      firstName = nameParts.first;
      lastName = nameParts.getRange(1, nameParts.length).join(' ');
    }

    return User(
      id: user.uid,
      email: hasEmail ? user.email! : 'NO_EMAIL',
      firstName: firstName,
      lastName: lastName,
      phoneNumber: user.phoneNumber,
      profilePicture: user.photoURL,
    );
  }

  Future<SignInResult> signInWithGoogle() async {
    try {
      final result = await _authenticationService.signInWithGoogle();
      _setUserFromFirebaseAuth(result.user);

      if (result.additionalUserInfo?.isNewUser ?? false) {
        return SignInResult.createdAccount;
      }

      return SignInResult.login;
    } catch (e) {
      return SignInResult.failure;
    }
  }

  /// Signs out User from Firebase and clear [_currentUser]
  Future<void> logout() async {
    await _authenticationService.logout();
    _setUserFromFirebaseAuth(null);
  }
}
