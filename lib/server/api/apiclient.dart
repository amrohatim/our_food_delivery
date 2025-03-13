import 'package:get/get.dart';

class ApiClient extends GetConnect implements GetxService {
  late String accesstoken;
  final String appbaseurl;

  // ignore: unused_field
  late Map<String, String> _mainheaders;
  ApiClient({required this.appbaseurl}) {
    baseUrl = appbaseurl;

    timeout = const Duration(seconds: 30);
    _mainheaders = {
      "Content-type": "application/json; charset=UTF-8",
    };
  }

  void updateHeaders(String token) {
    _mainheaders = {
      "Content-type": "application/json; charset=UTF-8",
      "Authorization": "Bearer $token"
    };
  }

  Future<Response> getproduct(String uri,
      {Map<String, String>? headers}) async {
    try {
      Response response = await get(uri, headers: headers ?? _mainheaders);
      return response;
    } catch (e) {
      return Response(statusCode: 1, statusText: e.toString());
    }
  }

  Future<Response> postData(String uri, Map<String, dynamic> body) async {
    try {
      Response response = await post(uri, body, headers: _mainheaders);
      return response;
    } catch (e) {
      return Response(statusCode: 1, statusText: e.toString());
    }
  }
}
