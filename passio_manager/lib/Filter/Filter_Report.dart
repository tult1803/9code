
import 'package:flutter/material.dart';
import 'package:passiomanager/Filter/Report_Filter_Date.dart';
import 'package:passiomanager/Filter/Report_Filter_Product.dart';
import 'package:passiomanager/Filter/Report_Filter_Report.dart';
import 'package:passiomanager/Filter/Report_Filter_Store.dart';

class FilterReport extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return FilterReportState();
  }
}
String  result;
class FilterReportState extends State<FilterReport>{
  var store ="Tất cả cửa hàng";
  var time ="Hôm nay";
  var report ="Sau giảm giá";
  var kind_water ="Sản phẩm";
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
//    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar:  AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        title: RichText(
            text: TextSpan(
                children: [
                  TextSpan(
                      style: const TextStyle(
                          color:  Color.fromARGB(255, 54, 62, 46),
                          fontWeight: FontWeight.w800,
                          fontFamily: "Muli",
                          fontStyle:  FontStyle.normal,
                          fontSize: 20.0
                      ),
                      text: "Tuỳ "),
                  TextSpan(
                      style: const TextStyle(
                          color:  Color.fromARGB(255, 54, 62, 46),
                          fontWeight: FontWeight.w800,
                          fontFamily: "Muli",
                          fontStyle:  FontStyle.normal,
                          fontSize: 20.0
                      ),
                      text: "chỉnh")
                ]
            )
        ),
      ),
      body: Container(
        color: Color.fromARGB(255, 241,243,246),
        child: Center(
          child: Column(
            children: <Widget>[
              container("Chọn cửa hàng", "$store", size, context,ReportFilterStore()),
              container("Thời gian    ", "$time", size, context,ReportFilterDate()),
              container("Xem báo cáo  ", "$report", size, context,ReportFilterReport()),
              container("Chọn loại    ", "$kind_water", size, context,ReportFilterProduct()),
              Expanded(child: SizedBox()),
             Container(
               margin: EdgeInsets.only(top: 20),
               width: size.width * 0.75,
               height: 50,
               decoration: BoxDecoration(
                 color:  Color.fromARGB(255, 166, 207, 57),
                 borderRadius: BorderRadius.circular(10.0),
               ),
               child: FlatButton(
                 onPressed: () {},
                 child: RichText(
                     text: TextSpan(
                         children: [
                           TextSpan(
                               style: const TextStyle(
                                   color:  Colors.white,
                                   fontWeight: FontWeight.w800,
                                   fontFamily: "Muli",
                                   fontStyle:  FontStyle.normal,
                                   fontSize: 17.0
                               ),
                               text: "Áp "),
                           TextSpan(
                               style: const TextStyle(
                                   color:  Colors.white,
                                   fontWeight: FontWeight.w800,
                                   fontFamily: "Muli",
                                   fontStyle:  FontStyle.normal,
                                   fontSize: 17.0
                               ),
                               text: "dụng")
                         ]
                     )
                 ),
               ),
             ),
              Container(
                margin: EdgeInsets.only(top: 20),
                width: size.width * 0.4,
                height: 50,
                decoration: BoxDecoration(
//                  color:  Color.fromARGB(255, 166, 207, 57),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: FlatButton(
                  onPressed: () {
                    setState(() {
                      store ="Tất cả cửa hàng";
                      time ="Hôm nay";
                      report ="Sau giảm giá";
                      kind_water ="Sản phẩm";
                    });
                  },
                  child: Text(
                      "Trở về mặc định",
                      style: const TextStyle(
                          color:  const Color(0xff363e2e),
                          fontWeight: FontWeight.w800,
                          fontFamily: "Muli",
                          fontStyle:  FontStyle.normal,
                          fontSize: 14.0
                      ),
                      textAlign: TextAlign.center
                  )
                ),
              ),
              SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget container (String tittle, String choose, Size size, BuildContext context,Widget widget){
    return Container(
      margin: EdgeInsets.only(top: 20),
      width: 328,
      height: 68,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
            Radius.circular(4)
        ),
        boxShadow: [BoxShadow(
            color: Color.fromARGB(255, 227, 229, 233),
            offset: Offset(0,-1),
            blurRadius: 0,
            spreadRadius: 0
        )] ,
        color: Colors.white,
      ),
      child: FlatButton(
      onPressed: () async {
          result = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => widget,
            ));
          if(tittle.toLowerCase().trim() == "chọn cửa hàng") {
            setState(() {
//              store = result;
            });
          }else if(tittle.toLowerCase().trim() == "thời gian" && result != null) {
            setState(() {
              time = result;
            });
          }else if(tittle.toLowerCase().trim() == "xem báo cáo" && result != null) {
            setState(() {
              report = result;
            });
          }else if(tittle.toLowerCase().trim() == "chọn loại" && result != null) {
            setState(() {
              kind_water = result;
            });
          }
      },
        child: Row(
          children: <Widget>[
            Column(
              children: <Widget>[
                Container(
                  width: size.width * 0.5,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: Row(
                      children: <Widget>[
                        RichText(
                            text: TextSpan(
                                children: [
                                  TextSpan(
                                      style: const TextStyle(
                                          color:  const Color(0xff363e2e),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "Muli",
                                          fontStyle:  FontStyle.normal,
                                          fontSize: 12.0
                                      ),
                                      text: "$tittle"),
                                ]
                            )
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  width: size.width * 0.5,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Text("$choose", style: TextStyle(
                        fontSize: 15
                    ),),
                  ),
                )
              ],
            ),
            Expanded(
                child: SizedBox(
                )
            ),
            Padding(
              padding: const EdgeInsets.only(left: 0),
              child: Image(image: AssetImage("images/arrow_down.png")),
            ),
          ],
        ),

      ),
    );
  }

  void update_value(String value, String result){
    if(value == "Chọn cửa hàng"){
      store = result;
    }else if(value == "Thời gian"){
      time = result;
    }else if(value == "Xem báo cáo"){
      report = result;
    }else if(value == "Chọn loại"){
      kind_water = result;
    }
  }
}

