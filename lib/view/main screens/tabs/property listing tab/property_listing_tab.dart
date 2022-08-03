import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vrent/models/property%20listing%20models/property_details.dart';
import 'package:vrent/providers/page_provider.dart';
import 'package:vrent/view/main%20screens/tabs/property%20listing%20tab/pages/page1.dart';
import 'package:vrent/view/main%20screens/tabs/property%20listing%20tab/pages/page2.dart';
import 'package:vrent/view/main%20screens/tabs/property%20listing%20tab/pages/page3.dart';
import 'package:vrent/view/main%20screens/tabs/property%20listing%20tab/pages/page4.dart';
import 'package:vrent/view/main%20screens/tabs/property%20listing%20tab/pages/page5.dart';
import 'package:vrent/view/main%20screens/tabs/property%20listing%20tab/pages/page6.dart';
import 'package:vrent/view/main%20screens/tabs/property%20listing%20tab/pages/page7.dart';
import 'package:vrent/view/main%20screens/tabs/property%20listing%20tab/pages/page8.dart';
import 'package:vrent/view/main%20screens/tabs/property%20listing%20tab/pages/page9.dart';

class PropertyListing extends StatefulWidget {
  const PropertyListing({Key? key}) : super(key: key);

  @override
  _PropertyListingState createState() => _PropertyListingState();
}

PagesProvider pageControllerProvider=PagesProvider();
final propertyDetails = PropertyDetails();


class _PropertyListingState extends State<PropertyListing> {
  @override
  Widget build(BuildContext context) {
    final pageControllerProvider= Provider.of<PagesProvider>(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: pageControllerProvider.pageController,
          children:  const [
            Page1(),
            Page2(),
            Page3(),
            Page4(),
            Page5(),
            Page6(),
            Page7(),
            Page8(),
            Page9(),

          ],
        ),
      ),
    );
  }
}

