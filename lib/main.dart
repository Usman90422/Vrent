import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vrent/controller/user_details.dart';
import 'package:vrent/models/property%20listing%20models/additional_pricing_options.dart';
import 'package:vrent/providers/add_payment_method.dart';
import 'package:vrent/providers/autocomplete.dart';
import 'package:vrent/providers/map_address_provider.dart';
import 'package:vrent/providers/page_provider.dart';
import 'package:vrent/providers/photos_provider.dart';
import 'package:provider/provider.dart';
import 'package:vrent/view/splashscreen.dart';

import 'controller/add_payout.dart';



void main(){
  runApp( const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AutoCompletePlaces()),
        ChangeNotifierProvider(create: (context) => PagesProvider()),
        ChangeNotifierProvider(create: (context) => AdditionalPricing()),
        ChangeNotifierProvider(create: (context) =>  MapProvider()),
        ChangeNotifierProvider(create: (context) =>  PhotosProvider()),
        ChangeNotifierProvider(create: (context) => PaymentMethodProvider()),
        ChangeNotifierProvider(create: (context) => UserDetails()),

      ],
      child: MaterialApp(
        title: 'V-rent',
        theme: ThemeData(
          unselectedWidgetColor: Colors.grey,
          textTheme: GoogleFonts.poppinsTextTheme(
            Theme.of(context).textTheme,
          ),
          scaffoldBackgroundColor: Colors.black,
          textSelectionTheme: const TextSelectionThemeData(cursorColor: Colors.white),
        ),
        home:  Splash_Screen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

