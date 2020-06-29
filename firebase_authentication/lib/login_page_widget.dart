import 'package:firebaseauthentication/home.dart';
import 'package:firebaseauthentication/utils/login_handle.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';


class LoginPageWidget extends StatefulWidget {
  @override
  LoginPageWidgetState createState() => LoginPageWidgetState();
}

class LoginPageWidgetState extends State<LoginPageWidget> {
  static String UserUID = "";
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  bool _isSignedIn = true;
  LoginHandle loginHandle = LoginHandle();

  Future<FirebaseUser> _handleSignIn() async {
    // hold the instance of the authenticated user
    FirebaseUser user;
    if (_isSignedIn) {
      //flag to check whether we 're signed in already
      bool isSignedIn = await _googleSignIn.isSignedIn();
      if (isSignedIn) {
        //if so, return the current user
        user = await _auth.currentUser();
      } else {
        final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
        final GoogleSignInAuthentication googleAuth =
            await googleUser.authentication;
        // get the credentials to (access / id token)
        // to sign in via Firebase Authentication
        String idToken = googleAuth.idToken;
        String accessToken = googleAuth.accessToken;
        final AuthCredential credential = GoogleAuthProvider.getCredential(
            idToken: idToken, accessToken: accessToken);
        user = (await _auth.signInWithCredential(credential)).user;
      }
      loginHandle.setSignedIn(true);
      loginHandle.saveSignedIn();
    } else {
      user = null;
    }
    return user;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    loginHandle.checkSignedIn().whenComplete(() {
      _isSignedIn = loginHandle.getSignedIn();
      onGoogleSignIn(context);
    });
//    _isSignedIn = loginHandle.getSignedIn();
  }

  void onGoogleSignIn(BuildContext context) async {
    FirebaseUser user = await _handleSignIn();
    if (user != null) {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
//              builder: (context) => WelcomeUserWidget(user, _googleSignIn)));
              builder: (context) => Home()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: EdgeInsets.all(
            50.0,
          ),
          child: FlatButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                20,
              ),
            ),
            onPressed: () async{
              _isSignedIn = true;
             await onGoogleSignIn(context);
            },
            color: Colors.blueAccent,
            child: Padding(
              padding: EdgeInsets.all(
                10.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/logo.png',
                    width: 30,
                    height: 30,
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Text(
                    'Sign in with Google',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
