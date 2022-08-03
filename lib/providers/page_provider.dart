import 'package:flutter/cupertino.dart';

class PagesProvider extends ChangeNotifier{

  final pageController=PageController(initialPage: 0);


  void goToPage(int num){
    pageController.animateToPage(num, duration: const Duration(milliseconds: 500), curve: Curves.easeIn);
    notifyListeners();
  }

  //common Inclusions
  bool essentials=false;
  bool tv=false;
  bool cableTv=false;
  bool airConditioning=false;
  bool kitchen=false;
  bool internet=false;
  bool gym=false;
  bool elevator=false;
  bool indoorFirePlace=false;
  bool buzzer=false;
  bool doorman=false;
  bool shampoo=false;
  bool wirelessInternet=false;
  bool jacuzzi=false;
  bool washer=false;
  bool pool=false;
  bool dryer=false;
  bool breakfast=false;
  bool freeParking=false;
  bool familyFriendly=false;
  bool smokingAllowed=false;
  bool suitableForEvents=false;
  bool petsAllowed=false;
  bool petsOnProperty=false;
  bool wheelChairAccessible=false;
  bool firePlace=false;


  //safety Inclusions
  bool carbonMonoDetector=false;
  bool safetyCard=false;
  bool smokeDetector=false;
  bool firstAidKit=false;
  bool fireExtinguisher=false;

  //row wise num
  void commonInclusionsCheck(bool isChecked,int num)
  {
    if(num==1){essentials=isChecked;}
    if(num==2){tv=isChecked;}
    if(num==3){cableTv=isChecked;}
    if(num==4){airConditioning=isChecked;}
    if(num==5){kitchen=isChecked;}
    if(num==6){internet=isChecked;}
    if(num==7){gym=isChecked;}
    if(num==8){elevator=isChecked;}
    if(num==9){indoorFirePlace=isChecked;}
    if(num==10){buzzer=isChecked;}
    if(num==11){doorman=isChecked;}
    if(num==12){shampoo=isChecked;}
    if(num==13){wirelessInternet=isChecked;}
    if(num==14){jacuzzi=isChecked;}
    if(num==15){washer=isChecked;}
    if(num==16){pool=isChecked;}
    if(num==17){dryer=isChecked;}
    if(num==18){breakfast=isChecked;}
    if(num==19){freeParking=isChecked;}
    if(num==20){familyFriendly=isChecked;}
    if(num==21){smokingAllowed=isChecked;}
    if(num==22){suitableForEvents=isChecked;}
    if(num==23){petsAllowed=isChecked;}
    if(num==24){petsOnProperty=isChecked;}
    if(num==25){wheelChairAccessible=isChecked;}
    if(num==26){firePlace=isChecked;}
    notifyListeners();
  }

  void safetyInclusionsCheck(bool isChecked,int num)
  {
    if(num==1){smokeDetector=isChecked;}
    if(num==2){carbonMonoDetector=isChecked;}
    if(num==3){firstAidKit=isChecked;}
    if(num==4){safetyCard=isChecked;}
    if(num==5){fireExtinguisher=isChecked;}

    notifyListeners();

  }





}