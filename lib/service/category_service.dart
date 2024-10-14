import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:wargaku/model/category_model.dart';

class DataService {
  Future<List<CategoryModel>> fetchCategories() async { 
    final String response = await rootBundle.loadString('data/data.json');
    final List<dynamic> data = jsonDecode(response);
    return data.map((json) => CategoryModel.fromJson(json)).toList(); 
  }
}
