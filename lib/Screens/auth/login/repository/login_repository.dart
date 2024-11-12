import 'package:logger/logger.dart';
import 'package:todo_list/api/api_client.dart';
import 'package:todo_list/api/api_endpoint.dart';


class LoginRepository{
  final ApiClient _apiClient;

  LoginRepository(this._apiClient);

  Future<dynamic> login(String mail, String password) async {
    final res = await _apiClient.get(
      ApiEndpoint.LOGIN,
      queryParameters: {"email": mail},
    );
    if (res.statusCode != 200) {
      Logger().e(res.statusMessage);
    }
    return res.data;
  }
}
