import 'package:coronagraph/constants/strings.dart';
import 'package:coronagraph/model/coronadata.dart';
import 'package:http/http.dart'as http;
class WebService{
  Future<Nepal> fetchNepalCovidData()async{
    final response=await http.get(mohp_Api_Url);
    if(response.statusCode==200){
      final nepal = covidDataFromJson(response.body).nepal;
      return nepal;
    }
     else {
      throw Exception("Unable to perform request!");
    }
  }
}