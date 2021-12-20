import 'package:constrack/provider/response/response.db.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginLocalDB {
  /// Login Credentails Keys
  static const String uidKey = "uidkey";
  static const String pwdKey = "pwdkey";

  Future<Map<String, String>> get getCredentials async {
    /// Get Shared Preferences Instance
    SharedPreferences prefs = await SharedPreferences.getInstance();

    /// make a Map and return details
    return {
      uidKey: prefs.getString(uidKey) ?? ResponseDB.empty,
      pwdKey: prefs.getString(pwdKey) ?? ResponseDB.empty,
    };
  }

  /// Store User Credentails
  Future<void> storeCredentails(
      {required String uid, required String pwd}) async {
    /// Get Shared Preferences Instance
    SharedPreferences prefs = await SharedPreferences.getInstance();

    /// Store Details
    await prefs.setString(uidKey, uid);
    await prefs.setString(pwdKey, pwd);
    return;
  }
}


/// Please Check
/// all good
/// lets talk on skype
/// ?
/// can weOokklol