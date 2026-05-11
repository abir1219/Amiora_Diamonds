
import '../../../../core/constants/api_end_points.dart';
import '../../../../core/network/network_api_services.dart';

class StoreRepository{
  final _apiClient = NetworkApiService();

  Future<dynamic> fetchStore() async{
    var url = ApiEndPoints.BASE_URL + ApiEndPoints.authEndpoints.STORE_LIST;
    dynamic response = _apiClient.getApi(url);
    return response;
  }
}