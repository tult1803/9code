//import 'package:firebaseauthentication/home.dart';
//import 'package:firebaseauthentication/login_page_widget.dart';
//import 'package:flutter/material.dart';
//
//void main() {
//  runApp(MyApp());
//}
//
//class MyApp extends StatelessWidget {
//  // This widget is the root of your application.
//  @override
//  Widget build(BuildContext context) {
//    return MaterialApp(
//      debugShowCheckedModeBanner: false,
//      title: 'Flutter Demo',
//      theme: ThemeData(
//        primarySwatch: Colors.blue,
//        visualDensity: VisualDensity.adaptivePlatformDensity,
//      ),
//      home: LoginPageWidget(),
//    );
//  }
//}



import 'package:flutter/material.dart';
import 'package:postapi/post_login.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(home: Home());
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String url = "http://13.250.59.224:56321/api/users/login";
  @override
  void initState() {
    super.initState();
    callAPI();
  }

  callAPI() {
    Post post = Post();
    createPost(post, url).then((response) {
      if (response.statusCode == 200) {
        print(response.body);
      } else {
        print(response.statusCode);
      }
    }).catchError((error) {
      print('error : $error');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: FutureBuilder<Post>(
            future: getPost(url, "OAISJFAOISFJASF"),
            builder: (context, snapshot) {
              //callAPI(); // It will get called every time for every build
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasError) {
                  return Text("Error");
                }
                return Text('UserID JSON : ${snapshot.data.userId}');
              } else
                return CircularProgressIndicator();
            }));
  }
}
