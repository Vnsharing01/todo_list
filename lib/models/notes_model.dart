import 'package:copy_with_extension/copy_with_extension.dart';

part 'notes_model.g.dart';

@CopyWith()
class NotesModel {
  final String? id;
  final String? subtitle;
  final String? title;
  final String? time;
  final int? image;
  final bool? isDon;
  NotesModel({
    this.id,
    this.subtitle,
    this.time,
    this.image,
    this.title,
    this.isDon = false,
  });
}
