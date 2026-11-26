// The SDK deprecates this library but does not bundle its suggested replacement.
// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import '../models/category.dart';
import '../models/meal.dart';
import '../services/meal_api.dart';
import '../widgets/meal_card.dart';
import 'meal_detail_screen.dart';

class MealListScreen extends StatefulWidget {
  final Category category;
  const MealListScreen({super.key, required this.category});
  @override
  State<MealListScreen> createState() => _MealListScreenState();
}

class _MealListScreenState extends State<MealListScreen> {
  final api = MealApi();
  late Future<List<Meal>> future;
  @override
  void initState() {
    super.initState();
    future = api.getMealsByCategory(widget.category.name);
  }

  Future<void> retry() async {
    setState(() => future = api.getMealsByCategory(widget.category.name));
    await future;
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: Text(widget.category.name)),
        body: FutureBuilder<List<Meal>>(
            future: future,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }
              if (snapshot.hasError) {
                return Center(
                    child: Column(mainAxisSize: MainAxisSize.min, children: [
                  const Text('Could not load recipes.'),
                  const SizedBox(height: 8),
                  FilledButton(onPressed: retry, child: const Text('Retry'))
                ]));
              }
              final meals = snapshot.data ?? [];
              if (meals.isEmpty) {
                return const Center(
                    child: Text('No recipes found in this category.'));
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
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) =>
                                  MealDetailScreen(meal: meals[i])))));
            }),
      );
}
