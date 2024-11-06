// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$UserModelCWProxy {
  UserModel id(String? id);

  UserModel name(String? name);

  UserModel mail(String? mail);

  UserModel passwword(String? passwword);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `UserModel(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// UserModel(...).copyWith(id: 12, name: "My name")
  /// ````
  UserModel call({
    String? id,
    String? name,
    String? mail,
    String? passwword,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfUserModel.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfUserModel.copyWith.fieldName(...)`
class _$UserModelCWProxyImpl implements _$UserModelCWProxy {
  const _$UserModelCWProxyImpl(this._value);

  final UserModel _value;

  @override
  UserModel id(String? id) => this(id: id);

  @override
  UserModel name(String? name) => this(name: name);

  @override
  UserModel mail(String? mail) => this(mail: mail);

  @override
  UserModel passwword(String? passwword) => this(passwword: passwword);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `UserModel(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// UserModel(...).copyWith(id: 12, name: "My name")
  /// ````
  UserModel call({
    Object? id = const $CopyWithPlaceholder(),
    Object? name = const $CopyWithPlaceholder(),
    Object? mail = const $CopyWithPlaceholder(),
    Object? passwword = const $CopyWithPlaceholder(),
  }) {
    return UserModel(
      id: id == const $CopyWithPlaceholder()
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as String?,
      name: name == const $CopyWithPlaceholder()
          ? _value.name
          // ignore: cast_nullable_to_non_nullable
          : name as String?,
      mail: mail == const $CopyWithPlaceholder()
          ? _value.mail
          // ignore: cast_nullable_to_non_nullable
          : mail as String?,
      passwword: passwword == const $CopyWithPlaceholder()
          ? _value.passwword
          // ignore: cast_nullable_to_non_nullable
          : passwword as String?,
    );
  }
}

extension $UserModelCopyWith on UserModel {
  /// Returns a callable class that can be used as follows: `instanceOfUserModel.copyWith(...)` or like so:`instanceOfUserModel.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$UserModelCWProxy get copyWith => _$UserModelCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      id: json['id'] as String?,
      name: json['name'] as String?,
      mail: json['mail'] as String?,
      passwword: json['passwword'] as String?,
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'mail': instance.mail,
      'passwword': instance.passwword,
    };
