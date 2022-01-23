import 'package:coronagraph/constants/strings.dart';
import 'package:coronagraph/model/coronaMyth.dart';
import 'package:coronagraph/model/coronaNews.dart';
import 'package:coronagraph/model/coronadata.dart';
import 'package:http/http.dart'as http;

class WebService{

  Future<Nepal> fetchNepalCovidData()async{
    final response=await http.get(Uri.https
    (mohp_Api_host, mohp_Api_path));
    if(response.statusCode==200){
      final nepal = covidDataFromJson(response.body).nepal;
      return nepal;
    }
     else {
      throw Exception("Unable to perform request!");
    }
  }

  Future<List<String>> fetchCovidMythData()async{
    List<String> mythImages=[];
    final response=await http.get(Uri.https(covid_Myth_host,covid_Myth_path));
    if(response.statusCode==200){
     covidMythFromJson(response.body).data.forEach((element) {
      element.imageUrl!=null?mythImages.add(element.imageUrl):null;
      });
      
      return mythImages;
    }
    else {
      throw Exception("Unable to perform request!");
    }
  }

  Future<List<News>> fetchCovidNewsData()async{
    final response=await http.get(Uri.https(covid_News_host,covid_News_path,covid_News_QueryParameters));
    if(response.statusCode==200){
     final data=covidNewsFromJson(response.body).items;
      return data;
    }
    else {
      throw Exception("Unable to perform request!");
    }
  }
}