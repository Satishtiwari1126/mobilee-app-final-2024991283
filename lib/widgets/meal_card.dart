// The SDK deprecates this library but does not bundle its suggested replacement.
// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../services/favorites_storage.dart';

class MealCard extends StatefulWidget {
  final Meal meal;
  final VoidCallback onTap;
  final VoidCallback? onFavoriteChanged;
  const MealCard(
      {super.key,
      required this.meal,
      required this.onTap,
      this.onFavoriteChanged});
  @override
  State<MealCard> createState() => _MealCardState();
}

class _MealCardState extends State<MealCard> {
  @override
  Widget build(BuildContext context) {
    final favorite = FavoritesStorage.contains(widget.meal.id);
    return Card(
        clipBehavior: Clip.antiAlias,
        child: InkWell(
            onTap: widget.onTap,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                      child: Stack(fit: StackFit.expand, children: [
                    Image.network(widget.meal.thumbnail,
                        fit: BoxFit.cover,
                        errorBuilder: (_, __, ___) => const ColoredBox(
                            color: Color(0xFFF1E4DA),
                            child: Icon(Icons.restaurant, size: 42))),
                    Positioned(
                        right: 6,
                        top: 6,
                        child: CircleAvatar(
                            backgroundColor: Colors.white,
                            child: IconButton(
                              visualDensity: VisualDensity.compact,
                              icon: Icon(
                                  favorite
                                      ? Icons.favorite
                                      : Icons.favorite_border,
                                  color: favorite ? Colors.red : Colors.brown),
                              onPressed: () async {
                                await FavoritesStorage.toggle(widget.meal.id);
                                if (mounted) setState(() {});
                                widget.onFavoriteChanged?.call();
                              },
                            ))),
                  ])),
                  Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text(widget.meal.name,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(fontWeight: FontWeight.w600))),
                ])));
  }
}
