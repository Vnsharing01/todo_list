import 'package:todo_list/api/api_client.dart';
import 'package:todo_list/api/api_endpoint.dart';


abstract class ImpLoginRepository {
  Future<dynamic> login(String mail, String password);
}

class LoginRepository implements ImpLoginRepository {
  final ApiClient _apiClient;

  LoginRepository(this._apiClient);

  @override
  Future login(String mail, String password) async {
    final res = await _apiClient.get(
      ApiEndpoint.LOGIN,
      queryParameters: {"email": mail},
    );
    return res.data;
  }
}
