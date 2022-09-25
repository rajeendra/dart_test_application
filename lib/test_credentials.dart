
class AppCredentials {

  String? user = '<user>';
  String? password = '<password>';

  Map<String, dynamic> toJson() => {
    'user': user,
    'password': password,
  };

}
