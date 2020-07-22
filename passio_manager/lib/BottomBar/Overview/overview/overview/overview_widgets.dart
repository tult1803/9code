

import 'package:flutter/material.dart';
import 'package:passiomanager/PieChart/overview_revenue_chart.dart';
import '../utils/colors.dart';
import 'dart:ui';



import 'overview_content.dart';
import 'dart:math';

import 'package:charts_flutter/flutter.dart' as charts;

class OverviewWidgets {
  static Widget buildContent(OverviewContent overviewContentModel) {
    return Container(
      margin: EdgeInsets.only(
        left: 16.0,
        right: 16.0,
        bottom: 10.0,
      ),
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
      child: ExpansionTile(
        leading: CircleAvatar(
          backgroundColor: overviewContentModel.leadingColor,
          child: Icon(
            overviewContentModel.leadingIcon,
            color: Colors.white,
            size: 24,
          ),
        ),
        title: buildExpansionTileTitle(
          overviewContentModel.title,
          overviewContentModel.change,
          overviewContentModel.percentOfChange,
        ),
        subtitle: Text(
          overviewContentModel.subTitle,
          style: TextStyle(
            fontFamily: 'Muli',
            fontSize: 18,
            color: charcoal,
            fontWeight: FontWeight.w600,
          ),
          textAlign: TextAlign.left,
        ),
        children: buildContentDetail(
            overviewContentModel.title,
            overviewContentModel.content, overviewContentModel.isMoreDetail),
      ),
    );
  }

