import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:rasa/services/meal_api.dart';

void main() {
  group('MealApi', () {
    test('loads and parses categories from TheMealDB', () async {
      final client = MockClient((request) async {
        expect(request.method, 'GET');
        expect(request.url.toString(),
            'https://www.themealdb.com/api/json/v1/1/categories.php');
        return http.Response(
          jsonEncode({
            'categories': [
              {
                'idCategory': '1',
                'strCategory': 'Beef',
                'strCategoryThumb': 'https://example.com/beef.png',
              },
            ],
          }),
          200,
        );
      });

      final categories = await MealApi(client: client).getCategories();

      expect(categories, hasLength(1));
      expect(categories.single.name, 'Beef');
    });

    test('encodes search queries and parses full meal details', () async {
      final client = MockClient((request) async {
        expect(request.url.path, '/api/json/v1/1/search.php');
        expect(request.url.queryParameters['s'], 'chicken & rice');
        return http.Response(
          jsonEncode({
            'meals': [
              {
                'idMeal': '52772',
                'strMeal': 'Chicken & Rice',
                'strMealThumb': 'https://example.com/meal.png',
                'strCategory': 'Chicken',
                'strArea': 'Japanese',
                'strInstructions': 'Mix and bake.',
                'strIngredient1': 'Chicken',
                'strMeasure1': '2 cups',
              },
            ],
          }),
          200,
        );
      });

      final meals = await MealApi(client: client).searchMeals('chicken & rice');

      expect(meals, hasLength(1));
      expect(meals.single.id, '52772');
      expect(meals.single.ingredients.single.name, 'Chicken');
      expect(meals.single.ingredients.single.measure, '2 cups');
    });

    test('returns an empty list when TheMealDB has no matches', () async {
      final client =
          MockClient((_) async => http.Response('{"meals":null}', 200));

      expect(await MealApi(client: client).searchMeals('no match'), isEmpty);
    });

    test('reports unsuccessful HTTP responses', () async {
      final client = MockClient((_) async => http.Response('Unavailable', 503));

      await expectLater(
        MealApi(client: client).getCategories(),
        throwsA(isA<Exception>()),
      );
    });
  });
}
