import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

//double value;
 class PieChart extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return PieChartState();
  }
}

class PieChartState extends State<PieChart> {
  List<charts.Series<Task, String>> seriesPieData;
  static double value_deli = 30.3333;
  static  double value_take = 30.3333;
  static  double value_store = 30.3333;
  static  double price_store = 303030;
  static  double price_take = 99999;
  static  double price_deli = 88888;
  static var store, date, total;


  generateData() {


    var piedata = [
      new Task('Store', value_store, Color.fromARGB(255, 247, 198, 94)),
      new Task('Delivery', value_deli, Color.fromARGB(255, 219, 93, 82)),
      new Task('Take Away', value_take, Color.fromARGB(255, 74, 144, 226)),
    ];

    seriesPieData.add(
      charts.Series(
        domainFn: (Task task, _) => task.task,
        measureFn: (Task task, _) => task.taskvalue,
        colorFn: (Task task, _) =>
            charts.ColorUtil.fromDartColor(task.colorval),
        id: 'Air Pollution',
        data: piedata,
        labelAccessorFn: (Task row, _) => '${row.taskvalue}',
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    seriesPieData = List<charts.Series<Task, String>>();
    generateData();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return   SafeArea(
              child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Container(
                    child: Center(
                      child: Column(
                        children: <Widget>[
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.only(right:80.0, left: 80.0),
                            child: Container(
                              child: charts.PieChart(
                                  seriesPieData,
                                  animate: false,
                                  defaultRenderer: new charts.ArcRendererConfig(arcWidth: 44)),
                            ),),
                          ),
                          Container(
                            width: size.width ,
                            height: size.height * 0.2,
                            child: Text(
                                "$store",
                            style: const TextStyle(
                            color:  const Color(0xff363e2e),
                              fontWeight: FontWeight.w400,
                              fontFamily: "Muli",
                              fontStyle:  FontStyle.normal,
                              fontSize: 25.0
                          ),
                             textAlign: TextAlign.center
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 20.0),
                            child: Container(
                              color:  Colors.yellow,
                              width: size.width ,
                              height: size.height * 0.2,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 50.0),
                            child: Container(
                              color:  Colors.deepPurple,
                              width: size.width ,
                              height: size.height * 0.1,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
      ),
    );
  }
}

class Task {
  String task;
  double taskvalue;
  Color colorval;

  Task(this.task, this.taskvalue, this.colorval);
}

class Value {

}