import 'package:todo_list/api/api_client.dart';
import 'package:todo_list/api/api_endpoint.dart';

import '../../../../models/user_model.dart';

abstract class ImpSignUpRepository {
  Future<dynamic> register(String mail, String name, String password);
}

class SignUpRepository implements ImpSignUpRepository {
  final ApiClient _apiClient;

  SignUpRepository(this._apiClient);

  @override
  Future register(String mail, String name, String password) async {
    final res = await _apiClient.post(
      ApiEndpoint.REGISTER,
      data: UserModel(name: name, mail: mail, passwword: password).toJson(),
    );
    return res.data;
  }
}
