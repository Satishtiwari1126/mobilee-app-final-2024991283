// The SDK deprecates this library but does not bundle its suggested replacement.
// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import '../models/restaurant_menu_item.dart';

class KoreanMenuScreen extends StatelessWidget {
  const KoreanMenuScreen({super.key});

  static const _items = [
    RestaurantMenuItem(
      name: '돼지석갈비',
      priceWon: 17000,
      badge: '대표',
      imageUrl:
          'https://search.pstatic.net/common/?autoRotate=true&quality=95&type=f320_320&src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20260419_69%2F1776595734395Mbhdh_JPEG%2F1000033608.jpg',
    ),
    RestaurantMenuItem(
      name: '냉면정식',
      priceWon: 16000,
      badge: '점심특선',
      imageUrl:
          'https://search.pstatic.net/common/?autoRotate=true&quality=95&type=f320_320&src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20260419_160%2F1776596110375YNceh_JPEG%2F1000033618.jpg',
    ),
    RestaurantMenuItem(
      name: '석갈비정식',
      priceWon: 12000,
      badge: '점심특선',
      imageUrl:
          'https://search.pstatic.net/common/?autoRotate=true&quality=95&type=f320_320&src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20260419_83%2F1776596070942SHFPz_JPEG%2F1000033619.jpg',
    ),
    RestaurantMenuItem(
      name: '궁중갈비탕',
      priceWon: 17000,
      imageUrl:
          'https://search.pstatic.net/common/?autoRotate=true&quality=95&type=f320_320&src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20260419_79%2F1776596217601B2hLo_JPEG%2F1000033610.jpg',
    ),
    RestaurantMenuItem(
      name: '특왕갈비탕',
      priceWon: 20000,
      imageUrl:
          'https://search.pstatic.net/common/?autoRotate=true&quality=95&type=f320_320&src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20260419_72%2F1776596252077yvepL_JPEG%2F1000033610.jpg',
    ),
    RestaurantMenuItem(
      name: '물냉면',
      priceWon: 11000,
      imageUrl:
          'https://search.pstatic.net/common/?autoRotate=true&quality=95&type=f320_320&src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20260420_180%2F17766591688626UTyg_JPEG%2F1000033612.jpg',
    ),
    RestaurantMenuItem(
      name: '비빔냉면',
      priceWon: 12000,
      imageUrl:
          'https://search.pstatic.net/common/?autoRotate=true&quality=95&type=f320_320&src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20260420_263%2F17766591952845EgWE_JPEG%2F1000033614.jpg',
    ),
    RestaurantMenuItem(name: '회냉면', priceWon: 15000),
  ];

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: const Text('Korean menu')),
        body: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            Text(
              'Korean favorites',
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            const Text('Menu picks and prices in Korean won.'),
            const SizedBox(height: 12),
            ..._items.map((item) => _MenuCard(item: item)),
          ],
        ),
      );
}

class _MenuCard extends StatelessWidget {
  final RestaurantMenuItem item;

  const _MenuCard({required this.item});

  @override
  Widget build(BuildContext context) => Card(
        margin: const EdgeInsets.only(bottom: 12),
        clipBehavior: Clip.antiAlias,
        child: Row(
          children: [
            SizedBox(
              width: 112,
              height: 112,
              child: item.imageUrl == null
                  ? const ColoredBox(
                      color: Color(0xFFF3E1D5),
                      child: Icon(Icons.restaurant, size: 40),
                    )
                  : Image.network(
                      item.imageUrl!,
                      fit: BoxFit.cover,
                      errorBuilder: (_, __, ___) => const ColoredBox(
                        color: Color(0xFFF3E1D5),
                        child: Icon(Icons.restaurant, size: 40),
                      ),
                    ),
            ),
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (item.badge != null) ...[
                      Text(
                        item.badge!,
                        style: const TextStyle(
                          color: Color(0xFF8E432B),
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 4),
                    ],
                    Text(
                      item.name,
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium
                          ?.copyWith(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 6),
                    Text('₩${item.priceWon ~/ 1000},000'),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
}
