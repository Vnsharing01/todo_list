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
}
