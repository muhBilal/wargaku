class CategoryModel {
  final String category;
  final String imageUrl;
  final List<DataModel> data;

  CategoryModel(
      {required this.category, required this.imageUrl, required this.data});

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    var list = json['data'] as List;
    List<DataModel> dataList = list.map((i) => DataModel.fromJson(i)).toList();

    return CategoryModel(
      category: json['category'],
      imageUrl: json['image_url'],
      data: dataList,
    );
  }
}

class DataModel {
  final String name;
  final String imageUrl;
  final String appUrl;

  DataModel({required this.name, required this.imageUrl, required this.appUrl});

  factory DataModel.fromJson(Map<String, dynamic> json) {
    return DataModel(
      name: json['name'],
      imageUrl: json['image_url'],
      appUrl: json['app_url'],
    );
  }
}
