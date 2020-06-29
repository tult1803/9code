import 'package:shared_preferences/shared_preferences.dart';

class LoginHandle {
  bool _isSignedIn;
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
}
