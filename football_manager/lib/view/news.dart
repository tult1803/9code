
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:football_manager/url/url.dart';
import 'package:football_manager/view/details_news.dart';
import 'package:google_fonts/google_fonts.dart';

class NewsPage extends StatefulWidget {
  @override
  NewsPageState createState() => NewsPageState();
}

class NewsPageState extends State<NewsPage> {
  static String tappedNews ='';
  static String tappedTime ='';
  static String tappedSales ='';
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage(url_imgbackground_welcome))
      ),
      child: Container(
        color: Colors.white10,
        child: SafeArea(
          child: Column(
            children: [
              Container(
                height: 120,
                // width: size.width,
                child: Column(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left:10.0, right: 10.0),
                        child: Container(
                          // color: Colors.blue,
                          child: Row(
                            children: [
                              _conHeader(context, 'images/iconDatSan.png', 'Đặt sân', Icon(Icons.airplanemode_active_outlined, size: 30,)),
                              _conHeader(context, 'images/iconGanNhat.png', 'Gần nhất', Icon(Icons.location_pin, size: 30,)),
                              _conHeader(context, 'images/iconDatSan.png', 'Giá tốt', Icon(Icons.monetization_on, size: 30,)),
                              _conHeader(context, 'images/iconDatSan.png', 'Hot nhất', Icon(Icons.local_fire_department_sharp, size: 30,)),
                            ],
                          )
                        ),
                      ),
                    ),
                    SizedBox(height: 10,),
                    Text('Tin tức & Khuyến mãi', style: TextStyle(fontSize: 23, fontWeight: FontWeight.w700, decoration: TextDecoration.underline),),
                  ],
                ),
              ),
              Expanded(
                child: ListView(
                  children: [
                    SizedBox(height: 5,),
                    tintuc('8h - 13h','SWD', 20, 4.5, 15, 4.5),
                    tintuc('10h - 13h','HCI', 25, 5, 5, 2),
                    tintuc('16h - 22h','ACC', 30,3, 30, 6.3),
                    tintuc('15h - 19h','ISC', 10, 4, 24, 5.5),
                    tintuc('20h - 22h','PRM', 50, 3.5, 43, 8),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _conHeader(BuildContext context, String urlImg, String txt, Icon icon){
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(left:5.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white60,
          borderRadius: BorderRadius.circular(10),
        ),
        // color: Colors.white10,
        width: (size.width - 40)/4,
        child: FlatButton(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          onPressed: () {

          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Image(image: AssetImage(urlImg),height: 50,),
              icon,
              SizedBox(height: 10,),
              Text(txt, style: TextStyle(fontWeight: FontWeight.w500, fontSize: 13),),
            ],
          ),
        ),
      ),
    );
  }
  Widget tintuc(String time, String soccer_field, int sale, double start , int timeToCome, double far){
    return Card(
      margin: EdgeInsets.only(left: 10, right: 10,top: 10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Container(
          height: 110,
          decoration: BoxDecoration(
            color: Colors.white70,
            border: Border.all(color: Colors.black54),
            borderRadius: BorderRadius.circular(20),
          ),
          child:  FlatButton(
            onPressed: () {
              setState(() {
                tappedNews = soccer_field;
                tappedTime = time;
                tappedSales = sale.toString();
              });
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => DetailsNews()));
            },
            child: Row(
              children: [
                Container(
                  width: 80,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.attach_money, size: 50, color: Colors.red,),
//                    Padding(
//                      padding:  EdgeInsets.only(top:8.0),
//                      child: Text("$sale%", style: TextStyle(
//                        fontSize: 20,
//                        color: Colors.red,
//                        fontWeight: FontWeight.w700,
//                      ),),
//                    )
                    ],
                  ),
                ),
                Expanded(child: Container(
//                    color: Colors.redAccent,
//                  padding: EdgeInsets.only(left: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ListTile(
                        title: Text("Sân bóng ${soccer_field}",style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),),
                        subtitle: Row(
                          children: [
                            Text('$time  ',style: TextStyle(
                              fontSize: 20,
                            ),),
                            Text('$start' , style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w500),),
                            Icon(Icons.star ,color: Colors.black,),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(Icons.watch_later_outlined, size: 15,),
                            Text('15p - 4km' , style: TextStyle(color: Colors.black, fontSize: 15),),
                            // Icon(Icons.),
                          ],
                        ),
                      ),
                      SizedBox(height: 10,),
                    ],
                  ),
                )),
                Container(
                  width: 80,
                  child: Text('$sale%', style: GoogleFonts.zeyada(fontSize: 50, color: Colors.red, fontWeight: FontWeight.w600),),
                )
              ],),
          )
      ),
    );
  }
}
