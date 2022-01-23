import 'package:coronagraph/services/webservice.dart';
import 'package:coronagraph/widgets/colors.dart';
import 'package:flutter/material.dart';
class MythScreen extends StatefulWidget {
  @override
  _MythScreenState createState() => _MythScreenState();
}

class _MythScreenState extends State<MythScreen> {
  TextStyle heading = TextStyle
  ( 
    fontWeight: FontWeight.w900,
    color: white,
    fontSize: 25
  );
  ScrollController _scrollController;
  WebService _service;
  @override
  void initState() {
    _service=WebService();
    super.initState();
  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold
    (
      appBar: AppBar
      ( 
        centerTitle: true,
        title: Text("Myths",style: heading,),
      ),
      body: SafeArea
      (
        child: Container
        (margin: EdgeInsets.only(top: 0),
         child:FutureBuilder<List<String>>(
           future: _service.fetchCovidMythData(),          
           builder: (BuildContext context, AsyncSnapshot<List<String>> snapshot) {
             return !snapshot.hasData?Center(child: CircularProgressIndicator(),):MythWidget(data: snapshot.data);
           },
         ),
        )

      ),
    );
  }
}
class MythWidget extends StatelessWidget {
  const MythWidget({ Key key, @required this.data }) : super(key: key);
  final List<String> data;
  @override
  Widget build(BuildContext context) {
   
    return ListView.builder(

        shrinkWrap: true,
        itemCount: data.length,
        itemBuilder: (BuildContext context, int index) {
         String urls = data[index];
        return  Card
          (
            elevation: 10,
            shadowColor: Colors.black,
            color: Colors.black,
            child:
           Image.network(urls,
           frameBuilder:(BuildContext context, Widget child, int frame, bool wasSynchronouslyLoaded) {
    return Padding(
      padding: EdgeInsets.all(5.0),
      child:child,
        );
       },        
        )
          );
       },
      );
    }
}