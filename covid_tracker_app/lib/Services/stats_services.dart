import 'dart:convert';

import 'package:covid_tracker_app/Modal/world_stats_model.dart';
import 'package:covid_tracker_app/Services/Utilities/app_urls.dart';
import 'package:http/http.dart' as http;

import '../Modal/country_stats_model.dart';

class StatsServices{

  Future<WorldStatsModel> fetchWorldStatsRecords() async{
    final response = await http.get(Uri.parse(AppUrls.worldStatesApi));

    if(response.statusCode == 200){
      var data = jsonDecode(response.body);
      return WorldStatsModel.fromJson(data);
    }else{
      throw Exception("Error");
    }

  }

  Future<List<dynamic>> CountryListApi() async{
    var data;
    final response = await http.get(Uri.parse(AppUrls.countriesListApi));

    if(response.statusCode == 200){
      data = jsonDecode(response.body);
      return data;
    }else{
      throw Exception("Error");
    }

  }


  Future<CountryStatsModel> fetchCountryStatsRecord(String countryName) async{
    final response = await http.get(Uri.parse('${AppUrls.countriesListApi}/$countryName'));

    if(response.statusCode == 200){
      var data = jsonDecode(response.body);
      return CountryStatsModel.fromJson(data);
    }else{
      throw Exception("Error");
    }
  }


}