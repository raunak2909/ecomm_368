import 'dart:convert';
import 'dart:io';

import 'package:ecomm_368/data/remote/helper/app_exception.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../../utils/constants/app_constants.dart';

class ApiHelper {
  ///get
  getApi() {}

  ///post
  Future<dynamic> postApi({
    required String url,
    Map<String, dynamic>? mBodyParams,
    Map<String, String>? mHeader,
    bool isAuth = false,
  }) async {
    if (!isAuth) {
      mHeader ??= {};

      String token = "";
      ///get user token from prefs
      SharedPreferences prefs = await SharedPreferences.getInstance();
      token = prefs.getString(AppConstants.prefUserToken) ?? "";

      mHeader["Authorization"] = "Bearer $token";
    }

    try {
      var res = await http.post(
        Uri.parse(url),
        body: jsonEncode(mBodyParams),
        headers: mHeader,
      );
      print(res.body);
      return handleResponse(res);
    } on SocketException {
      throw (NetworkException(message: "No Internet Connection"));
    } catch (e) {
      throw (ServerException(message: "Server Error: $e"));
    }
  }

  dynamic handleResponse(http.Response res) {
    switch (res.statusCode) {
      case 200:
        return jsonDecode(res.body);
      case 400:
        throw (InvalidInputException(message: "Bad Request"));
      case 401:
        throw (UnauthorizedException(message: "Unauthorized Access"));
      case 404:
        throw (NetworkException(message: "Not Connected"));
      case 500:
        throw (ServerException(message: "Internal Server Error"));
      default:
        throw (ServerException(message: "Unknown Error: ${res.statusCode}"));
    }
  }
}
