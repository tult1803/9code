import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebaseauthentication/login_page_widget.dart';
import 'package:firebaseauthentication/utils/login_handle.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Logout extends StatelessWidget {
  GoogleSignIn _googleSignIn;
  FirebaseUser _user;
  Logout(FirebaseUser user, GoogleSignIn googleSignIn) {
    _user = user;
    _googleSignIn = googleSignIn;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50.0,
              backgroundImage: NetworkImage(_user.photoUrl),
            ),
            SizedBox(
              height: 30.0,
            ),
            Text(
              'Welcome',
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
            Text(
              _user.displayName,
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Container(
              padding: EdgeInsets.all(
                50.0,
              ),
              child: FlatButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                    20.0,
                  ),
                ),
                onPressed: () {
                  _googleSignIn.signOut();
                  LoginHandle loginHandle = LoginHandle();
                  loginHandle.setSignedIn(false);
                  loginHandle.saveSignedIn();
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => LoginPageWidget()));
                },
                color: Colors.red,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.exit_to_app,
                        size: 30,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      Text(
                        'Sign out',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Text(_user.uid),
          ],
        ),
      ),
    );
  }
}
