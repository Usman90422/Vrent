import 'package:flutter/cupertino.dart';
import 'package:geocode/geocode.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:vrent/view/main%20screens/tabs/property%20listing%20tab/pages/page4.dart';

class MapProvider extends ChangeNotifier{

  final geoCode=GeoCode();
  Address address=Address();

  final addressController=TextEditingController();




  String postalCode='';
  String city='';
  String countryName='';
  String streetAddress='';
  String streetNumber='';

   List<Marker> marker=[] ;

  getCoordinates(double lat, double lng , LatLng tappedPoint)
  async {
    address= await geoCode.reverseGeocoding(latitude: lat, longitude: lng);

      marker=[];
      marker.add(
        Marker(
          icon: BitmapDescriptor.defaultMarkerWithHue(
              BitmapDescriptor.hueGreen),
          markerId: MarkerId(tappedPoint.toString()),
          position: tappedPoint,
        ),
      );


        city= address.city!=null ?address.city.toString() : "";
        countryName=address.countryName!=null?address.countryName.toString():"";
        streetAddress=address.streetAddress!=null?address.streetAddress.toString():"";
        streetNumber= address.streetNumber!=null ?  address.streetNumber.toString():"";
        postalCode=address.postal!=null ?address.postal.toString() :"";
        addressController.text=streetAddress+" "+streetNumber+" "+postalCode+" "+city+" "+countryName;

    print(countryName+"  "+ streetAddress + " " + streetNumber);
    notifyListeners();
  }




}
