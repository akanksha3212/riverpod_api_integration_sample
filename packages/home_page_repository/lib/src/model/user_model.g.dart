// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserModel _$$_UserModelFromJson(Map<String, dynamic> json) => _$_UserModel(
      id: json['id'] as int,
      email: (json['email']??"") as String,
      firstname: (json['first_name']??"") as String,
      lastname: (json['last_name']??"") as String,
      avatar: (json['avatar']??"") as String,
    );

Map<String, dynamic> _$$_UserModelToJson(_$_UserModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'firstname': instance.firstname,
      'lastname': instance.lastname,
      'avatar': instance.avatar,
    };
