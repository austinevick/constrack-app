import 'dart:convert';

UserDetails userDetailsFromJson(String str) =>
    UserDetails.fromJson(json.decode(str));

class UserDetails {
  UserDetails({
    this.code,
    this.body,
    this.status,
  });

  int? code;
  Body? body;
  String? status;

  factory UserDetails.fromJson(Map<String, dynamic> json) {
    if (json['code'] == 200) {
      return UserDetails(
        code: json["code"],
        body: Body.fromJson(json["body"]),
        status: json["status"],
      );
    } else {
      return UserDetails(
        code: json["code"],
        body: Body(),
        status: json["message"],
      );
    }
  }
}

class Body {
  Body({
    this.userData,
    this.userRoles,
    this.tokenString,
    this.businesses,
  });

  UserData? userData;
  List<UserRole>? userRoles;
  String? tokenString;
  List<dynamic>? businesses;

  factory Body.fromJson(Map<String, dynamic> json) => Body(
        userData: UserData.fromJson(json["user_data"]),
        userRoles: List<UserRole>.from(
            json["user_roles"].map((x) => UserRole.fromJson(x))),
        tokenString: json["token_string"],
        businesses: List<dynamic>.from(json["businesses"].map((x) => x)),
      );
}

class UserData {
  UserData({
    this.id,
    this.email,
    this.phone,
    this.date_created,
    this.firstname,
    this.lastname,
    this.is_active,
    this.message,
    this.photo,
    this.player_id,
    this.pword,
    this.reset_key,
    this.role,
  });

  int? id;
  DateTime? date_created;
  String? firstname;
  String? lastname;
  String? email;
  String? pword;
  String? phone;
  String? photo;
  String? reset_key;
  String? is_active;
  String? player_id;
  String? message;
  String? role;

  factory UserData.fromJson(Map<String, dynamic> json) => UserData(
        id: json["id"],
        firstname: json["firstname"],
        lastname: json["lastname"],
        photo: json["photo"],
        pword: json["pword"],
        email: json["email"],
        phone: json["phone_number"],
        role: json["role"],
        date_created: DateTime.parse(json["date_created"]),
        reset_key: json["reset_key"],
        is_active: json["is_active"],
        player_id: json["player_id"],
        message: json["message"],
      );
}

class UserRole {
  UserRole({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.uuid,
    this.roleCode,
    this.role,
  });

  int? id;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic deletedAt;
  String? uuid;
  String? roleCode;
  String? role;

  factory UserRole.fromJson(Map<String, dynamic> json) => UserRole(
        id: json["id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        deletedAt: json["deleted_at"],
        uuid: json["uuid"],
        roleCode: json["role_code"],
        role: json["role"],
      );
}
