
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';
@freezed
class UserModel with _$UserModel {
  const factory UserModel({
    required int id,
    required String email,
    required String firstname,
    required String lastname,
    required String avatar,
  }) = _UserModel;
  factory UserModel.fromJson(Map<String,Object?> json)=>_$UserModelFromJson(json);
}
