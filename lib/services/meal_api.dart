import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/category.dart';
import '../models/meal.dart';

class MealApi {
  static const String _base = 'https://www.themealdb.com/api/json/v1/1';
  final http.Client _client;
  MealApi({http.Client? client}) : _client = client ?? http.Client();

  Future<dynamic> _get(String endpoint) async {
    final response = await _client.get(Uri.parse('$_base/$endpoint')).timeout(const Duration(seconds: 20));
    if (response.statusCode != 200) throw Exception('Recipe service error: ${response.statusCode}');
    return jsonDecode(response.body);
  }

  Future<List<Category>> getCategories() async {
    final data = await _get('categories.php') as Map<String, dynamic>;
    final list = data['categories'] as List? ?? [];
    return list.map((e) => Category.fromJson(e as Map<String, dynamic>)).toList();
  }

  Future<List<Meal>> getMealsByCategory(String category) async {
    final data = await _get('filter.php?c=' + Uri.encodeQueryComponent(category)) as Map<String, dynamic>;
    final list = data['meals'] as List? ?? [];
    return list.map((e) => Meal.fromJson(e as Map<String, dynamic>)).toList();
  }

  Future<Meal?> getMealDetails(String id) async {
    final data = await _get('lookup.php?i=' + Uri.encodeQueryComponent(id)) as Map<String, dynamic>;
    final list = data['meals'] as List? ?? [];
    return list.isEmpty ? null : Meal.fromJson(list.first as Map<String, dynamic>);
  }

  Future<List<Meal>> searchMeals(String query) async {
    final data = await _get('search.php?s=' + Uri.encodeQueryComponent(query)) as Map<String, dynamic>;
    final list = data['meals'] as List? ?? [];
    return list.map((e) => Meal.fromJson(e as Map<String, dynamic>)).toList();
  }

  Future<Meal?> getRandomMeal() async {
    final data = await _get('random.php') as Map<String, dynamic>;
    final list = data['meals'] as List? ?? [];
    return list.isEmpty ? null : Meal.fromJson(list.first as Map<String, dynamic>);
  }
}
