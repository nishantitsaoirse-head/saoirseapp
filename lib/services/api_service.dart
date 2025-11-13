import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../constants/app_colors.dart';
import '../constants/app_strings.dart';
import '../widgets/app_text.dart';
import 'package:http/http.dart' as http;

class APIService {
  static bool internet = false;



//  Post Request Funtion
static Future<T?> postRequest<T>({
    required String url,
    required Map<String, dynamic> body,
    required T Function(Map<String, dynamic>) onSuccess,
    Map<String, String>? headers,
    int timeoutSeconds = 15,
  }) async {
    try {
      log("post: $url");
      log("body: $body");

      final response = await http
          .post(
            Uri.parse(url),
            body: jsonEncode(body),
            headers: headers ??
                {
                  "Content-Type": "application/json",
                },
          )
          .timeout(Duration(seconds: timeoutSeconds));

      log("Response [${response.statusCode}]: ${response.body}");

      //  status code handling
      switch (response.statusCode) {
        case 200:
        case 201:
          final data = jsonDecode(response.body);
          if (data is! Map<String, dynamic>) {
            throw Exception("Invalid response format received from server.");
          }
          return onSuccess(data);

        case 204:
          throw Exception("No data available.");

        case 400:
          throw Exception("Bad request. Check parameters.");

        case 401:
          throw Exception("Unauthorized. Please log in again.");

        case 403:
          throw Exception("Forbidden. Access denied.");

        case 404:
          throw Exception("Resource not found (404).");

        case 408:
          throw Exception("Request timeout. Try again later.");

        case 429:
          throw Exception("Too many requests. Try again later.");

        default:
          if (response.statusCode >= 500) {
            throw Exception("Server error (${response.statusCode}). Try later.");
          } else {
            throw Exception(
                "Unexpected error (${response.statusCode}). Please try again.");
          }
      }
    } on SocketException {
      throw Exception("No internet connection. Check your network.");
    } on FormatException {
      throw Exception("Invalid response format.");
    } on TimeoutException {
      throw Exception("Request timed out. Please try again.");
    } on http.ClientException catch (e) {
      throw Exception("Network error occurred: $e");
    } catch (e) {
      throw Exception("Something went wrong: ${e.toString()}");
    }
  }


//  Get Request Funtion 
  static Future<T?> getRequest<T>({
  required String url,
  required T Function(Map<String, dynamic>) onSuccess,
  Map<String, String>? headers,
  int timeoutSeconds = 15,
}) async {
  try {
    log("get: $url");

    final response = await http
        .get(
          Uri.parse(url),
          headers: headers ??
              {
                "Content-Type": "application/json",
              },
        )
        .timeout(Duration(seconds: timeoutSeconds));

    log("Response [${response.statusCode}]: ${response.body}");

    // status handling
    switch (response.statusCode) {
      case 200:
      case 201:
        final data = jsonDecode(response.body);

        if (data is! Map<String, dynamic>) {
          throw Exception("Invalid response format received from server.");
        }

        return onSuccess(data);

      case 204:
        throw Exception("No data available.");

      case 400:
        throw Exception("Bad request. Check parameters.");

      case 401:
        throw Exception("Unauthorized. Please log in again.");

      case 403:
        throw Exception("Forbidden. Access denied.");

      case 404:
        throw Exception("Resource not found. (404)");

      case 408:
        throw Exception("Request timeout. Try again later.");

      case 429:
        throw Exception("Too many requests. Try again later.");

      default:
        if (response.statusCode >= 500) {
          throw Exception("Server error (${response.statusCode}). Try later.");
        } else {
          throw Exception(
              "Unexpected error (${response.statusCode}). Please try again.");
        }
    }
  } on SocketException {
    throw Exception("No internet connection. Check your network.");
  } on FormatException {
    throw Exception("Invalid response format.");
  } on TimeoutException {
    throw Exception("Request timed out. Please try again.");
  } on http.ClientException catch (e) {
    throw Exception("Network error occurred: $e");
  } catch (e) {
    throw Exception("Something went wrong: ${e.toString()}");
  }
}



  

  static checkConnection(BuildContext context) {
    Connectivity().checkConnectivity().then((result) {
      if (result == ConnectivityResult.none) {
        internet = false;

        Get.showSnackbar(
          GetSnackBar(
            isDismissible: false,
            borderRadius: 5,
            margin: EdgeInsets.symmetric(vertical: 10.h, horizontal: 15.w),
            backgroundColor: AppColors.red,
            messageText: appText(
              AppStrings.no_internet,
              color: AppColors.white,
              textAlign: TextAlign.left,
              fontSize: 12.sp,
              fontWeight: FontWeight.w400,
            ),
            mainButton: IconButton(
              onPressed: () {
                Get.closeAllSnackbars();
              },
              icon: Icon(Icons.close, size: 18.sp, color: AppColors.white),
            ),
          ),
        );
      }
    });

    Connectivity().onConnectivityChanged.listen((result) {
      if (result == ConnectivityResult.none) {
        internet = false;

        Get.showSnackbar(
          GetSnackBar(
            isDismissible: false,
            borderRadius: 5,
            margin: EdgeInsets.symmetric(vertical: 10.h, horizontal: 15.w),
            backgroundColor: AppColors.red,
            messageText: appText(
              AppStrings.no_internet,
              color: AppColors.white,
              textAlign: TextAlign.left,
              fontSize: 12.sp,
              fontWeight: FontWeight.w400,
            ),
            mainButton: IconButton(
              onPressed: () {
                Get.closeAllSnackbars();
              },
              icon: Icon(Icons.close, size: 18.sp, color: AppColors.white),
            ),
          ),
        );
      } else {
        internet = true;
        Get.closeAllSnackbars();
      }
    });
  }
}
