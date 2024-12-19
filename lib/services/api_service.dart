import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/category.dart';
import '../models/food.dart';

class ApiService {
  final String baseUrl = "https://lecook.pirus.app/api";

  Future<List<Category>> fetchCategories() async {
    final response = await http.get(Uri.parse('$baseUrl/categories'));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body) as List;
      return data.map((e) => Category.fromJson(e)).toList();
    } else {
      throw Exception("Failed to load categories");
    }
  }

  Future<List<Food>> fetchFoods() async {
    final response = await http.get(Uri.parse('$baseUrl/foods'));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body) as List;
      return data.map((e) => Food.fromJson(e)).toList();
    } else {
      throw Exception("Failed to load foods");
    }
  }

  Future<List<Food>> searchFoods(String query) async {
    final response = await http.get(Uri.parse('$baseUrl/foods?search=$query'));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body) as List;
      return data.map((e) => Food.fromJson(e)).toList();
    } else {
      throw Exception("Failed to search foods");
    }
  }
}
