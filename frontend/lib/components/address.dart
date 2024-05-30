class Address {
  final String country;
  final String region;
  final String city;
  final String postCode;
  final String address;
  final String phone;

  Address({
    required this.country,
    required this.region,
    required this.city,
    required this.postCode,
    required this.address,
    required this.phone,
  });

  Map<String, dynamic> toJson() {
    return {
      "country": country,
      "region": region,
      "city": city,
      "postCode": postCode,
      "address": address,
      "phone": phone,
    };
  }
}
