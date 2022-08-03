import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vrent/constants/constants.dart';
import 'package:vrent/models/inbox/message.dart';
import 'package:vrent/models/inbox/sender.dart';
import 'package:vrent/models/users.dart';
import 'package:vrent/widgets/mytextfield.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key, required this.sender}) : super(key: key);

  final Sender sender;

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {

  ChatBubble(Message msg,bool isMe){
    var size=MediaQuery.of(context).size;
    if(isMe==false){
      return Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const[
                Text(""),
                Text("10:24 am",
                  style: TextStyle(color: Colors.grey,overflow: TextOverflow.clip,fontSize: 10),),
              ],
            ),
            const SizedBox(width: 5),
            Container(
              padding: EdgeInsets.all(8),
              width: size.width*0.7,
              decoration: BoxDecoration(
                color: kDarkGrey,
                borderRadius: BorderRadiusDirectional.circular(20),
              ),
              child: const Text("I am good! What about you? ",
                style: TextStyle(color: Colors.white,overflow: TextOverflow.clip),
              ),
            ),
            const SizedBox(width: 5),
            Container(
              width: 30,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
              ),
              child: Image(image: AssetImage("images/user2.png"),),),

          ],),
      );
    }
    else{
      return  Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          Container(
            width: 30,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
            ),
            child: Image(image: AssetImage("${widget.sender.imageUrl}"),),),
          const SizedBox(width: 5),
          Container(
            padding: EdgeInsets.all(8),
            width: size.width*0.7,
            decoration: BoxDecoration(
              color: kDarkGrey,
              borderRadius: BorderRadiusDirectional.circular(20),
            ),
            child: const Text("Hey! how are you doing?  ",
              style: TextStyle(color: Colors.white,overflow: TextOverflow.clip),
            ),
          ),
          const SizedBox(width: 5),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const[
              Text(""),
              Text("10:22 am",
                style: TextStyle(color: Colors.grey,overflow: TextOverflow.clip,fontSize: 10),),
            ],
          ),
        ],),
    );}

  }

  final Message message=Message();

  @override
  Widget build(BuildContext context) {
    var size=MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            //app bar
            Container(
            color: Colors.black,
            child: Padding(
        padding:  const EdgeInsets.symmetric(vertical: 0,horizontal: 10),
        child: Row(children: [
            IconButton(onPressed: (){Navigator.pop(context);}, icon: const Icon(Icons.arrow_back_outlined),color: Colors.white,),
            Container(
              width: 30,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
              ),
              child: Image(image: AssetImage("${widget.sender.imageUrl}"),),),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("${widget.sender.name}",style: const TextStyle(color: kPrimaryColor,fontSize: 12),),
                    Text(widget.sender.isOnline==true? "Online":"Offline",style: const TextStyle(color: Colors.grey,fontSize: 12)),
                  ]),
            ),
        ],),
        ),
          ),

            //chats body
            Expanded(
              child: ListView.builder(
                  itemCount: chats.length-1,
                  itemBuilder: (BuildContext context,int index){
                    final Message message=chats[index];
                    final bool isMe=message.sender!.id==widget.sender.id;
                return ChatBubble(message, isMe);
              }),
            ),

            //textfield
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Container(
                      width: size.width*0.7,
                      height: 50,
                      decoration: BoxDecoration(
                        color: const Color(0xff3A3A3C),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: const TextField(
                        style: TextStyle(color: Colors.white,overflow: TextOverflow.clip),
                        decoration: InputDecoration(
                          hintText: "Aa",
                          hintStyle: TextStyle(
                              fontSize: 15.0, color: Colors.white60),
                          border: InputBorder.none,
                          contentPadding:  EdgeInsets.only(left: 10),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: (){

                      },
                      child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 10),
                          // color: kButtonColor,
                          width: 40,
                          child: Image(image: const AssetImage("images/send.png"))),
                    ),
                  ],
                ),
              ),

            ),
          ],
        ),
      ),
    );
  }
}
