import 'package:flutter/material.dart';
import '../models/category.dart';
import '../models/meal.dart';
import '../services/meal_api.dart';
import 'meal_list_screen.dart';
import 'meal_detail_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final api = MealApi();
  late Future<List<Category>> future = api.getCategories();
  Future<void> refresh() async { setState(() => future = api.getCategories()); await future; }

  Future<void> openRandom() async {
    try {
      final Meal? meal = await api.getRandomMeal();
      if (!mounted) return;
      if (meal != null) Navigator.push(context, MaterialPageRoute(builder: (_) => MealDetailScreen(meal: meal)));
    } catch (_) {
      if (mounted) ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Could not load a random recipe.')));
    }
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('RASA', style: TextStyle(fontWeight: FontWeight.w900, letterSpacing: 2)),
      actions: [IconButton(tooltip: 'Surprise me', onPressed: openRandom, icon: const Icon(Icons.casino_outlined))]),
    body: RefreshIndicator(onRefresh: refresh, child: FutureBuilder<List<Category>>(future: future, builder: (context, snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) return const Center(child: CircularProgressIndicator());
      if (snapshot.hasError) return ListView(children: [SizedBox(height: 220, child: Center(child: Column(mainAxisSize: MainAxisSize.min, children: [
        const Text('Unable to load categories.'), const SizedBox(height: 8), FilledButton(onPressed: refresh, child: const Text('Retry'))]))]);
      final categories = snapshot.data ?? [];
      return ListView(padding: const EdgeInsets.all(16), children: [
        Text('The Essence of Every Flavor', style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold)),
        const SizedBox(height: 6), Text('Find something delicious to make today.', style: Theme.of(context).textTheme.bodyMedium),
        const SizedBox(height: 20),
        Container(padding: const EdgeInsets.all(18), decoration: BoxDecoration(color: const Color(0xFFF3E1D5), borderRadius: BorderRadius.circular(20)),
          child: const Row(children: [Icon(Icons.restaurant_menu, size: 34, color: Color(0xFF8E432B)), SizedBox(width: 12),
            Expanded(child: Text('Explore recipes from around the world, one flavor at a time.', style: TextStyle(fontWeight: FontWeight.w600)))])),
        const SizedBox(height: 22), Text('Explore categories', style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold)),
        const SizedBox(height: 12),
        GridView.builder(shrinkWrap: true, physics: const NeverScrollableScrollPhysics(), itemCount: categories.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: .92, crossAxisSpacing: 12, mainAxisSpacing: 12),
          itemBuilder: (context, i) {
            final category = categories[i];
            return InkWell(borderRadius: BorderRadius.circular(18),
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => MealListScreen(category: category))),
              child: Card(clipBehavior: Clip.antiAlias, child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
                Expanded(child: Image.network(category.thumbnail, fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) => const Center(child: Icon(Icons.fastfood, size: 48)))),
                Padding(padding: const EdgeInsets.all(12), child: Text(category.name, style: const TextStyle(fontWeight: FontWeight.bold))),
              ])));
          }),
      ]);
    })),
  );
}
