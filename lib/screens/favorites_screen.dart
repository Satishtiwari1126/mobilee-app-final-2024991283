// The SDK deprecates this library but does not bundle its suggested replacement.
// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../services/meal_api.dart';
import '../services/favorites_storage.dart';
import '../widgets/meal_card.dart';
import 'meal_detail_screen.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});
  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  final api = MealApi();
  Future<List<Meal>> load() async {
    final ids = FavoritesStorage.getIds();
    final meals = <Meal>[];
    for (final id in ids) {
      final meal = await api.getMealDetails(id);
      if (meal != null) meals.add(meal);
    }
    return meals;
  }

  late Future<List<Meal>> future = load();

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: const Text('Your favorites'), actions: [
          IconButton(
              onPressed: () => setState(() => future = load()),
              icon: const Icon(Icons.refresh))
        ]),
        body: FutureBuilder<List<Meal>>(
            future: future,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }
              if (snapshot.hasError) {
                return Center(
                    child: Column(mainAxisSize: MainAxisSize.min, children: [
                  const Text('Could not load favorites. Check your connection.',
                      textAlign: TextAlign.center),
                  const SizedBox(height: 8),
                  FilledButton(
                      onPressed: () => setState(() => future = load()),
                      child: const Text('Retry')),
                ]));
              }
              final meals = snapshot.data ?? [];
              if (meals.isEmpty) {
                return const Center(
                    child: Padding(
                        padding: EdgeInsets.all(24),
                        child: Text(
                            'No favorites yet. Tap the heart on a recipe to save it.',
                            textAlign: TextAlign.center)));
              }
              return GridView.builder(
                  padding: const EdgeInsets.all(12),
                  itemCount: meals.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: .82,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10),
                  itemBuilder: (context, i) => MealCard(
                      meal: meals[i],
                      onFavoriteChanged: () => setState(() => future = load()),
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) =>
                                  MealDetailScreen(meal: meals[i])))));
            }),
      );
}
