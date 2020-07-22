

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:passiomanager/loginpage/login_screen.dart';
import 'package:passiomanager/BottomBar/Overview/overview/overview/overview_page.dart';



class SelectStore extends StatefulWidget {
  @override
  _SelectStoreState createState() => _SelectStoreState();
}

class _SelectStoreState extends State<SelectStore> {
  int selectedPosition = 0;

  //int group = 1;

//  ListView _buildListView(){
//    final List<String> storeList = [
//      "62VTS.BH", "16.HVH.HCM", "285.CMT8.HCM", "Văn Phòng", "Kho Trung Tâm", "50.PVK.HCM"
//    ];
////     Container (
////      child: new
//    return ListView.builder(
//          itemCount: storeList.length,
//          itemBuilder: (BuildContext context, int index) {
//            return Container(
//              child: Card(
//                child: Column( crossAxisAlignment: CrossAxisAlignment.start,
//                  children: <Widget>[
//
////                      Icon(
////                      Icons.sentiment_neutral,
////                      color: Colors.black,
////                    ),
////                    Text(index.toString()),
////                    Text(storeList[index]),
//                  ],
//                ),
//              ),
//            );
//          }
////      ),
//    );
//
//  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(241, 243, 246, 4),

      appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.black,),
              onPressed: () {
                Navigator.push(context,MaterialPageRoute(builder: (context) => LoginScreen()),
                );
              }),
          title: Text("Chọn cửa hàng",style: TextStyle(color: Colors.black)),
          actions: <Widget>[
            IconButton(icon: Icon(Icons.search, color: Colors.black,),
                onPressed: null),



          ]
      ),
      body: Container(child: ListView(children: <Widget>[


        ListTile(
          leading: Radio(value: 0,groupValue: selectedPosition,onChanged: (val){
            print("selected $val");
            setState(() {
              selectedPosition = val;
            });

          }),
          title: Text("Tất cả cửa hàng", style: TextStyle(fontFamily: 'Muli',fontSize: 20)),

          contentPadding: EdgeInsets.fromLTRB(16, 16, 16, 4),
          //subtitle: Text("Sample Subtitle"),
        ),
        ListTile(
          leading: Radio(value: 1,groupValue: selectedPosition,onChanged: (val){
            print("selected $val");
            setState(() {
              selectedPosition = val;
            });
          }),
          title: Text("62VTS.BH", style: TextStyle(fontFamily: 'Muli',fontSize: 20)),
          subtitle: Text("62 Võ Thị Sáu, Quyết Thắng, Thành phố Biên Hoà, Đồng Nai, Việt Nam"),
        ),

        ListTile(
          leading: Radio(value: 2,groupValue: selectedPosition,onChanged: (val){
            print("selected $val");
            setState(() {
              selectedPosition = val;
            });
          }),
          title: Text("16.HVH.HCM", style: TextStyle(fontFamily: 'Muli',fontSize: 20)),
          subtitle: Text("16 Hồ Văn Huê, phường 9, Phú Nhuận, Ho Chi Minh City, Vietnam"),
        ),
        ListTile(
          leading: Radio(value: 3,groupValue: selectedPosition,onChanged: (val){
            print("selected $val");
            setState(() {
              selectedPosition = val;
            });
          }),
          title: Text("285CMT8.HCM", style: TextStyle(fontFamily: 'Muli',fontSize: 20)),
          subtitle: Text("285 Cách Mạng Tháng 8, Phường 12, District 10, Ho Chi Minh City, Vietnam"),
        ),
        ListTile(
          leading: Radio(value: 4,groupValue: selectedPosition,onChanged: (val){
            print("selected $val");
            setState(() {
              selectedPosition = val;
            });
          }),
          title: Text("Văn phòng", style: TextStyle(fontFamily: 'Muli',fontSize: 20)),
          subtitle: Text("227 Xô Viết Nghệ Tỉnh, Ho Chi Minh City, Vietnam"),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 24.0,vertical: 80),
          width: double.infinity,
          child: RaisedButton(

          elevation: 15.0,
          onPressed: () {
            print('Done Button Pressed');
            Navigator.push(context,MaterialPageRoute(builder: (context) => OverviewPage()),
            );
          },
          padding: EdgeInsets.all(15.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
          color: Color.fromRGBO(166, 206, 57, 4),
          child: Text(
            'Xong',
            style: TextStyle(
              color: Colors.white,
              letterSpacing: 3.5,
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        ),
//        FloatingActionButton(
//
//          elevation: 15.0,
//          onPressed: () {
//            print('Done Button Pressed');
//            Navigator.push(context,MaterialPageRoute(builder: (context) => null),
//            );
//        },
//          shape: RoundedRectangleBorder(
//            borderRadius: BorderRadius.circular(30.0),
//          ),
//          backgroundColor: Color.fromRGBO(166, 206, 57, 4),
//
//        child: Text('Xong',style: TextStyle(
//          color: Colors.white,
//          letterSpacing: 3.5,
//          fontSize: 18.0,
//          fontWeight: FontWeight.bold,
//        ),),
//        ),
//      Positioned(bottom: 5.0,
//
//
//      child: RaisedButton(child: Text('Hi'),
//        shape: RoundedRectangleBorder(
//          borderRadius: BorderRadius.circular(30.0),
//
//        ),
//        color: Color.fromRGBO(166, 206, 57, 4),
//
//
//
//      onPressed: () {},
//      ),
//      ),
      ],

    ),

    ) //AnnotatedRegion<SystemUiOverlayStyle>(
        //value: SystemUiOverlayStyle.light,
        //child: GestureDetector(
          //onTap: () => FocusScope.of(context).unfocus(),

////          child: Stack(
////            children: <Widget>[
////              Container(
////                height: double.infinity,
////                width: double.infinity,
////              ),
////              Container(
////                height: double.infinity,
////                child: SingleChildScrollView(
////                  physics: AlwaysScrollableScrollPhysics(),
////                  padding: EdgeInsets.symmetric(
////                    horizontal: 40.0,
////                    vertical: 10.0,
////                  ),
//////                  child: Column(
//////                    mainAxisAlignment: MainAxisAlignment.center,
//////                    children: <Widget>[
//////                      _buildListView(),
//////
//////
//////
//////                    ],
//////                  ),
////                child: _buildListView(),
////                ),
////
////              )
////            ],
////          ),
//          child: _buildListView(),
        //),
     // ),

    );
  }
}












