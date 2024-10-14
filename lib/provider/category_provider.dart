import 'package:flutter/foundation.dart';
import 'package:wargaku/model/category_model.dart';
import 'package:wargaku/service/category_service.dart';

class CategoryProvider with ChangeNotifier {
  List<CategoryModel> _categories = [];
  bool _isLoading = false;

  List<CategoryModel> get categories => _categories;
  bool get isLoading => _isLoading;

  final DataService _dataService = DataService();

  Future<void> loadCategories() async {
    _isLoading = true;
    notifyListeners();
    _categories = await _dataService.fetchCategories();
      // for (var category in _categories) {
      //   debugPrint('Category: ${category.category}'); 
      // }
    _isLoading = false;
    notifyListeners();
  }
}
