import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vrent/constants/constants.dart';
import 'package:vrent/models/property%20listing%20models/property_details.dart';
import 'package:vrent/providers/autocomplete.dart';
import 'package:vrent/providers/page_provider.dart';
import 'package:vrent/view/main%20screens/tabs/property%20listing%20tab/property_listing_tab.dart';
import 'package:vrent/widgets/bold_heading.dart';
import 'package:vrent/widgets/button_with_icon.dart';
import 'package:vrent/widgets/heading.dart';
import 'package:vrent/widgets/line.dart';
import 'package:vrent/widgets/mybutton.dart';
import 'package:vrent/widgets/mytextfield.dart';


class Page1 extends StatefulWidget {
  const Page1({Key? key}) : super(key: key);


  @override
  _Page1State createState() => _Page1State();
}

final autoCompletePlaces=AutoCompletePlaces();
final cityController=TextEditingController();



class _Page1State extends State<Page1> {
  @override
  Widget build(BuildContext context) {
    final autoCompletePlaces= Provider.of<AutoCompletePlaces>(context);
    var size=MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          // Header
          // const Padding(
          //   padding:
          //       EdgeInsets.only(left: 120, top: 20, right: 120, bottom: 20),
          //   child: Hero(
          //       tag: "logo",
          //       child: Image(image: AssetImage("images/vrent_logo.png"))),
          // ),

          //Title
          const Center(
            child: BoldHeading(title: 'List your space',),
          ),

          Line(),

          //home Type
          const Heading(title: "Home Type",),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xff3A3A3C),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Container(
                child: DropdownButtonHideUnderline(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: DropdownButton(
                      isExpanded: true,
                      hint: const Text(
                        "Select a home type",
                        style: TextStyle(color: Colors.white60),
                      ),
                      dropdownColor: const Color(0xff3A3A3C),
                      value: propertyDetails.selectedHomeType,
                      onChanged: (newVal) {
                        setState(() {
                          propertyDetails.selectedHomeType =
                          newVal as String?;
                        });
                      },
                      items: propertyDetails.homeType.map((htype) {
                        return DropdownMenuItem(
                            value: htype,
                            child: Text(
                              htype,
                              style: const TextStyle(color: Colors.white),
                            ));
                      }).toList(),
                    ),
                  ),
                ),
              ),
            ),
          ),

          //Room Type
          const SizedBox(height: 20),
         const Heading(title: "Room Type"),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xff3A3A3C),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Container(
                child: DropdownButtonHideUnderline(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: DropdownButton(
                      isExpanded: true,
                      hint: const Text(
                        "Select a room type",
                        style: TextStyle(color: Colors.white60),
                      ),
                      dropdownColor: Color(0xff3A3A3C),
                      value: propertyDetails.selectedRoomType,
                      onChanged: (newVal) {
                        setState(() {
                          propertyDetails.selectedRoomType =
                          newVal as String?;
                        });
                      },
                      items: propertyDetails.roomType.map((htype) {
                        return DropdownMenuItem(
                            value: htype,
                            child: Text(
                              htype,
                              style: const TextStyle(color: Colors.white),
                            ));
                      }).toList(),
                    ),
                  ),
                ),
              ),
            ),
          ),

          //Accommodations
          const SizedBox(height: 20),
          const Heading(title: "Accommodates",),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xff3A3A3C),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Container(
                child: DropdownButtonHideUnderline(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: DropdownButton(
                      isExpanded: true,
                      hint: const Text(
                        "Select a number",
                        style: TextStyle(color: Colors.white60),
                      ),
                      dropdownColor: Color(0xff3A3A3C),
                      value: propertyDetails.selectedAccommodates,
                      onChanged: (newVal) {
                        setState(() {
                          propertyDetails.selectedAccommodates =
                          newVal as String?;
                        });
                      },
                      items: propertyDetails.accommodates.map((htype) {
                        return DropdownMenuItem(
                            value: htype,
                            child: Text(
                              htype,
                              style: const TextStyle(color: Colors.white),
                            ));
                      }).toList(),
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),


          //City
          const Heading(title: "City",),
          const SizedBox(height: 20),
          MyTextField(hintText: "Enter a city",controller: cityController ,onChanged: (city){
            autoCompletePlaces.search(city);
          },),

          //Button and search recommendation
          Stack(children: [

            //Button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 30),
              child: ButtonWithIcon(
                isBack: false,
                  color: kButtonColor,
                Width: size.width*0.9,
                icon: const Icon(Icons.arrow_forward,color: Colors.white,),
                text: "Next",
                goToPage: 1),
            ),

            SizedBox(
              child:Column(children: [
                if(autoCompletePlaces.searchResults!=null
                    && autoCompletePlaces.searchResults!.isNotEmpty
                    && cityController.text.isNotEmpty ) //&& pickUpAddressFilled=false
                  Container(
                    margin: const  EdgeInsets.symmetric(vertical: 2,horizontal: 20),
                    height: 178,
                    decoration: BoxDecoration(
                      color: kDarkGrey,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ListView.builder(
                        itemCount: autoCompletePlaces.searchResults!.length,
                        itemBuilder: (context,index){
                          return ListTile(
                            title: Text(autoCompletePlaces.searchResults![index].description,
                              style: const TextStyle(color: Colors.white),),
                            onTap: (){
                              cityController.text= autoCompletePlaces.searchResults![index].description;
                              autoCompletePlaces.placeSelected(1);
                              // pickUpAddressFilled=true;
                              FocusScope.of(context).unfocus();
                            },
                          );
                        }),
                  ),
              ],
              ),
            ),

          ],),

        ],
      ),
    );
  }
}

