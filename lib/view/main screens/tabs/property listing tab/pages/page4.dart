import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:vrent/constants/constants.dart';
import 'package:vrent/providers/map_address_provider.dart';
import 'package:vrent/widgets/bold_heading.dart';
import 'package:vrent/widgets/button_with_icon.dart';
import 'package:vrent/widgets/heading.dart';
import 'package:vrent/widgets/line.dart';
import 'package:vrent/widgets/mybutton.dart';
import 'package:vrent/widgets/mytextfield.dart';

class Page4 extends StatefulWidget {
  const Page4({Key? key}) : super(key: key);

  @override
  _Page4State createState() => _Page4State();
}

class _Page4State extends State<Page4> {

  final initialCameraPosition = const CameraPosition(target: LatLng(54.525961,15.255119),zoom: 5);
  late GoogleMapController  mapController;

  final mapProvider=MapProvider();


  String address="";


  bool isTappingMap=false;


  @override
  void dispose() {
    mapProvider.addressController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {

    final mapProvider=Provider.of<MapProvider>(context);

    void addMarker(LatLng tappedPoint){
      print("Lat:${tappedPoint.latitude} , Lng: ${tappedPoint.longitude}");
      mapProvider.getCoordinates(tappedPoint.latitude, tappedPoint.longitude,tappedPoint);
    }

    var size=MediaQuery.of(context).size;
    return SingleChildScrollView(
         physics: isTappingMap==true ?  NeverScrollableScrollPhysics():  AlwaysScrollableScrollPhysics(), // <--
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children:  [
            const SizedBox(height: 20),

            //Title
            const Center(
              child: BoldHeading(title: 'List your space'),
            ),

            const Line(),
            const Padding(
                padding: EdgeInsets.only(left: 20),
                child: BoldHeading(title: 'Location')),
            const SizedBox(height: 20),

            const Heading(title: "Country"),
            const SizedBox(height: 20),
            const MyTextField(hintText: "Enter country name "),


            const SizedBox(height: 20),
            const Heading(title: "Address Line 1"),
            const SizedBox(height: 20),
             MyTextField(hintText:"Enter an address",controller: mapProvider.addressController,
               inputType: TextInputType.multiline,
               ),
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text( "You can also use the map to fill the address field by placing a marker. Press the globe toggle icon for a smooth interaction with map",
                style: TextStyle(fontSize: 10,color: Colors.white),),
            ),



            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
              child: Container(
                width: size.width,
                height: 300,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                ),
                child: Stack(
                  children: [

                    GoogleMap(
                      mapType: MapType.normal,
                      initialCameraPosition: initialCameraPosition,
                      onMapCreated: (controller){
                        mapController=controller;
                      },
                      markers: Set.from(mapProvider.marker),
                      onTap: addMarker,
                    ),

                    IconButton(
                      onPressed: () {
                        setState(() {
                          isTappingMap=!isTappingMap;
                        });
                    },
                      icon:  Icon(Icons.language,color: isTappingMap==true ? Colors.green : Colors.red,),),
                  ],
                ),
              ),
            ),


            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ButtonWithIcon(
                      isBack:true,
                      text: 'Back',
                      goToPage: 2,
                      Width: size.width*0.4,
                      color: Colors.red,
                      icon:  const Icon(Icons.arrow_back_sharp,color: Colors.white,)),
                  ButtonWithIcon(
                      isBack:false,
                      text: 'Next',
                      goToPage: 4,
                      Width: size.width*0.4,
                      color: kButtonColor,
                      icon:  const Icon(Icons.arrow_forward,color: Colors.white,)),

                ],),
            ),


          ],
        ),

    );
  }

}
