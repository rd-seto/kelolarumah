class UserRegistration {
   String? name;
   String? email;
   String? password;
   String? confirmPassword;
   String? type;

  UserRegistration({this.name, this.type = 'landlord', this.email, this.password, this.confirmPassword});

  Map<String, dynamic> toJson() => {'name': name, 'email': email, 'password': password, 'type': type};
}
