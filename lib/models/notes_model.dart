import 'package:json_annotation/json_annotation.dart';
import 'package:copy_with_extension/copy_with_extension.dart';

part 'notes_model.g.dart';

@JsonSerializable(explicitToJson: true)
@CopyWith()
class NotesModel {
  final String? id;
  final String? userId;
  final String? subtitle;
  final String? title;
  final String? time;
  final int? image;
  final bool? isDone;
  NotesModel({
    this.id,
    this.userId,
    this.subtitle,
    this.time,
    this.image,
    this.title,
    this.isDone = false,
  });

  factory NotesModel.fromJson(Map<String, dynamic> json) =>
      _$NotesModelFromJson(json);

  Map<String, dynamic> toJson() => _$NotesModelToJson(this);
}
