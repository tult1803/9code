import 'package:flutter/material.dart';
import '../utils/colors.dart';

class TopStoreWidget {
  static Map<String, String> detail = {
    'Hoá đơn bán hàng': 'Value',
    'Hoá đơn nạp ': 'Value',
    'Tổng sản phẩm': '68sp',
    'Doanh thu bán hàng': '2.016.300đ',
    'Doanh thu nạp thẻ': 'Value',
    'Tổng doanh thu': 'Value',
  };
  static List<String> title = [
    'Hoá đơn bán hàng',
    'Hoá đơn nạp ',
    'Tổng sản phẩm',
    'Doanh thu bán hàng',
    'Doanh thu nạp thẻ',
    'Tổng doanh thu',
  ];
  static Widget buildStoreWidget() {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 16.0,
      ),
      child: Column(
        children: [
          SizedBox(
            height: 24.0,
          ),
          Row(
            children: [
              CircleAvatar(
                radius: 12.0,
                backgroundColor: sick_green,
                child: Text(
                  '1',
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.white,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
              SizedBox(
                width: 16.0,
              ),
              Text(
                'Điện Biên Phủ',
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              )
            ],
          ),
          SizedBox(
            height: 16.0,
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(4)),
                boxShadow: [
                  BoxShadow(
                      color: pale_grey,
                      offset: Offset(0, -1),
                      blurRadius: 1,
                      spreadRadius: 1)
                ],
                color: Colors.white),
            child: Column(
              children: buildStoreDetail(detail),
            ),
          ),
        ],
      ),
    );
  }

  static List<Widget> buildStoreDetail(Map<String, String> detail) {
    List<Widget> listDetailWidget = [];
    int count = 0;
    Color backgroungColor;
    Color valueColor = Colors.black;
    detail.forEach((key, value) {
      if (count % 2 == 0) {
        backgroungColor = Colors.white;
      } else {
        backgroungColor = background;
      }
      if (count == 5) {
        valueColor = sick_green;
      }
      listDetailWidget.add(
        Container(
          color: backgroungColor,
          child: ListTile(
            contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
            title: Text(
              key,
              style: TextStyle(
                color: Colors.black,
                fontSize: 14.0,
              ),
            ),
            trailing: Text(
              value,
              style: TextStyle(
                color: valueColor,
                fontSize: 16.0,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      );
      count++;
    });
    return listDetailWidget;
  }

  static Widget buildSortTypeSelection(
      BuildContext context, int sortTypeDefault) {
    return Container(
      height: 400.0,
//      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          boxShadow: [
            BoxShadow(
                color: pale_grey,
                offset: Offset(0, -1),
                blurRadius: 0,
                spreadRadius: 0)
          ],
          color: Colors.white),
      child: Stack(
        fit: StackFit.passthrough,
        children: [
          Container(
            height: 62,
            width: double.maxFinite,
            padding: EdgeInsets.symmetric(
              vertical: 19.0,
              horizontal: 24.0,
            ),
            child: Text(
              'Sắp xếp theo',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w800,
                color: Colors.black,
              ),
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            child: Divider(
              thickness: 5.0,
              height: 1.0,
              color: Colors.red,
            ),
          ),
          ListView.builder(
            padding: EdgeInsets.only(top: 40),


            itemCount: title.length,
            itemBuilder: (context, index) {
            return ListTile(
              title: Text(title[index]),
            );
          },
          )
        ],
      ),
    );
  }

  static List<Widget> listSelection(int selection) {
    List<Widget> list = [];
    int count = 0;

    title.forEach((element) {
//      Widget selectWidget = Text('');
//      if (selection == count) {
//        selectWidget = Icon(
//          Icons.check,
//          color: sick_green,
//          size: 24.0,
//        );
//      }
      list.add(
        ListTile(
          title: Text(element),
//          trailing: selectWidget,
        ),
      );
//      count++;
    });
    return list;
  }
}
