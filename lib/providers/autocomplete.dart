import 'package:flutter/cupertino.dart';
import 'package:vrent/controller/autocomplete_places.dart';

class AutoCompletePlaces extends ChangeNotifier{

  List? searchResults=[];

  final autoComplete=PlacesAutoComplete();

  final pageController=PageController(initialPage: 0);


  search(String name) async{
    searchResults= await autoComplete.getAutoComplete(name);
    notifyListeners();
  }


  placeSelected(int num){
    if(num==1)
    {
      searchResults=null;
    }
    else{
      return null;
    }
    notifyListeners();
  }


}