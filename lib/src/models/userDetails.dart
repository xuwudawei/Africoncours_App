class User {
  String firstname;
  String lastname;
  String email;
  String url;
  String country;
  String currentAddress;
  String permanentAddress;
  String phone;
  String type;
  int starting;
  int ending;
  bool logged;
  bool verified;

  // Constructor definition
  User({this.firstname, this.lastname, this.email}) {
    this.logged = false;
    this.verified = false;
    this.url = "";
  }
}
