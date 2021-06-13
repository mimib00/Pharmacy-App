class UserData {
  String? firstName, lastName, wilaya, address, email, phone;

  UserData({
    required this.firstName,
    required this.lastName,
    required this.wilaya,
    required this.address,
    required this.email,
    required this.phone,
  });

  UserData.fromMap(Map<String, dynamic> data) {
    firstName = data['first_name'];
    lastName = data['last_name'];
    phone = data['phone'];
    email = data['email'];
    address = data['address'];
    wilaya = data['wilaya'];
  }
}
