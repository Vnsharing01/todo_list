import 'package:todo_list/api/api_client.dart';
import 'package:todo_list/api/api_endpoint.dart';

import '../../../../models/user_model.dart';

class SignUpRepository {
  final ApiClient apiClient;

  SignUpRepository(this.apiClient);

  Future<dynamic> register(String mail, String name, String password) async {
    final res = await apiClient.post(
      ApiEndpoint.REGISTER,
      data: UserModel(name: name, email: mail, password: password).toJson(),
    );
    return res.data;
  }
}
