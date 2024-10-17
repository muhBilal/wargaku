class User {
  final int uid;
  final String name;
  final String role;
  final String nik;
  final String accessToken;

  User({
    required this.uid,
    required this.name,
    required this.role,
    required this.nik,
    required this.accessToken,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      uid: json['uid'],
      name: json['name'],
      role: json['role'],
      nik: json['nik'],
      accessToken: json['access_token'],
    );
  }
}
