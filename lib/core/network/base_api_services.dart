abstract class BaseApiServices{
  Future<dynamic> getApi(String url);

  /// Sends data to the API using a POST request.
  ///
  /// Takes a [url] parameter representing the endpoint URL and a [data] parameter
  /// representing the data to be sent.
  Future<dynamic> postApi(String url, dynamic data);
  Future<dynamic> putApi(String url, dynamic data);
  Future<dynamic> loginApi(String url, dynamic data);
  Future<dynamic> estimationCreateApi(String url, dynamic data);
}