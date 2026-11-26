import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../services/meal_api.dart';
import '../services/favorites_storage.dart';

class MealDetailScreen extends StatefulWidget {
  final Meal meal;
  const MealDetailScreen({super.key, required this.meal});
  @override
  State<MealDetailScreen> createState() => _MealDetailScreenState();
}

class _MealDetailScreenState extends State<MealDetailScreen> {
  final api = MealApi();
  late Future<Meal?> future = api.getMealDetails(widget.meal.id);

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('Recipe')),
    body: FutureBuilder<Meal?>(future: future, builder: (context, snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) return const Center(child: CircularProgressIndicator());
      if (snapshot.hasError) return Center(child: Column(mainAxisSize: MainAxisSize.min, children: [
        const Text('Unable to load recipe details.'), FilledButton(onPressed: () => setState(() => future = api.getMealDetails(widget.meal.id)), child: const Text('Retry'))]));
      final meal = snapshot.data ?? widget.meal;
      return ListView(padding: const EdgeInsets.only(bottom: 24), children: [
        AspectRatio(aspectRatio: 16 / 10, child: Image.network(meal.thumbnail, fit: BoxFit.cover, errorBuilder: (_, __, ___) => const Icon(Icons.restaurant, size: 64))),
        Padding(padding: const EdgeInsets.fromLTRB(18, 18, 18, 8), child: Text(meal.name, style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold))),
        Padding(padding: const EdgeInsets.symmetric(horizontal: 18), child: Text([meal.category, meal.area].where((s) => s.isNotEmpty).join(' • '))),
        Align(alignment: Alignment.centerLeft, child: Padding(padding: const EdgeInsets.all(12), child: OutlinedButton.icon(
          onPressed: () async { await FavoritesStorage.toggle(meal.id); if (mounted) setState(() {}); },
          icon: Icon(FavoritesStorage.contains(meal.id) ? Icons.favorite : Icons.favorite_border),
          label: Text(FavoritesStorage.contains(meal.id) ? 'Saved to favorites' : 'Add to favorites')))),
        Padding(padding: const EdgeInsets.all(18), child: Text('Ingredients', style: Theme.of(context).textTheme.titleLarge)),
        ...meal.ingredients.map((item) => ListTile(dense: true, leading: const Icon(Icons.check_circle_outline), title: Text(item.name), trailing: Text(item.measure))),
        Padding(padding: const EdgeInsets.all(18), child: Text('Instructions', style: Theme.of(context).textTheme.titleLarge)),
        Padding(padding: const EdgeInsets.symmetric(horizontal: 18), child: Text(meal.instructions.isEmpty ? 'Instructions are not available.' : meal.instructions)),
      ]);
    }),
  );
}
