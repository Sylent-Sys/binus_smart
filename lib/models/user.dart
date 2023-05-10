class User {
  int id;
  String email;
  String username;
  String password;
  String phone;
  Name name;
  Address address;
  User({
    required this.id,
    required this.email,
    required this.username,
    required this.password,
    required this.phone,
    required this.name,
    required this.address,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      email: json['email'],
      username: json['username'],
      password: json['password'],
      phone: json['phone'],
      name: Name.fromJson(json['name']),
      address: Address.fromJson(json['address']),
    );
  }
}

class Name {
  String firstname;
  String lastname;

  Name({
    required this.firstname,
    required this.lastname,
  });

  factory Name.fromJson(Map<String, dynamic> json) {
    return Name(
      firstname: json['firstname'],
      lastname: json['lastname'],
    );
  }
}

class Address {
  String city;
  String street;
  int number;
  String zipcode;
  Geolocation geolocation;
  Address({
    required this.city,
    required this.street,
    required this.number,
    required this.zipcode,
    required this.geolocation,
  });
  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      city: json['city'],
      street: json['street'],
      number: json['number'],
      zipcode: json['zipcode'],
      geolocation: Geolocation.fromJson(json['geolocation']),
    );
  }
}

class Geolocation {
  String lat;
  String long;

  Geolocation({
    required this.lat,
    required this.long,
  });

  factory Geolocation.fromJson(Map<String, dynamic> json) {
    return Geolocation(
      lat: json['lat'],
      long: json['long'],
    );
  }
}
