class Places{
  final String description;

  Places({required this.description});

  factory Places.fromJson(Map<String,dynamic> json) {
    return Places(description: json["description"]);
  }

}