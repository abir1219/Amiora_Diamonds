import 'package:flutter/material.dart';

import '../../../../core/constants/api_end_points.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/local/shared_preferences_helper.dart';
import '../../../../core/network/network_api_services.dart';

class EstimationRepository {
  final _apiClient = NetworkApiService();

  Future<dynamic> getSalesmanList(String search) async {
    String url =
        "${ApiEndPoints.BASE_URL}${ApiEndPoints.authEndpoints.salesmanList}?le_code=${SharedPreferencesHelper.getString(AppConstants.LEGAL_ENTITY)}&search=$search";
    var response = _apiClient.getApi(url);
    return response;
  }

  Future<dynamic> fetchStateList({var country = "", var search = ""}) async {
    String url =
        "${ApiEndPoints.BASE_URL}${ApiEndPoints.authEndpoints.stateList}?country=$country&search=$search";
    dynamic response = _apiClient.getApi(url);
    return response;
  }

  Future<dynamic> fetchCountryList() async {
    String url =
        "${ApiEndPoints.BASE_URL}${ApiEndPoints.authEndpoints.countryList}";
    dynamic response = _apiClient.getApi(url);
    return response;
  }

  Future<dynamic> addCustomer(var body) async {
    String url = ApiEndPoints.BASE_URL + ApiEndPoints.authEndpoints.addCustomer;
    dynamic response = _apiClient.postApi(url, body);
    return response;
  }

  Future<dynamic> generateEstimationNumber(var body) async {
    String url = ApiEndPoints.BASE_URL +
        ApiEndPoints.authEndpoints.estimationNumberGenerate;
    dynamic response = _apiClient.postApi(url, body);
    return response;
  }

  Future<dynamic> fetchAddressList() async {
    String url = ApiEndPoints.BASE_URL + ApiEndPoints.authEndpoints.addressList;
    dynamic response = _apiClient.getApi(url);
    return response;
  }

  Future<dynamic> fetchCustomerList() async {
    String url =
        ApiEndPoints.BASE_URL + ApiEndPoints.authEndpoints.customerList;
    dynamic response = _apiClient.getApi(url);
    return response;
  }

  Future<dynamic> fetchCustomerGroupList() async {
    String url =
        ApiEndPoints.BASE_URL + ApiEndPoints.authEndpoints.customerGroupList;
    dynamic response = _apiClient.getApi(url);
    return response;
  }

  Future<dynamic> fetchProductList(String search) async {
    String lecode =
    SharedPreferencesHelper.getString(AppConstants.LEGAL_ENTITY)!;
    String warehouse =
    SharedPreferencesHelper.getString(AppConstants.WAREHOUSE)!;

    String url = "${ApiEndPoints.BASE_URL}${ApiEndPoints.authEndpoints.productList}?warehouse=$warehouse&Le_Code=$lecode&search=$search";
    dynamic response = _apiClient.getApi(url);
    return response;
  }

  Future<dynamic> fetchSkuDetails(var body) async {
    String url = "${ApiEndPoints.BASE_URL}${ApiEndPoints.authEndpoints.skuDetails}";
    dynamic response = _apiClient.postApi(url,body);
    return response;
  }


  Future<dynamic> fetchMiscList() async {
    String url = ApiEndPoints.BASE_URL + ApiEndPoints.authEndpoints.miscList;
    dynamic response = _apiClient.getApi(url);
    return response;
  }

  Future<dynamic> fetchIngredientList() async {
    String url =
        ApiEndPoints.BASE_URL + ApiEndPoints.authEndpoints.ingredientList;
    dynamic response = _apiClient.getApi(url);
    return response;
  }

  Future<dynamic> fetchPurityList() async {
    String url =
        ApiEndPoints.BASE_URL + ApiEndPoints.authEndpoints.purityMasterList;
    dynamic response = _apiClient.getApi(url);
    return response;
  }

  Future<dynamic> fetchStyleList() async {
    String url =
        ApiEndPoints.BASE_URL + ApiEndPoints.authEndpoints.styleMasterList;
    dynamic response = _apiClient.getApi(url);
    return response;
  }

  Future<dynamic> fetchCutList() async {
    String url =
        ApiEndPoints.BASE_URL + ApiEndPoints.authEndpoints.cutMasterList;
    dynamic response = _apiClient.getApi(url);
    return response;
  }

  Future<dynamic> fetchColorList() async {
    String url =
        ApiEndPoints.BASE_URL + ApiEndPoints.authEndpoints.colorMasterList;
    dynamic response = _apiClient.getApi(url);
    return response;
  }

  Future<dynamic> fetchSizeList() async {
    String url =
        ApiEndPoints.BASE_URL + ApiEndPoints.authEndpoints.sizeMasterList;
    dynamic response = _apiClient.getApi(url);
    return response;
  }

  Future<dynamic> fetchBatchList() async {
    String url =
        ApiEndPoints.BASE_URL + ApiEndPoints.authEndpoints.batchMasterList;
    dynamic response = _apiClient.getApi(url);
    return response;
  }

  Future<dynamic> submitEstimationEntry(var body) async {
    String url = ApiEndPoints.BASE_URL +
        ApiEndPoints.authEndpoints.createEstimationEntry;
    dynamic response = _apiClient.estimationCreateApi(url, body);
    return response;
  }

  Future<dynamic> addAddressEntry(var body) async {
    String url = ApiEndPoints.BASE_URL + ApiEndPoints.authEndpoints.addAddress;
    dynamic response = _apiClient.postApi(url, body);
    return response;
  }

  Future<dynamic> checkRateSet() async {
    String url = "${ApiEndPoints.BASE_URL}${ApiEndPoints.authEndpoints.checkRateSet}?whCode=${SharedPreferencesHelper.getString(AppConstants.WAREHOUSE)}&leCode=${SharedPreferencesHelper.getString(AppConstants.LEGAL_ENTITY)}";
    debugPrint("url-->$url");
    dynamic response = _apiClient.getApi(url);
    return response;
  }

}
