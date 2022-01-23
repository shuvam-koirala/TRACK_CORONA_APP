import 'package:coronagraph/model/coronadata.dart';
import 'package:coronagraph/services/webservice.dart';
import 'package:coronagraph/constants/colors.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  WebService _service;

   TextStyle title = TextStyle
  ( 
    fontWeight: FontWeight.w900,
    color: Colors.white,
    fontSize: 20
  );
    TextStyle heading1 = TextStyle
  (    fontWeight: FontWeight.w900,

    color:Colors.deepOrange,
    fontSize: 50,
  );

  TextStyle heading = TextStyle
  (    fontWeight: FontWeight.w700,

    color: white,
    fontSize: 18,
  );

  final dateTextStyle = TextStyle(
        fontSize: 30, color: yellow, fontWeight: FontWeight.bold);

  TextStyle subtittle =TextStyle
  (
    color:white,
    fontSize: 16, 
    fontWeight: FontWeight.bold,
  );

 @override
  void initState() {
    _service=WebService();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

     var height=MediaQuery.of(context).size.height;
     var width=MediaQuery.of(context).size.width;
    
    return Scaffold (
          appBar: AppBar
          (        
             actions: 
             [
              Row(
                 mainAxisSize: MainAxisSize.min,
                  children: 
                  [
                    TextButton(
                     child: Text("Myth",style: heading,),
                     onPressed: (){
                       Navigator.of(context).pushNamed("/myth");
                     }
                     ),
                     TextButton(
                     child: Text("News",style: heading,),
                     onPressed: (){
                       Navigator.of(context).pushNamed("/news");
                     }
                     ),
                  ], 
              ),
             ],            
            title:
                Text("CORONA TRACKER",style: title,),
          ),
          body: 
          SafeArea(
            child:FutureBuilder<Nepal>(
              future: _service.fetchNepalCovidData(),
              builder: (BuildContext context, AsyncSnapshot<Nepal> snapshot) {
                return !snapshot.hasData?Center(child: CircularProgressIndicator (semanticsLabel: "Loading...",)):
                Container(
            
            child: SingleChildScrollView (
                child: Column
                (
                  children: 
                  [
                    SizedBox(height: 15,),
                    DateContainer(date: snapshot.data.extra6, dateTextStyle: dateTextStyle, heading1: heading1),
                    HeadingContainer(text: "Recent Updates"),
                    Wrap
                    (
                      children: 
                      [

                       CasesContainer(data: snapshot.data.todayNewcase, titleText: "New Cases",color: blue,heading: heading,subTitle: subtittle),
                       CasesContainer(data: snapshot.data.todayDeath, titleText: "New Deaths",color:cyan,heading: heading,subTitle: subtittle) ,
                       CasesContainer(data: snapshot.data.todayRecovered, titleText: "New Recovered",color: green,heading: heading,subTitle: subtittle),
                       CasesContainer(data: snapshot.data.todayPcr, titleText: "New PCR",color: deepOrange,heading: heading,subTitle: subtittle) ,
                       CasesContainer(data: snapshot.data.todayRdt, titleText: "New RDT",color: indigo,heading: heading,subTitle: subtittle),
                        
                      ],
                    ),
                    HeadingContainer(text: "Total Updates",),
                  
                    Wrap
                    (
                      children: 
                      [
                       CasesContainer(data:snapshot.data.positive, titleText: "Total Cases",color: red,heading: heading,subTitle: subtittle),                        
                       CasesContainer(data: snapshot.data.extra2, titleText: "Total Infected",color: amber,heading: heading,subTitle: subtittle), 
                       CasesContainer(data: snapshot.data.extra1, titleText: "Total Recovered",color: blue,heading: heading,subTitle: subtittle),
                       CasesContainer(data: snapshot.data.deaths, titleText: "Total Deaths",color: cyan,heading: heading,subTitle: subtittle),
                       CasesContainer(data: snapshot.data.samplesTested, titleText: "Total PCR",color: blue,heading: heading,subTitle: subtittle),
                       CasesContainer(data: snapshot.data.extra5, titleText: "Isolation",color: indigo,heading: heading,subTitle: subtittle) ,
                       CasesContainer(data: snapshot.data.extra8, titleText: "Quarantined",color: deepOrange,heading: heading,subTitle: subtittle) 

                      ],
                    ),
                     
                   HeadingContainer(text: "Wash Your Hands, Stay Safe")

                  ],
                
                )
                  
                ),
            );
              },
            ),
             
          ),
    );

  }
}

class DateContainer extends StatelessWidget {
  const DateContainer({ Key key,@required this.date,@required this.dateTextStyle,@required this.heading1 }) : super(key: key);
  final String date;
  final TextStyle dateTextStyle,heading1;
  @override
  Widget build(BuildContext context) {
    return Container(
              height: MediaQuery.of(context).size.height*0.2,
              width: MediaQuery.of(context).size.width*0.95,
              decoration: BoxDecoration
              (
                 border: Border.all(color: Colors.white54,width: 1.5),
                boxShadow:[
                  BoxShadow(color: Colors.black45,offset: Offset(0,0),spreadRadius: 2,blurRadius: 4)
                ],
                borderRadius: BorderRadius.all(Radius.circular(10)),
              color: blue,
                
              ),
              child: Column
              (
                mainAxisAlignment: MainAxisAlignment.center,

                children: 
                [
                  Center(child: Text("Date",style: heading1,)),
                  Text((date).toString(),style: dateTextStyle),
                ],
              ),
            );
  }
}

class HeadingContainer extends StatelessWidget {
  const HeadingContainer({
    Key key,
    @required this.text,
  }) : super(key: key);
  final String text; 
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height:15),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                
                boxShadow:[
                  BoxShadow(color: Colors.black45,offset: Offset(0,4),spreadRadius: 1,blurRadius: 4)
                ],
              color: Colors.grey,
              borderRadius: BorderRadius.circular(10)),                     
              padding: EdgeInsets.all(10),
              child: Center(
                child: Text(text,
                style: TextStyle(color: Colors.white,
                fontSize: 20,
                fontWeight:FontWeight.bold
                ),
                ),
              ),),
          ),
         SizedBox(height:15),
      ],
    );
  }
}

class CasesContainer extends StatelessWidget {
   CasesContainer({ Key key,@required this.data,@required this.titleText,@required this.color,@required this.heading,@required this.subTitle }) : super(key: key);
  final String data;
  final String titleText;
  final Color color;
  final TextStyle heading;
  final TextStyle subTitle; 
   
  @override
  Widget build(BuildContext context) {
    return InkWell(
                         onTap: (){                  
                           },
                                child: Container(
                                  margin: EdgeInsets.symmetric(vertical: 5,horizontal: 5),
             height: MediaQuery.of(context).size.height*0.15,
              width: MediaQuery.of(context).size.width*0.4,
             decoration: BoxDecoration
              (

                border: Border.all(color: Colors.white54,width: 1.5),
                boxShadow:[
                  BoxShadow(color: Colors.black45,offset: Offset(3,4),spreadRadius: 2,blurRadius: 4)
                ],
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: color,
                
              ),
              child: Column
              (
                mainAxisAlignment: MainAxisAlignment.center,

                children: 
                [
                  Center(child: Text(titleText,style: heading,)),
                  Text((data).toString(),style: subTitle,),
                ],
              ),
            ),
                       );
  }
}