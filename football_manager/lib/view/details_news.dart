

import 'package:flutter/material.dart';
import 'package:football_manager/url/url.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:football_manager/view/news.dart';

class DetailsNews extends StatefulWidget {
  @override
  _DetailsNewsState createState() => _DetailsNewsState();
}

class _DetailsNewsState extends State<DetailsNews> {
  String tappedNews, tappedTime, tappedSale;
  String address;
  String phone;
  String timeOpen;
  String admin;
  String price;
  String saleCode;
  String note = 'Bạn chỉ được đặt sân ngoài khung giờ trên. Thân chào, quyết thắng và thân ái !!!';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getTapped();
    _checkTapped();
  }

  void _getTapped(){
    setState(() {
      tappedNews = NewsPageState.tappedNews;
      tappedTime = NewsPageState.tappedTime;
      tappedSale = NewsPageState.tappedSales;
    });
  }

  void _checkTapped(){
    if(tappedNews == 'SWD'){
      setState(() {
        address = '67 Đường số 447, Tăng Nhơn Phú A, Quận 9, TP.HCM';
        phone = '0956721329';
        timeOpen = '8h - 22h';
        admin = 'A.Tú';
        price = '130k';
        saleCode = 'FBall0813';
      });
    }else if(tappedNews == 'HCI'){
      setState(() {
        address = '442 Lê Văn Việt, Tăng Nhơn Phú A, Quận 9, TP.HCM';
        phone = '0906534119';
        timeOpen = '8h - 22h';
        admin = 'A.Tuấn';
        price = '100k';
        saleCode = 'FBall1013';
      });
    }else if(tappedNews == 'PRM'){
      setState(() {
        address = '6 Đường số 51, Hiệp Bình Chánh, Thủ Đức, TP.HCM';
        phone = '0978999999';
        timeOpen = '8h - 22h';
        admin = 'A.Đạt';
        price = '110k';
        saleCode = 'FBall2022';
      });
    }else if(tappedNews == 'ACC'){
      setState(() {
        address = '225 Nam Hòa, Phước Long A, Quận 9, TP.HCM';
        phone = '0907777777';
        timeOpen = '8h - 22h';
        admin = 'A.Dũng';
        price = '120k';
        saleCode = 'FBall1622';
      });
    }else if(tappedNews == 'ISC'){
      setState(() {
        address = '9 Hém 445, Phước Long B, Quận 9, TP.HCM';
        phone = '0901234567';
        timeOpen = '8h - 22h';
        admin = 'A.Nguyên';
        price = '100k';
        saleCode = 'FBall1519';
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage(url_imgbackground_welcome))
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Chi tiết giảm giá'),
          backgroundColor: Colors.white10,
        ),
        backgroundColor: Colors.white10,
        body: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.only(left:8.0, right: 8.0, top: 10),
              child: Column(
                children: [
                  Card(
                      color: Colors.white70,
                      child: Container(
                          width: size.width,
                          // height: 230,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            // mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 20.0),
                                child: Center(child: Text('Sân Bóng ${tappedNews}', style: GoogleFonts.alice(fontSize: 28, fontWeight: FontWeight.w600),)),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 10, left: 20),
                                child: Row(
                                  children: [
                                    Text('Liên hệ: ', style: TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.w500),),
                                    Text('$phone ($admin)', style: TextStyle(fontSize: 20, color: Colors.black54),),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 10, left: 20),
                                child: Row(
                                  // mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Địa chỉ: ', style: TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.w500),),
                                    Expanded(
                                      child: Container(
                                        // margin: EdgeInsets.only(right: 5),
                                        // width: size.width * 0.67,
                                        child: Text('$address', style: TextStyle(fontSize: 20, color: Colors.black54),overflow: TextOverflow.fade,),),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 10, left: 20),
                                child: Row(
                                  children: [
                                    Text('Mở cửa: ', style: TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.w500),),
                                    Text('$timeOpen', style: TextStyle(fontSize: 20, color: Colors.black54),),
                                  ],
                                ),
                              ),

                              Padding(
                                padding: const EdgeInsets.only(top: 10, left: 20),
                                child: Row(
                                  children: [
                                    Text('Giá sân: ', style: TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.w500),),
                                    Text('$price/1h', style: TextStyle(fontSize: 20, color: Colors.black54),),
                                  ],
                                ),
                              ),

                              SizedBox(height: 20,),

                              Padding(
                                padding: const EdgeInsets.only(top: 10, left: 20),
                                child: Row(
                                  // mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Mã giảm giá: ', style: TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.w500),),
                                    Text('$saleCode ($tappedSale%)', style: TextStyle(fontSize: 20, color: Colors.redAccent, fontWeight: FontWeight.w600),)
                                  ],
                                ),
                              ),

                              Padding(
                                padding: const EdgeInsets.only(top: 10, left: 20),
                                child: Row(
                                  children: [
                                    Text('Thời gian giảm giá : ', style: TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.w500),),
                                    Text('$tappedTime', style: TextStyle(fontSize: 20, color: Colors.black54),),
                                  ],
                                ),
                              ),

                              SizedBox(height: 20,),
                            ],
                          )
                      )
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

}
