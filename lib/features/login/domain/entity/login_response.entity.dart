class LoginResponseEntity {
  String? userName;
  String? email;
  String? accessToken;
  String? refreshToken;
  LoginResponseEntity({
    this.accessToken,
    this.email,
    this.refreshToken,
    this.userName,
  });
}
