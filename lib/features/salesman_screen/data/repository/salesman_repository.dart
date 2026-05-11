import '../../../../core/constants/api_end_points.dart';
import '../../../../core/network/network_api_services.dart';

class SalesmanRepository {
  final _apiClient = NetworkApiService();

  Future<dynamic> getSalesmanList() async {
    String url = ApiEndPoints.BASE_URL + ApiEndPoints.authEndpoints.salesmanList;
    var response = _apiClient.getApi(url);
    return response;
  }
}