  static List<Widget> buildContentDetail(
//      BuildContext context,
      String tittle,
      Map<String, String> content, bool isMoreDetail) {
    List<Widget> listContents = [];
    listContents.add(
      Divider(
        height: 1.0,
        thickness: 1.0,
      ),
    );
    content.forEach((key, value) {
      listContents.add(ListTile(
        title: Text(
          key,
          style: TextStyle(
            fontFamily: 'Muli',
            fontStyle: FontStyle.normal,
            fontSize: 14.0,
            color: dark_sage,
          ),
        ),
        trailing: Text(
          value,
          style: TextStyle(
            fontFamily: 'Muli',
            fontWeight: FontWeight.w600,
            fontSize: 16.0,
          ),
        ),
      ));
    });
    if (isMoreDetail) {
      listContents.add(Divider(
        thickness: 1.0,
        height: 1.0,
      ));
      listContents.add(
        Container(
          width: double.maxFinite,
          height: 45,
          child: FlatButton(
            onPressed: () {
              if(tittle == "Tổng doanh thu"){
//                Navigator.push(context, MaterialPageRoute(builder: (context) => Revenue()));
              }
              print(tittle);
             // Navigator.push(context, route)
            },
            child: Text(
              'Xem chi tiêt',
              style: TextStyle(
                fontFamily: 'Muli',
                fontSize: 14.0,
                color: sick_green,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
        ),
      );
    }
    return listContents;
  }

  static Widget buildExpansionTileTitle(
      String title, int change, double percent) {
    Widget changePercent = buildChangePercent(change, percent);
    Widget titleWidget = Text(
      title,
      style: TextStyle(
        fontFamily: 'Muli',
        fontSize: 14,
        fontWeight: FontWeight.w300,
      ),
    );
    if (changePercent == null) {
      return titleWidget;
    } else {
      return Row(
        children: <Widget>[
          titleWidget,
          SizedBox(
            width: 10.0,
          ),
          changePercent,
        ],
      );
    }
  }

  static Widget buildChangePercent(int change, double percent) {
    IconData trending;
    Color color;
    if (change < -1) {
      return null;
    }
    if (change == -1) {
      trending = Icons.trending_down;
      color = pastel_red;
    } else if (change == 0) {
      trending = Icons.trending_flat;
      color = light_mustard;
    } else if (change == 1) {
      trending = Icons.trending_up;
      color = grass;
    }
    String percentText;
    if ((percent * 10) % 10 == 0) {
      percentText = percent.toStringAsFixed(0) + '%';
    } else {
      percentText = percent.toString() + '%';
    }
    return Row(
      children: <Widget>[
        Icon(
          trending,
          color: color,
          size: 20.0,
        ),
        SizedBox(
          width: 4.0,
        ),
        Text(
          percentText,
          style: TextStyle(
            fontSize: 14.0,
            fontWeight: FontWeight.w600,
            fontFamily: 'Muli',
            color: color,
          ),
        ),
      ],
    );
  }
}

class ChartDemoVer3 extends StatelessWidget {
  final List<charts.Series> seriesList;
  final bool animate;

  ChartDemoVer3(this.seriesList, {this.animate});

  factory ChartDemoVer3.withSampleData() {
    return new ChartDemoVer3(
      _createSampleData(),
      animate: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Tất cả cửa hàng',
          style: TextStyle(
            fontSize: 14.0,
            fontFamily: 'Muli',
            color: Colors.white,
            fontWeight: FontWeight.w300,
          ),
        ),
        SizedBox(
          height: 5.0,
        ),
        Text(
          'Chủ nhật, 07/06/2020',
          style: TextStyle(
            fontSize: 14.0,
            fontFamily: 'Muli',
            color: Colors.white,
            fontWeight: FontWeight.w300,
          ),
        ),
        SizedBox(
          height: 20.0,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Container(
            width: 500.0,
            height: 250.0,
            child: charts.TimeSeriesChart(
              seriesList,
              animate: animate,
              dateTimeFactory: const charts.UTCDateTimeFactory(),
              domainAxis: charts.DateTimeAxisSpec(
                tickFormatterSpec: charts.AutoDateTimeTickFormatterSpec(
                  hour: new charts.TimeFormatterSpec(
                    format: 'H', // or even HH:mm here too
                    transitionFormat: 'H:mm',
                  ),
                ),
              ),
              defaultRenderer: new charts.LineRendererConfig(
                includePoints: false,
                strokeWidthPx: 3.0,
                stacked: true,
              ),
              behaviors: [
                new charts.SeriesLegend(
                  position: charts.BehaviorPosition.bottom,
                  horizontalFirst: true,
                  showMeasures: false,
                ),
              ],
              customSeriesRenderers: [
                new charts.BarRendererConfig(
                  customRendererId: 'customBar',
                ),
                new charts.PointRendererConfig(
                  customRendererId: 'customPoint',
                  symbolRenderer: CustomCircleSymbolRenderer(
                    charts.Color.fromHex(code: '#a6ce39'),
                    charts.Color.white,
                  ),
                  radiusPx: 5.0,
                ),
                new charts.PointRendererConfig(
                  customRendererId: 'customPoint2',
                  symbolRenderer: CustomCircleSymbolRenderer(
                    charts.Color.fromHex(code: '#649e1b'),
                    charts.Color.fromHex(code: '#649e1b'),
                  ),
                  radiusPx: 0,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  static List<charts.Series<TimeSeriesSales, DateTime>> _createSampleData() {
    final lineChartData = [
      new TimeSeriesSales(new DateTime(2020, 6, 7, 9, 0), 23),
      new TimeSeriesSales(new DateTime(2020, 6, 7, 10, 0), 20),
      new TimeSeriesSales(new DateTime(2020, 6, 7, 11, 0), 31),
      new TimeSeriesSales(new DateTime(2020, 6, 7, 12, 0), 18),
      new TimeSeriesSales(new DateTime(2020, 6, 7, 13, 0), 37),
      new TimeSeriesSales(new DateTime(2020, 6, 7, 14, 0), 51),
      new TimeSeriesSales(new DateTime(2020, 6, 7, 15, 0), 39),
      new TimeSeriesSales(new DateTime(2020, 6, 7, 16, 0), 21),
      new TimeSeriesSales(new DateTime(2020, 6, 7, 17, 0), 50),
      new TimeSeriesSales(new DateTime(2020, 6, 7, 18, 0), 32),
      new TimeSeriesSales(new DateTime(2020, 6, 7, 19, 0), 41),
    ];
    final barChartData = [
      new TimeSeriesSales(new DateTime(2020, 6, 7, 9, 0), 12),
      new TimeSeriesSales(new DateTime(2020, 6, 7, 10, 0), 7),
      new TimeSeriesSales(new DateTime(2020, 6, 7, 11, 0), 9),
      new TimeSeriesSales(new DateTime(2020, 6, 7, 12, 0), 20),
      new TimeSeriesSales(new DateTime(2020, 6, 7, 13, 0), 35),
      new TimeSeriesSales(new DateTime(2020, 6, 7, 14, 0), 30),
      new TimeSeriesSales(new DateTime(2020, 6, 7, 15, 0), 38),
      new TimeSeriesSales(new DateTime(2020, 6, 7, 16, 0), 32),
      new TimeSeriesSales(new DateTime(2020, 6, 7, 17, 0), 18),
      new TimeSeriesSales(new DateTime(2020, 6, 7, 18, 0), 32),
      new TimeSeriesSales(new DateTime(2020, 6, 7, 19, 0), 41),
    ];

    return [
      new charts.Series<TimeSeriesSales, DateTime>(
        id: 'Doanh thu',
        colorFn: (_, __) => charts.MaterialPalette.white,
        domainFn: (TimeSeriesSales sales, _) => sales.time,
        measureFn: (TimeSeriesSales sales, _) => sales.sales,
        data: lineChartData,
        overlaySeries: true,
      ),
      new charts.Series<TimeSeriesSales, DateTime>(
        id: 'Doanh thu',
        domainFn: (TimeSeriesSales sales, _) => sales.time,
        measureFn: (TimeSeriesSales sales, _) => sales.sales,
        data: lineChartData,
      )..setAttribute(charts.rendererIdKey, 'customPoint'),
      new charts.Series<TimeSeriesSales, DateTime>(
        id: 'Hóa đơn',
        domainFn: (TimeSeriesSales sales, _) => sales.time,
        measureFn: (TimeSeriesSales sales, _) => sales.sales,
        data: barChartData,
      )..setAttribute(charts.rendererIdKey, 'customPoint2'),
      new charts.Series<TimeSeriesSales, DateTime>(
        id: 'Hóa đơn',
        colorFn: (_, __) => charts.Color.fromHex(code: '#649e1b'),
        domainFn: (TimeSeriesSales sales, _) => sales.time,
        measureFn: (TimeSeriesSales sales, _) => sales.sales,
        data: barChartData,
        overlaySeries: true,
      )..setAttribute(charts.rendererIdKey, 'customBar'),
    ];
  }
}

class TimeSeriesSales {
  final DateTime time;
  final int sales;

  TimeSeriesSales(this.time, this.sales);
}

class CustomCircleSymbolRenderer extends charts.CircleSymbolRenderer {
  CustomCircleSymbolRenderer(
    this._fillColor,
    this._strokeColor,
  );
  charts.Color _strokeColor;
  charts.Color _fillColor;

  @override
  void paint(charts.ChartCanvas canvas, Rectangle<num> bounds,
      {List<int> dashPattern,
      charts.Color fillColor,
      charts.FillPatternType fillPattern,
      charts.Color strokeColor,
      double strokeWidthPx}) {
    super.paint(
      canvas,
      bounds,
      dashPattern: dashPattern,
      fillColor: _fillColor,
      strokeColor: _strokeColor,
      strokeWidthPx: 3,
    );
  }
}
