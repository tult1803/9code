import 'package:flutter/material.dart';
import 'package:passiomanager/BottomBar/Report.dart';
import 'package:passiomanager/loginpage/login_screen.dart';

import 'Overview/overview/overview/overview_page.dart';
//
//void main() {
//  runApp(MaterialApp(
//    debugShowCheckedModeBanner: false,
//    home: _PassioManager(),
//  ));
//}

class Profile extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return ProfileState();
  }
}

class ProfileState extends State<Profile>{
  int _selectedPage = 2;
  final _pageOptions = [ // Thay Text bằng class để Na
    OverviewPage(),
    Report(),
    Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Container(
        color: Color.fromARGB(255, 241, 243, 246),
        child: Stack(
          children: <Widget>[
            Container(
              height: size.height * .30,
              //width: size.width,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage("images/profile.png"))
              ),
            ),
            Container(
              child: SafeArea(
                  child: Column(
                    children: <Widget>[
                      Container(
                          margin: EdgeInsets.symmetric(horizontal: 30, vertical: 50),
                          height: 80,
                          child: Row(
                            children: <Widget>[
                              CircleAvatar(
                                radius: 40.0,
                                backgroundImage: AssetImage("images/iconpassio.jpg"),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 15),
                                child: Column(
                                  children: <Widget>[
                                    Container(
                                        margin: EdgeInsets.only(left: 30),
                                        child:Text(
                                            "Xin chào, Passio",
                                            style: const TextStyle(
                                                color:  Colors.white,
                                                fontWeight: FontWeight.w800,
                                                fontSize: 18.0
                                            )
                                        )
                                    ),
                                    Container(
                                        margin: EdgeInsets.only(left: 30, top: 10),
                                        child: Text(
                                            "admin.passio@coffee",
                                            style: const TextStyle(
                                                color:  Colors.white,
                                                fontWeight: FontWeight.w400,
                                                fontSize: 15.0
                                            )
                                        )
                                    ),
                                  ],
                                ),
                              )
                            ],
                          )
                      ),
                      Align(
                        alignment: Alignment.topCenter,
                        child: Center(
                            child: Container(
                              width: size.width * 0.9,
                              height: 180,
                              decoration: new BoxDecoration(
                                color: Colors.white,
                                border: new Border.all(color: Colors.white, width: 2.0),
                                borderRadius:  new BorderRadius.circular(10.0),
                              ),
                              child: Container(
                                padding: EdgeInsets.all(10.0),
                                child: Column(
                                  children: <Widget>[
                                    Text(
                                        "Vui lòng gọi đến Hotline hoặc gửi mail cho chúng tôi để được hỗ trợ kĩ thuật 24/7.",
                                        style: const TextStyle(
                                            color: Colors.grey,
                                            fontWeight: FontWeight.w700,
                                            fontSize: 15.0
                                        )
                                    ),
                                    Container(
                                      padding: EdgeInsets.only(top: 20.0),
                                      child: Row(
                                        children: <Widget>[
                                          Icon(
                                            Icons.phone,
                                            size: 30.0,
                                            color: Colors.grey,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(left: 20.0),
                                            child: Text("1900 1234", style: TextStyle(
                                                fontSize: 20.0
                                            ),),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        // padding: EdgeInsets.only(top: 0.0),
                                        child: Row(
                                          children: <Widget>[
                                            Icon(
                                              Icons.email,
                                              size: 30.0,
                                              color: Colors.grey,
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(left: 20.0),
                                              child: Text("support@gmail.com", style: TextStyle(
                                                  fontSize: 20.0
                                              ),),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 20.0),
                        height: 50,
                        width: 150,
//                                  color: Colors.white,
                        child: FlatButton(
                            onPressed: () {
                              Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => LoginScreen()), (route) => false);
                            },
                            child: Text("Đăng xuất",
                              style: TextStyle(
                                color: Colors.red,
                                fontSize: 18,
                              ),)),
                      )
                    ],
                  )
              ),
            ),
          ],
        ),
      ),



      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 2,
        onTap: (int index) {
          setState(() {
            if(index != 2) {
              _selectedPage = index;
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => _pageOptions[_selectedPage]),
                      (route) => false);
            }});
        },
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.assessment), title: Text("Tổng Quan")),
          BottomNavigationBarItem(
              icon: Icon(Icons.assignment), title: Text("Báo Cáo")),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle), title: Text("Cá Nhân")),
        ],
      ),
    );
  }


}