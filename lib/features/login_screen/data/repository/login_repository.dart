
import '../../../../core/constants/api_end_points.dart';
import '../../../../core/network/network_api_services.dart';

class LoginRepository {
  final _apiClient = NetworkApiService();

  Future<dynamic> loginApi(var data) async {
    String url = ApiEndPoints.BASE_URL + ApiEndPoints.authEndpoints.login;
    var response = _apiClient.loginApi(url, data);
    return response;
  }
}
