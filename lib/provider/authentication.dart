import 'dart:convert';
import 'package:constrack/provider/models/auth/login/login.model.auth.dart';
import 'package:constrack/provider/response/response.db.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AuthProvider extends ChangeNotifier {
  // late String _token;
  // late String _expiryDate;
  // late String _userId;

  /// User Account Details
  LoginModel _userDetails = LoginModel();
  LoginModel get userDetails => _userDetails;

  /// This Variable Hold the loading state
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<String> signup({
    String? firstname,
    String? lastname,
    String? email,
    String? pword,
    String? phone,
    String? key,
  }) async {
    final _uri = Uri.parse('https://constrack.ng/mobile/api/register');

    /// Change Loading to [true]
    updateLoadingState(true);

    try {
      final _response = await http.post(
        _uri,
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'firstname': firstname,
          'lastname': lastname,
          'email': email,
          'password': pword,
          'phone': phone,
          'key': key,
          //'returnSecureToken': true,
        }),
      );

      /// Change Loading to [false]
      updateLoadingState(false);

      /// Let's validate the api response
      if (_response.body.isNotEmpty) {
        /// Decode the api result
        final decode = json.decode(_response.body);
        if (decode != null) {
          /// Get the request status
          final result = decode['message'];
          if (result != null && result == ResponseDB.success) {
            return ResponseDB.success;
          }
        }
      }

      /// If api have any issue then we will return a empty string
      return ResponseDB.empty;
    } catch (e) {
      /// Change Loading to [false]
      updateLoadingState(false);

      /// If we caught any error
      return ResponseDB.failed;
    }
  }

  ///Login API
  ///
  Future<LoginModel> signin(
    String? email,
    String? pword,
    String? key,
  ) async {
    final _uri = Uri.parse('https://constrack.ng/mobile/api/login');

    /// Change Loading to [true]
    updateLoadingState(true);
    try {
      final _response = await http.post(
        _uri,
        body: json.encode({
          'email': email,
          'password': pword,
          'key': key,
          //'returnSecureToken': true,
        }),
      );

      /// Change Status to Fasle
      updateLoadingState(false);

      LoginModel result = LoginModel.fromJson(_response.body);

      /// Pass Details to Provider
      _userDetails = result;

      /// Retrun the response
      print(_response.body);
      return _userDetails;
    } catch (e) {
      /// Change Loading to [false]
      updateLoadingState(false);

      /// If we caught any error
      return LoginModel.error();
    }
  }

  /// This Function will update Loading State
  void updateLoadingState(bool state) {
    _isLoading = state;
    notifyListeners();
  }
}
