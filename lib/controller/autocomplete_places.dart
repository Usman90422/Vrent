import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:vrent/models/places.dart';

class PlacesAutoComplete{

  Future<List<Places>> getAutoComplete(String placename) async {

    var url=Uri.parse("https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$placename&key=AIzaSyBTgQlEkr-2wCjgy4mLVvNCrrIqa0KvSn8");
    var response=await http.get(url);
    var json=jsonDecode(response.body);
    var results=json["predictions"] as List;
    return results.map((place) => Places.fromJson(place)).toList();

  }

}
