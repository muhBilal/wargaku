class Kecamatan {
  final String id;
  final String name;

  Kecamatan({required this.id, required this.name});

  factory Kecamatan.fromJson(Map<String, dynamic> json) {
    return Kecamatan(
      id: json['id'], 
      name: json['name'], 
    );
  }
}
