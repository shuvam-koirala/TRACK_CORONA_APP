
import 'package:coronagraph/model/coronaNews.dart';
import 'package:coronagraph/services/webservice.dart';
import 'package:flutter/material.dart';
import 'package:coronagraph/constants/colors.dart';
import 'package:nepali_utils/nepali_utils.dart';

import 'package:url_launcher/url_launcher.dart';
class NewsScreen extends StatefulWidget {
  @override
  _NewsScreenState createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
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
    fontSize: 25
  );
   TextStyle heading1 = TextStyle
  ( 
    fontWeight: FontWeight.w700,
    color:red,
    fontSize: 20
  );
   TextStyle heading2 = TextStyle
  ( 
    fontWeight: FontWeight.w500,
    color: black,
    fontSize: 18
  );
  
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
      backgroundColor: white,
      appBar: AppBar
      ( 
        centerTitle: true,
        title: Text("News",style: heading,),
      ),
      body: SafeArea
      (
        child: Container
        (margin: EdgeInsets.only(top: 10),
         child:FutureBuilder<List<News>>(
           future: _service.fetchCovidNewsData(),
           builder: (BuildContext context, AsyncSnapshot<List<News>> snapshot) {
             return !snapshot.hasData?Center(child: CircularProgressIndicator()):NewsWidget(data: snapshot.data, heading1: heading1, heading2: heading2);
           },
         ),
        )

      ),
    );
  }
}

class NewsWidget extends StatelessWidget {
  const NewsWidget({ Key key,@required this.data,@required this.heading1,@required this.heading2 }) : super(key: key);
  final List<News> data;
  final TextStyle heading1,heading2;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: data.length,
        itemBuilder: (BuildContext context, int index) {
         String title = data[index].title;
         String description = data[index].description;
         String content = data[index].content;
         DateTime date = data[index].publishedAt;
         NepaliDateTime newsDate=NepaliDateTime.parse(date.toIso8601String());
        return ListTile
        ( 
          title: Card(
          elevation: 30,
          shadowColor: green,
          color:greenAccent ,
          child: 
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(title,style:heading1,),
              ),
              
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50,vertical: 10),
                child: Text(description,style:heading2,),
              ),
              Align(alignment: Alignment.bottomRight,child: Text("${newsDate.year}-${newsDate.month}-${newsDate.day}",style:heading2),)
            ,SizedBox(height: 10,)
            ],
          ),
          ),
          
        );
       },
      );
    }
  }