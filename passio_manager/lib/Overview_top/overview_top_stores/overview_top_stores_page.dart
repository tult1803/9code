import 'package:flutter/material.dart';
import '../overview_top_stores/top_store_widget.dart';

class OverviewTopStoresPage extends StatefulWidget {
  @override
  _OverviewTopStoresPageState createState() => _OverviewTopStoresPageState();
}

class _OverviewTopStoresPageState extends State<OverviewTopStoresPage> {
  final int sortTypeDefault = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Top doanh thu cửa hàng',
          style: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.w800,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
        actions: [
          FlatButton(
            onPressed: () {
              showModalBottomSheet(
                isScrollControlled: true,
                backgroundColor: Colors.transparent,
                context: context,
                builder: (context) {
                  return TopStoreWidget.buildSortTypeSelection(
                      context, sortTypeDefault);
                },
              );
            },
            child: Icon(
              Icons.swap_vertical_circle,
              size: 20.0,
            ),
          )
        ],
      ),
      body: ListView(
        children: [
          TopStoreWidget.buildStoreWidget(),
          TopStoreWidget.buildStoreWidget(),
          TopStoreWidget.buildStoreWidget(),
        ],
      ),
    );
  }
}
