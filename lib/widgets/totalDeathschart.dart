import 'package:coronagraph/widgets/colors.dart';
import 'package:coronagraph/widgets/corona_data.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:charts_flutter/flutter.dart' as charts;
class TotalDeathsChart extends StatefulWidget {
  
  @override
  _TotalDeathsChartState createState() => _TotalDeathsChartState();
}

class _TotalDeathsChartState extends State<TotalDeathsChart> {
List data;
  List<CoronaData> coronadata=[]; 
  Future corona() async{
   String url="https://data.nepalcorona.info/api/v1/covid/timeline";
   var response=await http.get(url);
   setState(() {
   data=json.decode(response.body);  
   });
  }
  Widget chartWidget(){
    if (data!=null){
      for (Map m in data){
        coronadata.add(new CoronaData(DateTime.parse(m["date"]),m["totalCases"],m["newCases"],m["totalRecoveries"],m["newRecoveries"],m["totalDeaths"],m["newDeaths"]));
      }
    }
    
    else
    {
        coronadata.add(new CoronaData(DateTime.now(),0,0,0,0,0,0));
    }
    var series=[
      new charts.Series<CoronaData,DateTime>
      (
      id: "Total Deaths", 
      data: coronadata,
      domainFn: (CoronaData data1,_)=>data1.date,
      measureFn: (CoronaData data1,_)=>data1.totalDeaths,
      ),
    ];
    var chart = new charts.TimeSeriesChart(
      series,
      animate:true,
    );
    return new Container(
child: new Column(
mainAxisAlignment: MainAxisAlignment.center,
children: <Widget>[
new Padding(
padding: new EdgeInsets.all(10.0),
child: new SizedBox(
height: 200.0,
child: chart,
),
),
],
),
);
 } 
  @override
  void initState() {
    corona();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
   
    return Scaffold
    (
      appBar: AppBar
      (
        backgroundColor: purple,
       title: Center(child: Text("TotalDeathsChart")),
      ),
      body: SafeArea(child: chartWidget()));
  }
}