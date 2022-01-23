import 'package:coronagraph/widgets/myths.dart';
import 'package:coronagraph/widgets/news.dart';
import 'package:coronagraph/widgets/home.dart';
import 'package:flutter/material.dart';
import 'package:nepali_utils/nepali_utils.dart';
void main()
{
  NepaliUtils(Language.nepali);
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp
    (
      initialRoute: "/",
      routes: {
        "/":(context)=>Home(),
        "/news":(context)=>NewsScreen(),
        "/myth":(context)=>MythScreen(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}