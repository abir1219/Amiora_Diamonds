import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;

import '../../main.dart';
import '../../router/app_pages.dart';
import '../constants/app_constants.dart';
import '../errors/app_exceptions.dart';
import '../local/shared_preferences_helper.dart';
import 'base_api_services.dart';

/// Class for handling network API requests.
class NetworkApiService implements BaseApiServices {
  /// Sends a GET request to the specified [url] and returns the response.
  ///
  /// Throws a [NoInternetException] if there is no internet connection.
  /// Throws a [FetchDataException] if the network request times out.
  @override
  Future<dynamic> getApi(String url) async {
    if (kDebugMode) {
      print(
          "AccessToken==>Bearer ${SharedPreferencesHelper.getString(AppConstants.ACCESS_TOKEN)}");
      print("Get_api==>$url");
    }
    dynamic responseJson;
    Map<String, String> headers = {
      'Device-ID':
      "${SharedPreferencesHelper.getString(AppConstants.DEVICE_ID)}",
    };
    try {
      final response = await http.get(
        Uri.parse(url),
        headers: headers,
      );
      if (kDebugMode) {
        print("URL==>$url");
        print("Headers==>$headers");
        print("Response==>${response.body}");
      }

      responseJson = returnResponse(response);

      if (kDebugMode) {
        print("responseJson==>$responseJson");
      }
    } on SocketException {
      throw NoInternetException('');
    } on TimeoutException {
      throw FetchDataException('Network Request time out');
    }

    if (kDebugMode) {
      print(responseJson);
    }
    return responseJson;
  }

  /// Sends a POST request to the specified [url] with the provided [data]
  /// and returns the response.
  ///
  /// Throws a [NoInternetException] if there is no internet connection.
  /// Throws a [FetchDataException] if the network request times out.
  @override
  Future<dynamic> postApi(String url, dynamic data) async {
    if (kDebugMode) {
      print(
          "AccessToken==>Bearer ${SharedPreferencesHelper.getString(AppConstants.ACCESS_TOKEN)}");
      print("Post_api==>$url");
      //print("Body==>$data");
      debugPrint("Body==>$data", wrapWidth: 1024);
    }

    dynamic responseJson;
    Map<String, String> headers = {
      'Device-ID':
      "${SharedPreferencesHelper.getString(AppConstants.DEVICE_ID)}",
    };
    try {
      final http.Response response = await http.post(
        Uri.parse(url),
        body: data,
        headers: headers,
      );
      responseJson = returnResponse(response);
      if (kDebugMode) {
        print("Status_code =>> ${response.statusCode}");
      }
    } on SocketException {
      throw NoInternetException('No Internet Connection');
    } on TimeoutException {
      throw FetchDataException('Network Request time out');
    }
    if (kDebugMode) {
      print(responseJson);
    }
    return responseJson;
  }

  @override
  Future<dynamic> estimationCreateApi(String url, dynamic data) async {
    if (kDebugMode) {
      print(
          "AccessToken==>Bearer ${SharedPreferencesHelper.getString(AppConstants.ACCESS_TOKEN)}");
      print("Post_api==>$url");
      //print("Body==>$data");
      debugPrint("Body==>$data", wrapWidth: 1024);
    }

    dynamic responseJson;
    try {
      final http.Response response =
      await http.post(Uri.parse(url), body: data, headers: {
        'Content-Type': 'application/json',
        'Device-ID':
        "${SharedPreferencesHelper.getString(AppConstants.DEVICE_ID)}"
      }
        // headers: headers,
      );
      responseJson = returnResponse(response);
      if (kDebugMode) {
        print("Status_code =>> ${response.statusCode}");
      }
    } on SocketException {
      throw NoInternetException('No Internet Connection');
    } on TimeoutException {
      throw FetchDataException('Network Request time out');
    }
    if (kDebugMode) {
      print(responseJson);
    }
    return responseJson;
  }

  @override
  Future<dynamic> putApi(String url, dynamic data) async {
    if (kDebugMode) {
      print(
          "AccessToken==>Bearer ${SharedPreferencesHelper.getString(AppConstants.ACCESS_TOKEN)}");
      print("Post_api==>$url");
      //print("Body==>$data");
      debugPrint("Body==>$data", wrapWidth: 1024);
    }

    dynamic responseJson;
    Map<String, String> headers = {
      'Device-ID':
      "${SharedPreferencesHelper.getString(AppConstants.DEVICE_ID)}",
    };
    try {
      final http.Response response = await http.put(
        Uri.parse(url),
        body: data,
        headers: headers,
      );
      responseJson = returnResponse(response);
      if (kDebugMode) {
        print("Status_code =>> ${response.statusCode}");
      }
    } on SocketException {
      throw NoInternetException('No Internet Connection');
    } on TimeoutException {
      throw FetchDataException('Network Request time out');
    }
    if (kDebugMode) {
      print(responseJson);
    }
    return responseJson;
  }

  @override
  Future<dynamic> loginApi(String url, dynamic data) async {
    if (kDebugMode) {
      print(
          "AccessToken==>Bearer ${SharedPreferencesHelper.getString(AppConstants.ACCESS_TOKEN)}");
      print("Post_api==>$url");
      print("Body==>$data");
    }

    dynamic responseJson;
    Map<String, String> headers = {
      'Device-ID':
      "${SharedPreferencesHelper.getString(AppConstants.DEVICE_ID)}",
    };
    try {
      final http.Response response =
      await http.post(Uri.parse(url), body: data, headers: headers);
      responseJson = returnResponse(response);
    } on SocketException {
      throw NoInternetException('No Internet Connection');
    } on TimeoutException {
      throw FetchDataException('Network Request time out');
    }
    if (kDebugMode) {
      print(responseJson);
    }
    return responseJson;
  }

  dynamic returnResponse(http.Response response) {
    if (kDebugMode) {
      print("STATUS_CODE-->${response.statusCode}");
    }else{
      print("STATUS_CODE-->${response.statusCode}");
    }

    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 201:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 401:
      // debugPrint("-----401-----");
      // GoRouter.of(navigatorKey.currentContext!).go(AppPages.URL_VERIFICATION);
        if (navigatorKey.currentContext != null) {
          GoRouter.of(navigatorKey.currentContext!)
              .go(AppPages.URL_VERIFICATION);
        } else {
          print("Navigator context is null");
        }
        return null;
      case 500:
      case 404:
        throw UnauthorisedException(response.body.toString());
      default:
        throw FetchDataException(
            'Error occurred while communicating with server');
    }
  }
}
