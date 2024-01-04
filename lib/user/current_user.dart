


import 'package:get/get.dart';
import 'package:ovantica/user/user.dart';
import 'package:ovantica/user/user_preference.dart';

class CurrentUser extends GetxController
{
  Rx<Users> _currentUser = Users(mobile: '', username: '', email: '',).obs;
  Users get users => _currentUser.value;
  getUserInfo() async
  {
    Users? getUserInfoFromLocalStorage = await RememberUserPrefs.readUserInfo();
    _currentUser.value = getUserInfoFromLocalStorage! ;
  }
}