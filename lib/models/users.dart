class User {
  late final String firstName;
  late final String lastName;
  late final String email;
  late final String password;
  late final String formattedPhone;
  late final String carrierCode;
  late final String defaultCountry;
  late final String phone;


  User({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
    required this.formattedPhone,
    required this.carrierCode,
    required this.defaultCountry,
    required this.phone,

  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      firstName: json['first_Name'],
      lastName: json['last_Name'],
      password: json['password'],
      email: json['email'],
      formattedPhone: json['formatted_phone'],
      phone: json['phone'],
      defaultCountry: json['default_country'],
      carrierCode: json['carrier_code'],

    );
  }
}
