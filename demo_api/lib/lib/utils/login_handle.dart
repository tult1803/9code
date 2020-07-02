import 'package:shared_preferences/shared_preferences.dart';

class LoginHandle {
  bool _isSignedIn;
  String _useruid;
  bool getSignedIn() {
    return _isSignedIn;
  }

  void setSignedIn(bool isSignedIn) {
    _isSignedIn = isSignedIn;
  }

  Future<void> checkSignedIn() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _isSignedIn = (prefs.getBool('isSignedIn') ?? false);
  }

  void saveSignedIn() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isSignedIn', _isSignedIn);
  }

  String getSignedIn1() {
    return _useruid;
  }

  void setSignedIn1(String useruid) {
    _useruid = useruid;
  }

  Future<void> checkSignedIn1() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _useruid = (prefs.getString('useruid') ?? null);
  }
  void saveSignedIn1() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('useruid', _useruid);
  }
}
