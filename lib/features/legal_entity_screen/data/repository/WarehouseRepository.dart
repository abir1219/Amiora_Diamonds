import '../../../../core/constants/api_end_points.dart';
import '../../../../core/network/network_api_services.dart';

class WarehouseRepository{

  final _apiClient = NetworkApiService();

  Future<dynamic> getWarehouseList(var body) async {
    String url = ApiEndPoints.BASE_URL + ApiEndPoints.authEndpoints.warehouseList;
    var response = _apiClient.postApi(url,body);
    return response;
  }
}