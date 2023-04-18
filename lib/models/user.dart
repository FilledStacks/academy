import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class User with _$User, SerializeJson {
  User._();

  factory User({
    required String id,
    required String email,
    String? firstName,
    String? phoneNumber,
    String? lastName,
    String? profilePicture,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  /// Constructs an empty user with default required values
  factory User.empty() => User(
        id: '',
        email: '',
      );

  /// Returns 'firstName lastName' combination
  String get fullName => [
        if (firstName != null) firstName,
        if (lastName != null) lastName
      ].join(' ');

  ///
  bool get hasProfilePicture =>
      profilePicture != null && profilePicture!.isNotEmpty;

  /// Returns true if a user account has been created but CreateProfileView has
  /// not been completed.
  bool get hasCreatedAccount =>
      firstName != null &&
      firstName!.isNotEmpty &&
      phoneNumber != null &&
      phoneNumber!.isNotEmpty;
}

mixin SerializeJson {
  Map<String, dynamic> toJson();
}
