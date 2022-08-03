class Sender{
  final int? id;
  final String? name;
  final String? imageUrl;
  final bool? isOnline;

  Sender({this.id, this.name, this.imageUrl, this.isOnline});

}

final Sender dummyUser1=Sender(
  id: 1,
  name: "Jack",
  imageUrl: "images/user1.png",
  isOnline: true
);

final Sender dummyUser2=Sender(
    id: 2,
    name: "Sam",
    imageUrl: "images/user2.png",
    isOnline: false
);

final Sender dummyUser3=Sender(
    id: 3,
    name: "Robert",
    imageUrl: "images/dummy.png",
    isOnline: true
);