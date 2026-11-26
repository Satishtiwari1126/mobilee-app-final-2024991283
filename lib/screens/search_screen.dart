// The SDK deprecates this library but does not bundle its suggested replacement.
// ignore_for_file: deprecated_member_use

import 'dart:async';
import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../services/meal_api.dart';
import '../widgets/meal_card.dart';
import 'meal_detail_screen.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});
  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final controller = TextEditingController();
  final api = MealApi();
  Timer? debounce;
  List<Meal> results = [];
  bool loading = false;
  String? error;
  bool searched = false;

  void search(String value) {
    debounce?.cancel();
    if (value.trim().isEmpty) {
      setState(() {
        results = [];
        searched = false;
        error = null;
        loading = false;
      });
      return;
    }
    debounce = Timer(const Duration(milliseconds: 450), () async {
      setState(() {
        loading = true;
        error = null;
        searched = true;
      });
      try {
        final data = await api.searchMeals(value.trim());
        if (mounted) {
          setState(() {
            results = data;
            loading = false;
          });
        }
      } catch (e) {
        if (mounted) {
          setState(() {
            error = 'Search failed. Check your connection and try again.';
            loading = false;
          });
        }
      }
    });
  }

  @override
  void dispose() {
    debounce?.cancel();
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: const Text('Search recipes')),
        body: Column(children: [
          Padding(
              padding: const EdgeInsets.all(16),
              child: TextField(
                  controller: controller,
                  onChanged: search,
                  decoration: InputDecoration(
                      hintText: 'Search a meal, e.g. chicken',
                      prefixIcon: const Icon(Icons.search),
                      suffixIcon: IconButton(
                          icon: const Icon(Icons.clear),
                          onPressed: () {
                            controller.clear();
                            search('');
                          }),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16))))),
          Expanded(
            child: loading
                ? const Center(child: CircularProgressIndicator())
                : error != null
                    ? Center(child: Text(error!))
                    : !searched
                        ? const Center(
                            child:
                                Text('Search for a dish to discover recipes.'))
                        : results.isEmpty
                            ? const Center(
                                child:
                                    Text('No recipes found. Try another name.'))
                            : GridView.builder(
                                padding: const EdgeInsets.all(12),
                                itemCount: results.length,
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        childAspectRatio: .82,
                                        crossAxisSpacing: 10,
                                        mainAxisSpacing: 10),
                                itemBuilder: (context, i) => MealCard(
                                    meal: results[i],
                                    onTap: () => Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (_) => MealDetailScreen(
                                                meal: results[i]))))),
          ),
        ]),
      );
}
