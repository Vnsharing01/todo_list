import 'package:logger/logger.dart';
import 'package:todo_list/api/api_client.dart';
import 'package:todo_list/api/api_endpoint.dart';


class LoginRepository{
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
    return res.data;
  }
}
