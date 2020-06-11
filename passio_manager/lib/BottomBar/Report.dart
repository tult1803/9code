import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:passiomanager/BottomBar/Profile.dart';
import 'dart:math' as math;

import 'package:passiomanager/Filter/Filter_Report.dart';

import 'Overview/overview/overview/overview_page.dart';
import 'Overview/overview/utils/colors.dart';
class Report extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return ReportState();
  }
}

class ReportState extends State<Report>{
  int _selectedPage = 1;
  final _pageOptions = [ // Thay Text bằng class để Na
    OverviewPage(),
    Report(),
    Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var store = "Passio Xô Viết Nghệ Tĩnh";
    var sdate = "12/08/2018";
    var edate = "19/08/2018";
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Container(
        color: Color.fromARGB(255, 241, 243, 246),
        child: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              expandedHeight: 200.0,
              flexibleSpace: FlexibleSpaceBar(
                background: Image.asset('images/profile.png', fit: BoxFit.cover),
                title: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: size.width,
                    height: 130.0,
                    child: SafeArea(
                      child: Container(
                        child: Row(
                          children: <Widget>[
                            Column(
                              children: <Widget>[
                                Expanded(child: SizedBox()),
                                Container(
                                  margin: const EdgeInsets.only(right: 50.0),
                                  child: Text(
                                    "$store",
                                    style: TextStyle(
                                      fontSize: 13.0,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 80.0),
                                  child: Row(
                                    children: <Widget>[
                                      Text(
                                        "$sdate",
                                        style: TextStyle(
                                          fontSize: 10.0,
                                        ),
                                      ),
                                      Text(
                                        "  -  ",
                                        style: TextStyle(
                                          fontSize: 10.0,
                                        ),
                                      ),

                                      Text(
                                        "$edate",
                                        style: TextStyle(
                                          fontSize: 10.0,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
          title: Text(
            'Báo cáo',
            style: TextStyle(
             // color: appBarColor,
              fontSize: 24.0,
              fontFamily: 'Muli',
              fontWeight: FontWeight.w800,
            ),
          ),
//        leading: SizedBox(),
          backgroundColor: Colors.white,
          actions: <Widget>[
            IconButton(
              icon: Image.asset("images/filter_white.png"),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => FilterReport()));
              },
            ),
            IconButton(
              icon: Image.asset("images/share_white.png"),
              onPressed: () {
                print('You have pressed share button');
              },
            ),
          ],
            ),

            SliverFixedExtentList(
              itemExtent: 110.0,
              delegate: SliverChildListDelegate(
                [
                  container(context, "images/products/ex01.png", "Iced Expresso With Milk", "7360000", "15", "254"),
                  container(context, "images/products/ex02.png", "Iced Expresso ", "4725000", "10", "189"),
                  container(context, "images/products/hot_americano.png", "Hot Americano", "1250000", "2", "54"),
                  container(context, "images/products/hot_cappuccino.png", "Hot Cappuccino", "1800000", "2", "123"),
                  container(context, "images/products/iced_cappuccino.png", "Iced Cappuccino", "1540000", "7", "104"),
                  container(context, "images/products/latte.png", "Iced Cafe Latte", "850000", "2", "14"),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1,
        onTap: (int index) {
          setState(() {
            if(index != 1) {
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

  Widget container(BuildContext context, String img, String name, String total, String per, String pro_total){
    var size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Row(
          children: <Widget>[
            Image(
              image: AssetImage("$img"),
            ),
            Expanded(
              child: Container(
                child: Column(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(left: 10),
                      width: size.width,
                      child: RichText(
                          text: TextSpan(
                              children: [
                                TextSpan(
                                    style: const TextStyle(
                                        color:  const Color(0xff53584e),
                                        fontWeight: FontWeight.w400,
                                        fontFamily: "Muli",
                                        fontStyle:  FontStyle.normal,
                                        fontSize: 18.0
                                    ),
                                    text: "$name"),
                              ]
                          )
                      ),
                    ),
                    Expanded(
                      child: Center(
                        child: Container(
                          padding: EdgeInsets.only(left: 10),
                          width: size.width,
                          child: RichText(
                              text: TextSpan(
                                  children: [
                                    TextSpan(
                                        style: const TextStyle(
                                            color:  const Color(0xff53584e),
                                            fontWeight: FontWeight.w400,
                                            fontFamily: "Muli",
                                            fontStyle:  FontStyle.normal,
                                            fontSize: 22.0
                                        ),
                                        text: "$total đ"),
                                  ]
                              )
                          ),
                        ),
                      ),
                    ),
                    Container(
                        padding: EdgeInsets.only(left: 10),
                        width: size.width,
                        child: RichText(
                            text: TextSpan(
                                children: [
                                  TextSpan(
                                      style: const TextStyle(
                                          color:  const Color(0xffa6ce39),
                                          fontWeight: FontWeight.w700,
                                          fontFamily: "Muli",
                                          fontStyle:  FontStyle.normal,
                                          fontSize: 14.0
                                      ),
                                      text: "$per% • $pro_total SP"),
                                ]
                            )
                        )  ),
                  ],
                ),
              ),
            ),
            Container(
              width: 30,
              height: size.height,
              child: Image(image: AssetImage("images/arrow_right.png"), fit: BoxFit.fitWidth,),
            )
          ],
        ),
      ),
    );
  }
}
