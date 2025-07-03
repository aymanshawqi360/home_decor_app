class SignUpRequestEntity {
  String? fullName;
  String? email;
  String? userName;
  String? mobileNumber;
  String? dateOfBirth;
  String? password;
  String? confirmPassword;
  SignUpRequestEntity({
    this.fullName,
    this.email,
    this.userName,
    this.mobileNumber,
    this.dateOfBirth,
    this.password,
    this.confirmPassword,
  });
}
