// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notes_model.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$NotesModelCWProxy {
  NotesModel id(String? id);

  NotesModel subtitle(String? subtitle);

  NotesModel time(String? time);

  NotesModel image(int? image);

  NotesModel title(String? title);

  NotesModel isDon(bool? isDon);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `NotesModel(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// NotesModel(...).copyWith(id: 12, name: "My name")
  /// ````
  NotesModel call({
    String? id,
    String? subtitle,
    String? time,
    int? image,
    String? title,
    bool? isDon,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfNotesModel.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfNotesModel.copyWith.fieldName(...)`
class _$NotesModelCWProxyImpl implements _$NotesModelCWProxy {
  const _$NotesModelCWProxyImpl(this._value);

  final NotesModel _value;

  @override
  NotesModel id(String? id) => this(id: id);

  @override
  NotesModel subtitle(String? subtitle) => this(subtitle: subtitle);

  @override
  NotesModel time(String? time) => this(time: time);

  @override
  NotesModel image(int? image) => this(image: image);

  @override
  NotesModel title(String? title) => this(title: title);

  @override
  NotesModel isDon(bool? isDon) => this(isDon: isDon);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `NotesModel(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// NotesModel(...).copyWith(id: 12, name: "My name")
  /// ````
  NotesModel call({
    Object? id = const $CopyWithPlaceholder(),
    Object? subtitle = const $CopyWithPlaceholder(),
    Object? time = const $CopyWithPlaceholder(),
    Object? image = const $CopyWithPlaceholder(),
    Object? title = const $CopyWithPlaceholder(),
    Object? isDon = const $CopyWithPlaceholder(),
  }) {
    return NotesModel(
      id: id == const $CopyWithPlaceholder()
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as String?,
      subtitle: subtitle == const $CopyWithPlaceholder()
          ? _value.subtitle
          // ignore: cast_nullable_to_non_nullable
          : subtitle as String?,
      time: time == const $CopyWithPlaceholder()
          ? _value.time
          // ignore: cast_nullable_to_non_nullable
          : time as String?,
      image: image == const $CopyWithPlaceholder()
          ? _value.image
          // ignore: cast_nullable_to_non_nullable
          : image as int?,
      title: title == const $CopyWithPlaceholder()
          ? _value.title
          // ignore: cast_nullable_to_non_nullable
          : title as String?,
      isDon: isDon == const $CopyWithPlaceholder()
          ? _value.isDon
          // ignore: cast_nullable_to_non_nullable
          : isDon as bool?,
    );
  }
}

extension $NotesModelCopyWith on NotesModel {
  /// Returns a callable class that can be used as follows: `instanceOfNotesModel.copyWith(...)` or like so:`instanceOfNotesModel.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$NotesModelCWProxy get copyWith => _$NotesModelCWProxyImpl(this);
}
