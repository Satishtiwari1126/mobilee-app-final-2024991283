import 'package:flutter_test/flutter_test.dart';
import 'package:rasa/models/category.dart';
import 'package:rasa/models/meal.dart';

void main() {
  group('Category.fromJson', () {
    test('parses TheMealDB category fields', () {
      final category = Category.fromJson({
        'idCategory': '1',
        'strCategory': 'Beef',
        'strCategoryThumb': 'https://example.com/beef.png',
      });

      expect(category.id, '1');
      expect(category.name, 'Beef');
      expect(category.thumbnail, 'https://example.com/beef.png');
    });

    test('uses safe defaults for missing values', () {
      final category = Category.fromJson({});

      expect(category.id, '');
      expect(category.name, 'Unknown');
      expect(category.thumbnail, '');
    });
  });

  group('Meal.fromJson', () {
    test('parses meal details and non-empty ingredients', () {
      final meal = Meal.fromJson({
        'idMeal': '52772',
        'strMeal': 'Teriyaki Chicken Casserole',
        'strMealThumb': 'https://example.com/meal.png',
        'strCategory': 'Chicken',
        'strArea': 'Japanese',
        'strInstructions': 'Mix and bake.',
        'strIngredient1': 'Chicken',
        'strMeasure1': '2 cups',
        'strIngredient2': '  ',
        'strMeasure2': '1 tsp',
      });

      expect(meal.id, '52772');
      expect(meal.name, 'Teriyaki Chicken Casserole');
      expect(meal.category, 'Chicken');
      expect(meal.area, 'Japanese');
      expect(meal.instructions, 'Mix and bake.');
      expect(meal.ingredients, hasLength(1));
      expect(meal.ingredients.single.name, 'Chicken');
      expect(meal.ingredients.single.measure, '2 cups');
    });
  });
}
