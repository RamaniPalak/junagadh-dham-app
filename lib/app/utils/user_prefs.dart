
import 'package:shared_preferences/shared_preferences.dart';

class UserPrefs{

  static UserPrefs shared = UserPrefs();

  // Set Local Data here
  Future setLocalData({required LocalUser user}) async {

    final SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setBool('IS_USER_LOGIN', user.isLogin);
    prefs.setString('USER_EMAIL', user.email);
  }

  // Clear Local here
  Future<bool> clear() async {

    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.clear();

  }

  // Get User here
  Future<LocalUser> get getUser => _getUser();

  Future<LocalUser> _getUser() async{

    final SharedPreferences prefs = await SharedPreferences.getInstance();

    bool isLogin = prefs.getBool('IS_USER_LOGIN') ?? false;
    String email = prefs.getString('USER_EMAIL') ?? '';
    return LocalUser(isLogin: isLogin, email: email);
  }

  // Get is login here
  Future<bool> get isUserLogin => _isUserLogin();

  Future<bool> _isUserLogin() async{

    final SharedPreferences prefs = await SharedPreferences.getInstance();

    bool isLogin = prefs.getBool('IS_USER_LOGIN') ?? false;

    return isLogin;
  }

}


class LocalUser{

  final bool isLogin;
  final String email;

  LocalUser(
      {required this.isLogin, required this.email});

}