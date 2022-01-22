import 'package:coronagraph/widgets/colors.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
class Myth extends StatefulWidget {
  @override
  _MythState createState() => _MythState();
}

class _MythState extends State<Myth> {
  TextStyle heading = TextStyle
  ( 
    fontWeight: FontWeight.w600,
    color: white,
    fontSize: 30
  );
  var data;
  Future coronamyth() async{
   String url="https://corona.askbhunte.com/api/v1/myths";
   var response=await http.get(Uri.encodeFull(url),headers: {"Accept":"application/json"});
   var jsondata=json.decode(response.body);
   setState(() {  
   data=jsondata["data"];
   });
  }
 Widget mythbuilder(){
    if(data!=null){
      return ListView.builder(
        shrinkWrap: true,
        itemCount: data.length,
        itemBuilder: (BuildContext context, int index) {
         String urls = data[index]["image_url"];
        return ListTile
        (
          title: Card
          (
            child:Image.network(
              urls,
              fit: BoxFit.contain,
              width: MediaQuery.of(context).size.width*0.9,
              height: MediaQuery.of(context).size.height*0.81,
              ),
          ),
        );
       },
      );
    }
    else{
      return Center(child: CircularProgressIndicator());
    }
  }
  @override
  void initState() {
    super.initState();
     coronamyth();
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
         child:mythbuilder(),
        )

      ),
    );
  }
}