import 'dart:convert';

import 'package:constrack/provider/response/response.db.dart';

class LoginModel {
  LoginModel({
    this.id,
    this.firstname,
    this.lastname,
    this.photo,
    this.pword,
    this.email,
    this.phone,
    this.role,
    this.dateCreated,
    this.resetKey,
    this.isActive,
    this.playerId,
    this.message,
  });

  String? id;
  String? firstname;
  String? lastname;
  String? pword;
  String? email;
  String? phone;
  String? role;
  String? dateCreated;
  String? resetKey;
  String? isActive;
  String? message;
  dynamic playerId;
  dynamic photo;

  factory LoginModel.fromJson(String str) {
    if (str.isNotEmpty) {
      /// Decode the Result
      var decoded = json.decode(str);

      /// Parse the result as map
      Map<String, dynamic> result = decoded ?? {};

      /// Validate the result
      if (result.isNotEmpty && result["message"] == ResponseDB.success) {
        /// If Login Success
        return LoginModel(
          id: result["id"],
          firstname: result["firstname"],
          lastname: result["lastname"],
          photo: result["photo"],
          pword: result["pword"],
          email: result["email"],
          phone: result["phone"],
          role: result["role"],
          dateCreated: result["date_created"],
          resetKey: result["reset_key"],
          isActive: result["is_active"],
          playerId: result["player_id"],
          message: result["message"],
        );
      }
    }

    /// If Login Failed
    return LoginModel(message: ResponseDB.failed);
  }

  /// If Api isn't Working or Getting Some Error
  factory LoginModel.error() {
    return LoginModel(message: ResponseDB.empty);
  }
}
