import '../../../../core/constants/api_end_points.dart';
import '../../../../core/network/network_api_services.dart';

class UpdatePasswordRepository{
  final _apiClient = NetworkApiService();

  Future<dynamic> updatePasswordApi(var data) async {
    String url = ApiEndPoints.BASE_URL + ApiEndPoints.authEndpoints.updatePassword;
    var response = _apiClient.putApi(url, data);
    return response;
  }
}