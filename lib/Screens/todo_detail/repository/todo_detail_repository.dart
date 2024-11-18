import 'package:logger/logger.dart';

import '../../../api/api_client.dart';
import '../../../api/api_endpoint.dart';
import '../../../models/notes_model.dart';

class TodoDetailRepository {
  final ApiClient apiClient;

  TodoDetailRepository(this.apiClient);

  Future<NotesModel> getDetailTodo(String id) async {
    final res = await apiClient.get(ApiEndpoint.TASK_DETAIL(id));
    if (res.statusCode != 200) {
      Logger().e(res.statusMessage);
    }
    return NotesModel.fromJson(res.data);
  }

  Future<NotesModel> updateTask(NotesModel model) async {
    final res = await apiClient.put(ApiEndpoint.TASK_UPDATE(model.id!),
        data: model);

    if (res.statusCode != 200) {
      Logger().e(res.statusMessage);
    }
    return NotesModel.fromJson(res.data);
  }

  Future<NotesModel> removeTask(String id) async {
    final res = await apiClient.delete(ApiEndpoint.TASK_DELETE(id));

    if (res.statusCode != 200) {
      Logger().e(res.statusMessage);
    }
    return NotesModel.fromJson(res.data);
  }
}
