import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  static final UserPreferences _instance = UserPreferences._internal();

  factory UserPreferences() {
    return _instance;
  }

  UserPreferences._internal();

  SharedPreferences? _prefs;

  initPrefs() async {
    _prefs = await SharedPreferences.getInstance();
  }

  String get userID {
    return _prefs!.getString('userID') ?? '';
  }

  set userID(String value) {
    _prefs!.setString('userID', value);
  }

  bool get userAdmin {
    return _prefs!.getBool('userAdmin') ?? false;
  }

  set userAdmin(bool value) {
    _prefs!.setBool('userAdmin', value);
  }

  String get userName {
    return _prefs!.getString('userName') ?? '';
  }

  set userName(String value) {
    _prefs!.setString('userName', value);
  }

  String get userEmail {
    return _prefs!.getString('userEmail') ?? '';
  }

  set userEmail(String value) {
    _prefs!.setString('userEmail', value);
  }


  String get userProfileImage {
    return _prefs!.getString('userProfileImage') ?? '';
  }

  set userProfileImage(String value) {
    _prefs!.setString('userProfileImage', value);
  }

  void clearAllPreferences() {
    userName = '';
    userID = '';
    userEmail = '';
    userProfileImage = '';
  }
}
