import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:football_manager/url/url.dart';
import 'package:football_manager/view/booking.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DetailsBooking extends StatefulWidget {
  @override
  _DetailsBookingState createState() => _DetailsBookingState();
}

class _DetailsBookingState extends State<DetailsBooking> {
  int checkClickDiscount, price;
  double totalPrice;
  DateTime _endTime;
  String btnDiscount, eror;
  Widget _widget;
  String tapped,  email, displayName, days;
  String address, startTime ='', endTime='';
  String phone, discount = '-----', discountCheck;
  String timeOpen, priceDiscount;
  String admin, totalTimeHours, totalTime, totalTimeMinute;
  String  downPrice ='0';
  String note = 'Bạn chỉ được đặt sân ngoài khung giờ trên. Thân chào, quyết thắng và thân ái !!!';
  String noteB = 'Nếu đặt sân dưới 1h thì tiền sẽ tính 1h. Thân chào, quyết thắng và thân ái !!!';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkClickDiscount = 0;
    btnDiscount = 'Nhập mã';
    _getProfile();
    _getTapped();
    _checkTapped();
  }

  void _getProfile() async{
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      email = prefs.getString('email');
      displayName = prefs.getString('displayName');
    });
  }

  void _getTapped(){
    setState(() {
      tapped = BookingPageState.tapped;
     if(BookingPageState.day == ''){
       DateTime dateTime = DateTime.now();
       days = '${dateTime.day}-${dateTime.month}-${dateTime.year}';
     }else {
       days = BookingPageState.day;
     }
    });
  }

  void _checkTapped(){
    if(tapped == 'Sân bóng SWD'){
      setState(() {
         address = '67 Đường số 447, Tăng Nhơn Phú A, Quận 9, TP.HCM';
         phone = '0956721329';
         timeOpen = '8h - 22h';
         admin = 'A.Tú';
         price = 130;
         _widget = columSWD();
      });
    }else if(tapped == 'Sân bóng HCI'){
      setState(() {
        address = '442 Lê Văn Việt, Tăng Nhơn Phú A, Quận 9, TP.HCM';
        phone = '0906534119';
        timeOpen = '8h - 22h';
        admin = 'A.Tuấn';
        price = 100;
        _widget = columHCI();
      });
    }else if(tapped == 'Sân bóng PRM'){
      setState(() {
        address = '6 Đường số 51, Hiệp Bình Chánh, Thủ Đức, TP.HCM';
        phone = '0978999999';
        timeOpen = '8h - 22h';
        admin = 'A.Đạt';
        price = 110;
        _widget = columPRM();
      });
    }else if(tapped == 'Sân bóng ACC'){
      setState(() {
        address = '225 Nam Hòa, Phước Long A, Quận 9, TP.HCM';
        phone = '0907777777';
        timeOpen = '8h - 22h';
        admin = 'A.Dũng';
        price = 120;
        _widget = columACC();
      });
    }else if(tapped == 'Sân bóng ISC'){
      setState(() {
        address = '9 Hém 445, Phước Long B, Quận 9, TP.HCM';
        phone = '0901234567';
        timeOpen = '8h - 22h';
        admin = 'A.Nguyên';
        price = 100;
        _widget = columISC();
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
          title: Text('Chi tiết sân'),
          backgroundColor: Colors.white10,
        ),
        backgroundColor: Colors.white10,
        body: SingleChildScrollView(
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
                         child: Center(child: Text('${tapped}', style: GoogleFonts.alice(fontSize: 28, fontWeight: FontWeight.w600),)),
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
                             Text('${price}k/1h', style: TextStyle(fontSize: 20, color: Colors.black54),),
                           ],
                         ),
                       ),

                       Padding(
                         padding: const EdgeInsets.only(top: 10, left: 20),
                         child: Row(
                           // mainAxisAlignment: MainAxisAlignment.start,
                           crossAxisAlignment: CrossAxisAlignment.start,
                           children: [
                             Text('Sân được đặt lúc: ', style: TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.w500),),
                             Expanded(
                                 child: Container(
                                     child: _widget)),
                           ],
                         ),
                       ),
                       Padding(
                         padding: const EdgeInsets.only(top: 10, left: 20),
                         child: Row(
                           // mainAxisAlignment: MainAxisAlignment.start,
                           crossAxisAlignment: CrossAxisAlignment.start,
                           children: [
                             Text('Lưu ý: ', style: TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.w700),),
                             Expanded(
                               child: Container(
                                 // margin: EdgeInsets.only(right: 5),
                                 // width: size.width * 0.67,
                                 child: Text('$note', style: TextStyle(fontSize: 20, color: Colors.black54),overflow: TextOverflow.fade,),),
                             ),
                           ],
                         ),
                       ),
                       SizedBox(height: 20,),
                     ],
                   ))),

            Card(
              color: Colors.white70,
              child: Container(
                width: size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(child: Text('Đặt Sân', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 30),)),
                    Padding(
                      padding: const EdgeInsets.only(top: 10, left: 20),
                      child: Row(
                        children: [
                          Text('Ngày đặt: ', style: TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.w500),),
                          Text('$days', style: TextStyle(fontSize: 20, color: Colors.black54),),
                        ],
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(top: 10, left: 20),
                      child: Row(
                        children: [
                          Text('Giờ nhận: ', style: TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.w500),),
                          Text('$startTime', style: TextStyle(fontSize: 20, color: Colors.black54),),
                          Expanded(child: Container(
                            alignment: Alignment.centerLeft,
                            child: IconButton(
                                icon: Icon(Icons.timer, size: 25,),
                                onPressed: () {
                                  DatePicker.showTime12hPicker(context, showTitleActions: true, onConfirm: (date) {
                                    String  fDate= '$date';
                                    print('Start Time ${fDate.substring(10, 16)}');
                                    setState(() {
                                      startTime = '${fDate.substring(10, 16)}';
                                    });
                                  }, currentTime: DateTime.now());
                                }),
                          )),
                        ],
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(top: 0, left: 20),
                      child: Row(
                        children: [
                          Text('Giờ trả: ', style: TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.w500),),
                          Text('$endTime', style: TextStyle(fontSize: 20, color: Colors.black54),),
                          Expanded(child: Container(
                            alignment: Alignment.centerLeft,
                            child: IconButton(
                                icon: Icon(Icons.timer_off, size: 25,),
                                onPressed: () {
                                  DatePicker.showTime12hPicker(context, showTitleActions: true, onConfirm: (date1) {
                                    String  fDate= '$date1';
                                    print('End Time ${fDate.substring(10, 16)}');
                                    setState(() {
                                      endTime = '${fDate.substring(10, 16)}';
                                      _endTime = DateTime.parse(fDate);
                                    });
                                  }, currentTime: DateTime.now());
                                }),
                          )),
                        ],
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(top: 0, left: 20),
                      child: Row(
                        children: [
                          Text('Mã giảm giá: ', style: TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.w500),),
                          Text('$discount', style: TextStyle(fontSize: 20, color: Colors.black54),),
                          Expanded(child: Container(
                            alignment: Alignment.centerLeft,
                            child: FlatButton(
                                onPressed: () {
                                  setState(() {
                                    if(checkClickDiscount == 0){
                                      _inputDiscount();
                                    }else{
                                      _deleteDiscount();
                                    }
                                  });
                                },
                                child: Text( btnDiscount, style: TextStyle(color: Colors.blue),))
                          )),
                        ],
                      ),
                    ),

                    Center(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 15.0),
                        child: Container(
                          width: 200,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(20)
                          ),
                          child: FlatButton(
                            splashColor: Colors.white30,
                            shape: RoundedRectangleBorder(borderRadius:  BorderRadius.circular(20)),
                              onPressed: () async{
                                await _checkTime();

                              },
                              child: Text('Xác nhận', style: TextStyle(color: Colors.white,fontSize: 28, fontWeight: FontWeight.w700),)),
                        ),
                      ),
                    ),
                    SizedBox(height: 10,),
                    Padding(
                      padding: const EdgeInsets.only(top: 10, left: 20),
                      child: Row(
                        // mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Lưu ý: ', style: TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.w700),),
                          Expanded(
                            child: Container(
                              // margin: EdgeInsets.only(right: 5),
                              // width: size.width * 0.67,
                              child: Text('$noteB', style: TextStyle(fontSize: 20, color: Colors.black54),overflow: TextOverflow.fade,),),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20,),
                  ],
                ),
              )),
              ],
            ),
          ),
        ),
      ),
    );
  }


  void _deleteDiscount(){
    setState(() {
      discount = '-----';
      checkClickDiscount = 0;
      btnDiscount = 'Nhập mã';
    });
  }

  void _inputDiscount() async{
      await showDialog(
        context: context,
        builder: (BuildContext context) {
          // return object of type Dialog
          return AlertDialog(
            title: new Text("Mã giảm giá"),
            content: Container(
              height: 60,
              child: _buildIDTF(),
            ),
            actions: <Widget>[
              // usually buttons at the bottom of the dialog
              new FlatButton(
                child: new Text("Done",style: TextStyle(color: Colors.green),),
                onPressed: () async {
                  setState(() {
                    discount = discountCheck;
                    setState(() {
                      if(checkClickDiscount == 0){
                        checkClickDiscount = 1;
                        btnDiscount = 'Xoá mã';
                      }
                    });
                  });
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      ).then((val) {
//            *** Code Here ***
      });
  }

  Widget _buildIDTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                  Radius.circular(4)
              ),
              boxShadow: [BoxShadow(
                  color: Colors.grey,
                  offset: Offset(0,-1),
                  blurRadius: 0,
                  spreadRadius: 0
              )] ,
              color: Colors.white
          ),
          height: 60.0,
          child: TextField(
            onChanged: (text1) {
              setState(() {
                 discountCheck = text1;
                 print('discountCheck: $discountCheck');
              });
            },
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14.0),
                prefixIcon: Icon(
                  Icons.monetization_on,
                  color: Colors.blue,
                ),
                hintText: 'Nhập mã giảm giá....'
            ),
          ),
        )
      ],
    );
  }

  Widget columSWD(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('8h - 9h', style: TextStyle(fontSize: 20, color: Colors.redAccent, fontWeight: FontWeight.w600)),
        Text('13h - 15h', style: TextStyle(fontSize: 20, color: Colors.redAccent, fontWeight: FontWeight.w600)),
        Text('20h - 22h', style: TextStyle(fontSize: 20, color: Colors.redAccent, fontWeight: FontWeight.w600)),
      ],
    );
  }

  Widget columHCI(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('8h - 9h', style: TextStyle(fontSize: 20, color: Colors.redAccent, fontWeight: FontWeight.w600)),
        Text('16h - 18h', style: TextStyle(fontSize: 20, color: Colors.redAccent, fontWeight: FontWeight.w600)),
      ],
    );
  }
  Widget columISC(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('13h - 15h', style: TextStyle(fontSize: 20, color: Colors.redAccent, fontWeight: FontWeight.w600)),
        Text('18h - 20h', style: TextStyle(fontSize: 20, color: Colors.redAccent, fontWeight: FontWeight.w600)),
      ],
    );
  }
  Widget columPRM(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('13h - 15h', style: TextStyle(fontSize: 20, color: Colors.redAccent, fontWeight: FontWeight.w600)),
        Text('21h - 22h', style: TextStyle(fontSize: 20, color: Colors.redAccent, fontWeight: FontWeight.w600)),
      ],
    );
  }
  Widget columACC(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('10h - 12h', style: TextStyle(fontSize: 20, color: Colors.redAccent, fontWeight: FontWeight.w600)),
      ],
    );
  }
 void _checkTime(){
   if(startTime.isEmpty || startTime == ''){
     _showCheck("Giờ nhận trống !!!");
   }else{
     if(endTime.isEmpty || endTime ==''){
       _showCheck("Giờ trả trống !!!");
     }else{
       String hStartTime = startTime.substring(0, 3).trim();
       String hEndTime = endTime.substring(0, 3).trim();
       int sTime = int.parse(hStartTime);
       int eTime = int.parse(hEndTime);
       if(sTime > eTime){
         _showCheck("Giờ trả < Giờ nhận");
       }else{
         _checkTimeDiscount(hStartTime, hEndTime);
       }
     }
   }
 }

  void _checkTimeDiscount(String hStartTime, String hEndTime){
    String code;
    String name = tapped.substring(9, 12);
    List _listSWD = ['08','09','10','11','12','13'];
    List _listHCI = ['10','11','12','13'];
    List _listPRM = ['20','21','22'];
    List _listACC = ['16','17','18','19','20','21','22'];
    List _listISC = ['15','16','17','18','19'];
    List _list;
    List _codeToCheck = ['FBall0813', 'FBall1013', 'FBall2022', 'FBall1622', 'FBall1519'];
    setState(() {
      if(name == 'SWD'){
        _list = _listSWD;
        code = 'FBall0813';
      }else if(name == 'HCI'){
        _list = _listHCI;
        code = 'FBall1013';
      }else if(name == 'PRM'){
        _list = _listPRM;
        code = 'FBall2022';
      }else if(name == 'ACC'){
        _list = _listACC;
        code = 'FBall1622';
      }else if(name == 'ISC'){
        _list = _listISC;
        code = 'FBall1519';
      }

   if(discount != '-----' && discount != null && discount != ''){
     if(discount == code){
         if(!_list.contains(hStartTime) || hStartTime == _list.last){
           _showCheck("Giờ nhận ngoài thời gian giảm giá .");
         }else{
           if(!_list.contains(hEndTime)){
             _showCheck("Giờ trả ngoài thời gian giảm giá .");
           }else{
             print('Code is available');
             if(code == 'FBall0813'){
               setState(() {
                 downPrice = '20';
               });
             }else if(code == 'FBall1013'){
               setState(() {
                 downPrice = '25';
               });
             }else if(code == 'FBall2022'){
               setState(() {
                 downPrice = '50';
               });
             }else if(code == 'FBall1622'){
               setState(() {
                 downPrice = '30';
               });
             }else if(code == 'FBall1519'){
               setState(() {
                 downPrice = '10';
               });
             }
             _formCheckInfo();
           }}
     }else{
       if(!_codeToCheck.contains(discount)){
         _showCheck("Mã giảm giá sai.");
       }else {
         _showCheck("Sân không hỗ trợ mã giảm giá này");
       }
     }
   }else{
     _formCheckInfo();
   }
    });
  }

  void _showCheck(String error) async{
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Thông báo" , style: TextStyle(color: Colors.red, fontWeight: FontWeight.w800, fontSize: 25),),
          content: Container(
            height: 50,
            child: Text('$error', style: TextStyle(color: Colors.red, fontWeight: FontWeight.w700, fontSize: 20),),
          ),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("Done",style: TextStyle(color: Colors.green),),
              onPressed: () async {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    ).then((val) {
//            *** Code Here ***
    });
  }

  void _formCheckInfo() async{
    int hourT = int.parse(startTime.substring(0,3));
    int minuteT = int.parse(startTime.substring(4,6));
    String totalT = '${_endTime.subtract( Duration(hours: hourT, minutes: minuteT))}';
    int dowPrice = int.parse(downPrice);
    double perPrice = dowPrice/100;
    double mainTime, time2, time1, perPriceDown, mainPrice;
    print("Main Discount:$perPrice");
    setState(() {
      totalTimeHours = "${totalT.substring(11,13)}";
      time1 = double.parse(totalTimeHours);
      totalTimeMinute = '${totalT.substring(14,16)}';
      time2 = double.parse(totalTimeMinute);
      mainTime = time1 + (time2/60);
      print("Time chinh:$mainTime");
      totalTime = '${totalTimeHours}h${totalTimeMinute}p';
      perPriceDown = price * perPrice;
      print("Giá được giảm:$perPriceDown");
      mainPrice = price - perPriceDown;
      print("Giá sau giảm:$mainPrice");
      totalPrice = mainPrice * mainTime ;
      print("Tổng tiền:$totalPrice");
    });
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        var size = MediaQuery.of(context).size;
        // return object of type Dialog
        return AlertDialog(
          title: Center(child: new Text("Phiếu Xác Nhận" , style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700, fontSize: 25),)),
          content: Container(
            height: size.height,
            width: size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _formPadding('Tên', displayName),
                _formPadding('Email', email),
                _formPadding('SĐT', '0967566774'),
                _formPadding('Sân', tapped),
                _formPadding('Ngày đặt', days),
                _formPadding('Giờ nhận sân', startTime),
                _formPadding('Giờ trả sân', endTime),
                _formPadding('Giá sân', '$price/1h'),
                _formPadding('Giảm giá', '$downPrice%'),
                SizedBox(height: 10,),
                Center(child: Text('--------------------'),),
                SizedBox(height: 5,),
                Center(child:  Text("Tổng tiền" , style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700, fontSize: 25),)),
                _formPadding('Tổng giờ', totalTime),
                _formPadding('Giá sau giảm', '${mainPrice.toInt()}k/1h'),
                _formPadding('Tổng tiền', '${totalPrice.toInt()}k'),

              ],
            )
          ),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("Huỷ",style: TextStyle(color: Colors.redAccent),),
              onPressed: () async {
                Navigator.of(context).pop();
              },
            ),

            new FlatButton(
              child: new Text("Xác nhận",style: TextStyle(color: Colors.green),),
              onPressed: () async {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    ).then((val) {
//            *** Code Here ***
    });
  }

  Widget _formPadding(String txt, String subtxt){
   return Padding(
      padding: const EdgeInsets.only(top: 5, left: 0),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('$txt: ', style: TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.w700),),
          Expanded(
            child: Container(
              // margin: EdgeInsets.only(right: 5),
              // width: size.width * 0.67,
              child: Text('$subtxt', style: TextStyle(fontSize: 20, color: Colors.black54),overflow: TextOverflow.fade,),),
          ),
        ],
      ),
    );
  }
  }

