import 'package:logger/logger.dart';

import '../../../api/api_client.dart';
import '../../../api/api_endpoint.dart';
import '../../../models/notes_model.dart';

class EditTodoRepository {
  final ApiClient apiClient;

  EditTodoRepository(this.apiClient);

  Future<NotesModel> updateTask(NotesModel model) async {
    final res =
        await apiClient.put(ApiEndpoint.TASK_UPDATE(model.id!), data: model);

    if (res.statusCode != 200) {
      Logger().e(res.statusMessage);
    }
    return NotesModel.fromJson(res.data);
  }

  Future<NotesModel> newTask(NotesModel model) async {
    final res = await apiClient.post(ApiEndpoint.TASK_NEW, data: model);

    if (res.statusCode != 200) {
      Logger().e(res.statusMessage);
    }
    return NotesModel.fromJson(res.data);
  }
}
