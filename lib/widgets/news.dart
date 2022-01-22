import 'package:flutter/material.dart';
import 'package:coronagraph/widgets/colors.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';
class News extends StatefulWidget {
  @override
  _NewsState createState() => _NewsState();
}

class _NewsState extends State<News> {
  _launchURL(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
  TextStyle heading = TextStyle
  ( 
    fontWeight: FontWeight.w900,
    color: white,
    fontSize: 30
  );
   TextStyle heading1 = TextStyle
  ( 
    fontWeight: FontWeight.w700,
    color:red,
    fontSize: 25
  );
   TextStyle heading2 = TextStyle
  ( 
    fontWeight: FontWeight.w500,
    color: Colors.black,
    fontSize: 20
  );
  var data;
  Future coronanews() async{
   String url="https://corona.askbhunte.com/api/v1/news";
   var response=await http.get(Uri.encodeFull(url),headers: {"Accept":"application/json"});
   var jsondata=json.decode(response.body);
   setState(() {  
   data=jsondata["data"];
   });
  }
 Widget newsbuilder(){
    if(data!=null){
      return ListView.builder(
        shrinkWrap: true,
        itemCount: data.length,
        itemBuilder: (BuildContext context, int index) {
         String imageurl = data[index]["image_url"];
         String title = data[index]["title"];
         String summary = data[index]["summary"];
         String newsurl = data[index]["url"];
         
        return ListTile
        ( 
          title: Card(
          elevation: 30,
          shadowColor: Colors.green,
          color:Colors.greenAccent ,
          child: 
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(title,style:heading1,),
              ),
              // Container
              //   ( 
              //     height:MediaQuery.of(context).size.height*0.5,
              //     width:MediaQuery.of(context).size.width,
              //     margin: EdgeInsets.all(10), 
              //     child: Image.network(imageurl,fit: BoxFit.cover,)
              //   ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50,vertical: 10),
                child: Text(summary,style:heading2,),
              ),
            ],
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
     coronanews();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold
    (
      backgroundColor: Colors.white,
      appBar: AppBar
      ( 
        centerTitle: true,
        title: Text("News",style: heading,),
      ),
      body: SafeArea
      (
        child: Container
        (margin: EdgeInsets.only(top: 10),
         child:newsbuilder(),
        )

      ),
    );
  }
}