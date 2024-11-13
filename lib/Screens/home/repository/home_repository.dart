import 'package:logger/logger.dart';
import 'package:todo_list/api/api_endpoint.dart';
import 'package:todo_list/models/notes_model.dart';

import '../../../api/api_client.dart';

class HomeRepository {
  final ApiClient apiClient;

  HomeRepository(this.apiClient);

  Future<List<NotesModel>> getAllListTodo() async {
    final res = await apiClient.get(ApiEndpoint.TASK);
    if (res.statusCode != 200) {
      Logger().e(res.statusMessage);
    }
    final List<NotesModel> data = [];

    for (var element in res.data) {
      final task = NotesModel.fromJson(element);
      data.add(task);
    }
    return data;
  }

  Future<NotesModel> updateTask(NotesModel model) async {
    final res = await apiClient.put(ApiEndpoint.TASK_UPDATE(model.id!),
        data: model.copyWith(isDone: !model.isDone!));

    if (res.statusCode != 200) {
      Logger().e(res.statusMessage);
    }
    return NotesModel.fromJson(res.data);
  }

  Future<NotesModel> removeTask(NotesModel model) async {
    final res = await apiClient.delete(ApiEndpoint.TASK_DELETE(model.id!));

    if (res.statusCode != 200) {
      Logger().e(res.statusMessage);
    }
    return NotesModel.fromJson(res.data);
  }
}
