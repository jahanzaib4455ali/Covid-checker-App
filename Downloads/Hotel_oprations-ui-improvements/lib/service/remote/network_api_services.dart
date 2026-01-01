import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:kunggy_operational_app/service/remote/api_headers.dart';
import 'package:kunggy_operational_app/service/remote/api_responses.dart';
import 'package:kunggy_operational_app/utils/extensions/response_extension.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class NetworkApiService {
  ApiResponses responseClass = ApiResponses();
  Duration timeOutDuration = const Duration(seconds: 15);
  ApiHeaders apiHeaders = ApiHeaders();

  Future getGetApiResponse(
    String url, {
    bool addAccessToken = true,
    bool contentTypeJson = true,
  }) async {
    Map<String, dynamic> responseJson = {};
    Response response;
    try {
      response = await http
          .get(
            Uri.parse(url),
            headers: apiHeaders.getHeaders(
              addAccessToken: addAccessToken,
              contentTypeJson: contentTypeJson,
            ),
          )
          .timeout(timeOutDuration, onTimeout: errorResponse);
      responseJson = responseClass.returnResponse(response);
    } on SocketException {
      response = await errorResponse();
    } catch (e) {
      response = await serverErrorResponse();
    }

    if (responseJson.hasInvalidToken()) {
      responseJson.onInvalidToken();
    }
    return responseJson;
  }

  Future<Map<String, dynamic>> getPostApiResponse(
    String url,
    dynamic data, {
    bool addAccessToken = true,
    bool contentTypeJson = true,
    final String? token,
  }) async {
    Map<String, dynamic> responseJson = {};
    Response response;
    try {
      Map<String, String>? headers = apiHeaders.getHeaders(
        addAccessToken: token == null ? addAccessToken : false,
        contentTypeJson: contentTypeJson,
      );

      if (token != null) {
        Map<String, String> authHeader = {"Authorization": "Bearer $token"};
        if (headers == null) {
          headers = authHeader;
        } else {
          headers.addEntries(authHeader.entries);
        }
      }
      response = await http
          .post(Uri.parse(url), body: data, headers: headers)
          .timeout(timeOutDuration, onTimeout: errorResponse);
      log("response: $url\n ${response.statusCode} ././. ${response.body}");
      responseJson = responseClass.returnResponse(response);
    } on SocketException {
      response = await errorResponse();
      return jsonDecode(response.body);
    } catch (exp2) {
      response = await serverErrorResponse();
      return jsonDecode(response.body);
    }
    if (responseJson.hasInvalidToken()) {
      responseJson.onInvalidToken();
    }
    return responseJson;
  }

  Future getPutApiResponse(
    String url,
    dynamic data, {
    bool addAccessToken = true,
    bool contentTypeJson = true,
  }) async {
    dynamic responseJson;
    Response response;
    try {
      response = await http
          .put(
            Uri.parse(url),
            body: data,
            headers: apiHeaders.getHeaders(
              addAccessToken: addAccessToken,
              contentTypeJson: contentTypeJson,
            ),
          )
          .timeout(timeOutDuration, onTimeout: errorResponse);
    } on SocketException {
      response = await errorResponse();
    } catch (e) {
      response = await serverErrorResponse();
    }
    responseJson = responseClass.returnResponse(response);
    return responseJson;
  }

  Future getPatchApiResponse(
    String url,
    dynamic data, {
    bool addAccessToken = true,
    bool contentTypeJson = true,
  }) async {
    dynamic responseJson;
    Response response;
    try {
      response = await http
          .patch(
            Uri.parse(url),
            body: data,
            headers: apiHeaders.getHeaders(
              addAccessToken: addAccessToken,
              contentTypeJson: contentTypeJson,
            ),
          )
          .timeout(timeOutDuration, onTimeout: errorResponse);
      responseJson = responseClass.returnResponse(response);
    } on SocketException {
      response = await errorResponse();
    } catch (e) {
      response = await serverErrorResponse();
    }
    return responseJson;
  }

  Future<Response> errorResponse() async {
    String errorJson = jsonEncode({
      "message":
          "Internet connection breakdown during communication. Please check your internet connection and try again.",
      "internet": true,
      "server": false,
      "data": null,
    });
    return Response(errorJson, 500);
  }

  Future<Response> serverErrorResponse() async {
    String errorJson = jsonEncode({
      "message": "Server is not respongding.",
      "internet": false,
      "server": true,
      "data": null,
    });
    return Response(errorJson, 500);
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
