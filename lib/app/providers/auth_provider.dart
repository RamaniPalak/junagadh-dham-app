import 'package:flutter/cupertino.dart';
import 'package:junagadh_temple/app/utils/user_prefs.dart';


class AuthProvider {
  Future getUserFromLocal() async {}

  Future logInUser() async {}

  Future logOutUser() async {}

  Future unAuthorizeUser() async {}
}

class AuthProviderImpl extends ChangeNotifier implements AuthProvider{

  AuthProviderImpl(){
    getUserFromLocal();
  }

  bool? isLogin;

  @override
  Future getUserFromLocal() async{
    // TODO: implement getUserFromLocal

    isLogin = await UserPrefs.shared.isUserLogin;

    print('is User Logged in: $isLogin');

    notifyListeners();
  }

  @override
  Future logInUser() async {
    // TODO: implement logInUser

    await UserPrefs.shared.setLocalData(user: LocalUser(isLogin: true, email: 'email'));

    isLogin = true;

    notifyListeners();

  }

  @override
  Future logOutUser() async {
    // TODO: implement logOutUser
    await UserPrefs.shared.clear();

    isLogin = false;

    notifyListeners();
  }

  @override
  Future unAuthorizeUser() async {
    // TODO: implement unAuthorizeUser
    await UserPrefs.shared.clear();

    isLogin = false;

    notifyListeners();
  }

}