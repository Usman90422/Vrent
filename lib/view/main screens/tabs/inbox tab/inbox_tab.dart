import 'package:flutter/material.dart';
import 'package:vrent/constants/constants.dart';
import 'package:vrent/models/inbox/message.dart';
import 'package:vrent/view/main%20screens/tabs/inbox%20tab/chat_screen.dart';
import 'package:vrent/widgets/bold_heading.dart';
import 'package:vrent/widgets/heading.dart';

class Inbox extends StatefulWidget {
  const Inbox({Key? key}) : super(key: key);

  @override
  _InboxState createState() => _InboxState();
}

class _InboxState extends State<Inbox> {
  @override
  Widget build(BuildContext context) {
    var size=MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 5),
                child: Center(child: BoldHeading(title: "Inbox")),
              ),
              const Divider(color: kDarkGrey,thickness: 2),
              SizedBox(
                height: size.height,
                child: ListView.builder(
                    itemCount: chats.length,
                    itemBuilder: (BuildContext context,int index){
                      final Message chat=chats[index];
                  return GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>ChatScreen(sender: chat.sender!)));
                    },
                    child: SizedBox(
                        height: 90,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Row(
                            children: [
                              Stack(
                                clipBehavior: Clip.antiAlias,
                                children: [
                                  Container(
                                    width: 65,
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                    ),
                                    child: Image(image: AssetImage("${chat.sender!.imageUrl}"),),),
                                  Positioned(
                                    bottom: -5,
                                    right: 0,
                                    child: chat.sender!.isOnline==true? Container(
                                      child: const Text(""),
                                      width: 20,
                                      decoration:  BoxDecoration(
                                        color: Colors.green,
                                        border: Border.all(
                                            color: Colors.black,
                                            width: 4,
                                            style: BorderStyle.solid),
                                        shape: BoxShape.circle ),
                                    ):SizedBox(),
                                  ),
                                ],
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 20),
                                    child: Text("${chat.sender!.name}",
                                        style: TextStyle(
                                            color: chat.unread==true? kPrimaryColor : Colors.grey,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15)),
                                  ),
                                const SizedBox(height: 5),
                                Padding(
                                  padding: const EdgeInsets.only(left:20,right: 10),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox(
                                        width: 160,
                                          child: Text("${chat.text}",
                                              style:  TextStyle(
                                                  color: chat.unread==true? kPrimaryColor:Colors.grey,
                                                  overflow: TextOverflow.ellipsis),
                                          ),
                                      ),
                                      const SizedBox(width: 20),
                                      Text("${chat.time}",style: TextStyle(color: chat.unread==true? kPrimaryColor:Colors.grey,)),
                                    ],
                                  ),
                                ),
                              ],
                              ),
                            ],
                          ),
                        ),
                      ),
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


//ListView(
//                   children: [
//                     Container(
//                       height: 80,
//                       child: Padding(
//                         padding: const EdgeInsets.symmetric(horizontal: 10),
//                         child: Row(
//                           children: [
//                             Stack(
//                               clipBehavior: Clip.antiAlias,
//                               children: [
//                                 Container(
//                                   width: 65,
//                                   decoration: const BoxDecoration(
//                                     color: Colors.white,
//                                     shape: BoxShape.circle,
//                                   ),
//                                   child: const Image(image: AssetImage("images/user1.png"),),),
//                                 Positioned(
//                                   bottom: -5,
//                                   right: 0,
//                                   child: Container(
//                                     child: const Text(""),
//                                     width: 20,
//                                     decoration:  BoxDecoration(
//                                       color: Colors.green,
//                                       border: Border.all(color: Colors.black,width: 4,style: BorderStyle.solid),
//                                       shape: BoxShape.circle ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                             Column(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 const Padding(
//                                   padding: EdgeInsets.only(left: 20),
//                                   child: Text("Jack",style: TextStyle(color: kPrimaryColor,fontWeight: FontWeight.bold,fontSize: 15)),
//                                 ),
//                               const SizedBox(height: 5),
//                               Padding(
//                                 padding: const EdgeInsets.only(left:20),
//                                 child: Row(
//                                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                   children: const [
//                                     SizedBox(
//                                       width: 160,
//                                         child: Text("Hey! how are you doing?",
//                                             style: TextStyle(color: Colors.white,
//                                                 overflow: TextOverflow.ellipsis),
//                                         ),
//                                     ),
//                                     SizedBox(width: 8),
//                                     Text("10:20 am",style: TextStyle(color: Colors.white)),
//                                   ],
//                                 ),
//                               ),
//                             ],
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                     Container(
//                       height: 80,
//                       child: Padding(
//                         padding: const EdgeInsets.symmetric(horizontal: 10),
//                         child: Row(
//                           children: [
//                             Stack(
//                               clipBehavior: Clip.antiAlias,
//                               children: [
//                                 Container(
//                                   width: 65,
//                                   decoration: const BoxDecoration(
//                                     color: Colors.white,
//                                     shape: BoxShape.circle,
//                                   ),
//                                   child: const Image(image: AssetImage("images/user2.png"),),),
//                                 Positioned(
//                                   bottom: -5,
//                                   right: 0,
//                                   child: Container(
//                                     child: const Text(""),
//                                     width: 20,
//                                     decoration:  BoxDecoration(
//                                         color: Colors.green,
//                                         border: Border.all(color: Colors.black,width: 4,style: BorderStyle.solid),
//                                         shape: BoxShape.circle ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                             Column(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 const Padding(
//                                   padding: EdgeInsets.only(left: 20),
//                                   child: Text("Sam",style: TextStyle(color: kPrimaryColor,fontWeight: FontWeight.bold,fontSize: 15)),
//                                 ),
//                                 const SizedBox(height: 5),
//                                 Padding(
//                                   padding: const EdgeInsets.only(left:20),
//                                   child: Row(
//                                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                     children: const [
//                                       SizedBox(
//                                         width: 160,
//                                         child: Text("I am good mate",
//                                           style: TextStyle(color: Colors.white,
//                                               overflow: TextOverflow.ellipsis),
//                                         ),
//                                       ),
//                                       SizedBox(width: 8),
//                                       Text("11:24 am",style: TextStyle(color: Colors.white)),
//                                     ],
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),