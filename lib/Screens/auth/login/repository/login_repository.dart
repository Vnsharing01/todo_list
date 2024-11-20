import 'package:logger/logger.dart';
import 'package:todo_list/api/api_client.dart';
import 'package:todo_list/api/api_endpoint.dart';
import 'package:todo_list/models/user_model.dart';

class LoginRepository {
  final ApiClient apiClient;

  LoginRepository(this.apiClient);

  Future<dynamic> login(String mail, String password) async {
    final res = await apiClient.get(
      ApiEndpoint.LOGIN,
      queryParameters: {"email": mail},
    );
    if (res.statusCode != 200) {
      Logger().e(res.statusMessage);
    }
    final List<UserModel> data = [];

    for (var element in res.data) {
      final task = UserModel.fromJson(element);
      data.add(task);
    }

    for (var task in data) {
      if (task.email!.contains(mail)) {
        return task;
      }
    }

    return null;
  }
}
