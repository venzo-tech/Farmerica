class CustomerModel {
  String email;
  String mobileNumber;
  String password;

  CustomerModel({required this.email, required this.mobileNumber, required this.password});

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {};
    map.addAll({'email': email, 'mobileNumber': mobileNumber, 'password': password, 'username': email});
    return map;
  }
}
