import 'package:flutter/material.dart';
import '../../../Profile.dart';
import '../../../Report.dart';
import 'overview_widgets.dart';
import '../utils/colors.dart';
import 'overview_content.dart';

class OverviewPage extends StatefulWidget {
  OverviewPage({
    Key key,
  }) : super(key: key);
  @override
  _OverviewPageState createState() => _OverviewPageState();
}

class _OverviewPageState extends State<OverviewPage> {
  int _selectedPage = 2;
  final _pageOptions = [ // Thay Text bằng class để Na
    OverviewPage(),
    Report(),
    Profile(),
  ];

  //Components of App Bar
  var appBarColor = Colors.white;
  var filterImage = 'assets/images/filter_white.png';
  var shareImage = 'assets/images/share_white.png';
  ScrollController _scrollController;

  @override
  void initState() {
    //Add Scroll controller to handle scrolling
    _scrollController = ScrollController(initialScrollOffset: 0.0);
    _scrollController.addListener(changeAppBarColorOnScroll);
  }

  //When at top, the color of components of App Bar is white. When scroll, the color changes to white and color of components changes to black
  void changeAppBarColorOnScroll() {
    if (_scrollController.offset < 300 && appBarColor != Colors.white) {
      setState(() {
        appBarColor = Colors.white;
        filterImage = 'assets/images/filter_white.png';
        shareImage = 'assets/images/share_white.png';
      });
    } else if (_scrollController.offset >= 300 && appBarColor != Colors.black) {
      setState(() {
        appBarColor = Colors.black;
        filterImage = 'assets/images/filter.png';
        shareImage = 'assets/images/share.png';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff1f3f6),
      body: CustomScrollView(
        controller: _scrollController,
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 400.0,
            floating: true,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                height: 400.0,
                padding: EdgeInsets.only(
                  left: 16.0,
                  bottom: 20.0,
                ),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment(0.5, 1),
                    end: Alignment(0.5, 0),
                    colors: [
                      const Color(0xff59a927),
                      const Color(0xffa6ce39),
                    ],
                  ),
                ),
                child: ChartDemoVer3.withSampleData(),
              ),
            ),
            title: Text(
              'Tổng quan',
              style: TextStyle(
                color: appBarColor,
                fontSize: 24.0,
                fontFamily: 'Muli',
                fontWeight: FontWeight.w800,
              ),
            ),
            backgroundColor: Colors.white,
            actions: <Widget>[
              IconButton(
                icon: Image.asset(filterImage),
                onPressed: () {
                  print('You have pressed filter button');
                },
              ),
              IconButton(
                icon: Image.asset(shareImage),
                onPressed: () {
                  print('You have pressed share button');
                },
              ),
            ],
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              OverviewWidgets.buildContent(
                new OverviewContent(
                    title: 'Tổng doanh thu',
                    subTitle: '7.429.563 đ',
                    leadingColor: bluey_green,
                    leadingIcon: Icons.attach_money,
                    change: 1,
                    percentOfChange: 5.1,
                    content: {
                      'Trước giảm giá': '6.380.000 đ',
                      'Giảm giá bán hàng': '380.350 đ',
                      'Thực tế': '5.999.650 đ',
                      'Nạp thẻ': '1.430.003 đ',
                    },
                    isMoreDetail: true),
              ),
              OverviewWidgets.buildContent(
                new OverviewContent(
                    title: 'Tổng số hóa đơn',
                    subTitle: '124 đơn',
                    leadingColor: dark_sky_blue,
                    leadingIcon: Icons.receipt,
                    change: -1,
                    percentOfChange: 1,
                    content: {
                      'Tại quán': '100 đơn',
                      'Mang đi': '24 đơn',
                      'Giao hàng': '0',
                      'Nạp thẻ': '0',
                    },
                    isMoreDetail: true),
              ),
              OverviewWidgets.buildContent(
                new OverviewContent(
                    title: 'Tổng thanh toán',
                    subTitle: '5.370.700 đ',
                    leadingColor: purle,
                    leadingIcon: Icons.local_atm,
                    change: 1,
                    percentOfChange: 5,
                    content: {
                      'Tiền mặt bán hàng': '0 đ',
                      'Tiền mặt nạp thẻ': '410.000 đ',
                      'Thẻ thành viên': '831.300 đ',
                    },
                    isMoreDetail: false),
              ),
              OverviewWidgets.buildContent(
                new OverviewContent(
                    title: 'Tổng lượt thanh toán',
                    subTitle: '154 lượt',
                    leadingColor: light_mustard,
                    leadingIcon: Icons.swap_horiz,
                    change: 0,
                    percentOfChange: 6,
                    content: {
                      'Tiền mặt bán hàng': '151 lượt',
                      'Tiền mặt nạp thẻ': '2 lượt',
                      'Thẻ thành viên': '30 lượt',
                    },
                    isMoreDetail: false),
              ),
              OverviewWidgets.buildContent(
                new OverviewContent(
                    title: 'Top doanh thu cửa hàng',
                    subTitle: 'Nguyễn Thị Minh Khai',
                    leadingColor: darkish_pink,
                    leadingIcon: Icons.store,
                    change: -2,
                    percentOfChange: 0,
                    content: {
                      'Hóa đơn bán hàng': '120 đơn',
                      'Tổng doanh thu': '7.330.000 đ',
                    },
                    isMoreDetail: true),
              ),
            ]),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        onTap: (int index) {
          setState(() {
            if(index != 0) {
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
