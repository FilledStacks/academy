// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_User _$$_UserFromJson(Map<String, dynamic> json) => _$_User(
      id: json['id'] as String,
      email: json['email'] as String,
      firstName: json['firstName'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      lastName: json['lastName'] as String?,
      profilePicture: json['profilePicture'] as String?,
    );

Map<String, dynamic> _$$_UserToJson(_$_User instance) => <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'firstName': instance.firstName,
      'phoneNumber': instance.phoneNumber,
      'lastName': instance.lastName,
      'profilePicture': instance.profilePicture,
    };
