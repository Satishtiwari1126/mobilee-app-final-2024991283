// The SDK deprecates this library but does not bundle its suggested replacement.
// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import '../models/restaurant_menu_item.dart';

const _porkRecipe = RestaurantMenuItem(
  name: '돼지석갈비',
  priceWon: 17000,
  badge: '대표',
  imageUrl:
      'https://search.pstatic.net/common/?autoRotate=true&quality=95&type=f320_320&src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20260419_69%2F1776595734395Mbhdh_JPEG%2F1000033608.jpg',
  ingredients: [
    'Pork ribs — about 600 g',
    'Soy sauce — 3 tbsp',
    'Brown sugar — 2 tbsp',
    'Rice wine — 2 tbsp',
    'Green onion — 1, chopped',
    'Garlic — 4 cloves, minced',
    'Sesame oil — 1 tbsp',
  ],
  instructions: [
    'Score the meaty side of the ribs so the marinade can soak in.',
    'Mix soy sauce, brown sugar, rice wine, green onion, garlic, and sesame oil.',
    'Coat the ribs and marinate in the refrigerator for at least 1 hour.',
    'Grill or broil, turning and brushing with marinade, until browned and fully cooked.',
    'Rest briefly, then serve hot with rice and side dishes.',
  ],
  sourceTitle: 'Korean Traditional Knowledge Portal — Dwaejigalbigui',
  sourceUrl:
      'https://koreantk.com/ktkp2014/life/life-view.view?artNo=0010102050162',
);

const _mulNaengmyeonRecipe = RestaurantMenuItem(
  name: '물냉면',
  priceWon: 11000,
  imageUrl:
      'https://search.pstatic.net/common/?autoRotate=true&quality=95&type=f320_320&src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20260420_180%2F17766591688626UTyg_JPEG%2F1000033612.jpg',
  ingredients: [
    'Buckwheat naengmyeon noodles — 160 g',
    'Chilled beef broth — 300 ml',
    'Radish — 30 g',
    'Cucumber — 30 g',
    'Pear — 30 g',
    'Boiled egg — 1/2',
    'Salt, sugar, and vinegar — for quick-pickling radish',
    'Mustard and vinegar — optional, to serve',
  ],
  instructions: [
    'Thinly slice radish and toss with a little salt, sugar, and vinegar. Rest 10 minutes, then drain.',
    'Julienne the cucumber and thinly slice the pear. Chill the beef broth until very cold.',
    'Boil the noodles according to their package directions. Rinse well under cold water, then drain.',
    'Place noodles in a bowl. Arrange radish, cucumber, pear, and egg on top.',
    'Pour over chilled beef broth. Add mustard or vinegar to taste and serve immediately.',
  ],
  sourceTitle: 'Korea Tourism Organization — Mul naengmyeon',
  sourceUrl:
      'https://english1.visitkorea.or.kr/enu/FOD/FO_EN_EC_Recipes.jsp?cid=1928358',
);

const _bibimRecipe = RestaurantMenuItem(
  name: '비빔냉면',
  priceWon: 12000,
  imageUrl:
      'https://search.pstatic.net/common/?autoRotate=true&quality=95&type=f320_320&src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20260420_263%2F17766591952845EgWE_JPEG%2F1000033614.jpg',
  ingredients: [
    'Naengmyeon noodles — 2 portions',
    'Gochujang — 2 tbsp',
    'Gochugaru — 1 tbsp',
    'Rice vinegar — 2 tbsp',
    'Soy sauce — 1 tbsp',
    'Sugar or rice syrup — 1 tbsp',
    'Sesame oil — 1 tsp',
    'Cucumber, pear, sesame seeds, and boiled egg — to garnish',
  ],
  instructions: [
    'Stir together gochujang, gochugaru, vinegar, soy sauce, sugar, and sesame oil.',
    'Boil the noodles following the package directions. Rinse in cold water and drain well.',
    'Toss noodles with the spicy sauce until evenly coated.',
    'Top with cucumber, pear, sesame seeds, and boiled egg. Serve cold.',
  ],
  sourceTitle: 'Korean Traditional Knowledge Portal — Bibim Naengmyeon',
  sourceUrl:
      'https://koreantk.com/ktkp2014/food/food-view.view?foodCd=TF10001435',
);

const _galbitangRecipe = RestaurantMenuItem(
  name: '궁중갈비탕',
  priceWon: 17000,
  imageUrl:
      'https://search.pstatic.net/common/?autoRotate=true&quality=95&type=f320_320&src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20260419_79%2F1776596217601B2hLo_JPEG%2F1000033610.jpg',
  ingredients: [
    'Beef short ribs — 600 g',
    'Korean radish — 200 g, cut into chunks',
    'Water — about 2 litres',
    'Garlic — 5 cloves',
    'Green onion — 2',
    'Soy sauce and salt — to taste',
    'Black pepper and egg — optional garnish',
  ],
  instructions: [
    'Soak ribs in cold water for 30 minutes, then rinse and drain.',
    'Cover ribs with fresh water, bring to a boil for a few minutes, and discard that water.',
    'Add fresh water, radish, garlic, and one green onion. Simmer gently until the ribs are tender, about 2–3 hours; skim foam as needed.',
    'Remove the vegetables and ribs. Season the broth with soy sauce, salt, and pepper.',
    'Return ribs and radish to the broth, heat through, and garnish with sliced green onion.',
  ],
  sourceTitle: 'Korean Traditional Knowledge Portal — Galbitang',
  sourceUrl:
      'https://koreantk.com/ktkp2014/food/food-view.view?foodCd=TF10003287',
);

const _hoeStyleRecipe = RestaurantMenuItem(
  name: '회냉면 (cooked-fish home version)',
  priceWon: 15000,
  ingredients: [
    'Naengmyeon noodles — 2 portions',
    'Cooked white fish — 150 g, cooled and flaked',
    'Gochujang — 2 tbsp',
    'Rice vinegar — 2 tbsp',
    'Soy sauce — 1 tbsp',
    'Sugar — 1 tbsp',
    'Sesame oil — 1 tsp',
    'Cucumber and sesame seeds — to garnish',
  ],
  instructions: [
    'Cook the fish thoroughly, cool it promptly, and flake it. Keep it refrigerated while preparing the noodles.',
    'Mix gochujang, vinegar, soy sauce, sugar, and sesame oil to make a tangy-spicy sauce.',
    'Boil noodles according to the package directions. Rinse in cold water and drain.',
    'Toss noodles with sauce and top with the cooked fish and cucumber.',
    'Sprinkle sesame seeds over the top and serve cold.',
  ],
  sourceTitle: 'KBS WORLD — Naengmyeon styles and traditional toppings',
  sourceUrl:
      'https://world.kbs.co.kr/service/contents_view.htm?board_code=&board_seq=337010&id=&lang=en&menu_cate=lifestyle&page=5',
);

final _items = [
  _porkRecipe,
  RestaurantMenuItem(
    name: '냉면정식',
    priceWon: 16000,
    badge: '점심특선',
    imageUrl:
        'https://search.pstatic.net/common/?autoRotate=true&quality=95&type=f320_320&src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20260419_160%2F1776596110375YNceh_JPEG%2F1000033618.jpg',
    ingredients: _mulNaengmyeonRecipe.ingredients,
    instructions: _mulNaengmyeonRecipe.instructions,
    sourceTitle: _mulNaengmyeonRecipe.sourceTitle,
    sourceUrl: _mulNaengmyeonRecipe.sourceUrl,
  ),
  RestaurantMenuItem(
    name: '석갈비정식',
    priceWon: 12000,
    badge: '점심특선',
    imageUrl:
        'https://search.pstatic.net/common/?autoRotate=true&quality=95&type=f320_320&src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20260419_83%2F1776596070942SHFPz_JPEG%2F1000033619.jpg',
    ingredients: _porkRecipe.ingredients,
    instructions: _porkRecipe.instructions,
    sourceTitle: _porkRecipe.sourceTitle,
    sourceUrl: _porkRecipe.sourceUrl,
  ),
  _galbitangRecipe,
  RestaurantMenuItem(
    name: '특왕갈비탕',
    priceWon: 20000,
    imageUrl:
        'https://search.pstatic.net/common/?autoRotate=true&quality=95&type=f320_320&src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20260419_72%2F1776596252077yvepL_JPEG%2F1000033610.jpg',
    ingredients: _galbitangRecipe.ingredients,
    instructions: _galbitangRecipe.instructions,
    sourceTitle: _galbitangRecipe.sourceTitle,
    sourceUrl: _galbitangRecipe.sourceUrl,
  ),
  _mulNaengmyeonRecipe,
  _bibimRecipe,
  RestaurantMenuItem(
    name: '회냉면',
    priceWon: 15000,
    ingredients: _hoeStyleRecipe.ingredients,
    instructions: _hoeStyleRecipe.instructions,
    sourceTitle: _hoeStyleRecipe.sourceTitle,
    sourceUrl: _hoeStyleRecipe.sourceUrl,
  ),
];

class KoreanMenuScreen extends StatelessWidget {
  const KoreanMenuScreen({super.key});

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
            const Text('Tap a dish to see its home-style recipe.'),
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
        child: InkWell(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => KoreanRecipeDetailScreen(item: item),
            ),
          ),
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
                      const SizedBox(height: 4),
                      const Text('View recipe  ›'),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
}

class KoreanRecipeDetailScreen extends StatelessWidget {
  final RestaurantMenuItem item;

  const KoreanRecipeDetailScreen({super.key, required this.item});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: const Text('Recipe')),
        body: ListView(
          padding: const EdgeInsets.fromLTRB(18, 0, 18, 28),
          children: [
            if (item.imageUrl != null)
              ClipRRect(
                borderRadius: BorderRadius.circular(18),
                child: AspectRatio(
                  aspectRatio: 16 / 10,
                  child: Image.network(
                    item.imageUrl!,
                    fit: BoxFit.cover,
                    errorBuilder: (_, __, ___) => const ColoredBox(
                      color: Color(0xFFF3E1D5),
                      child: Icon(Icons.restaurant, size: 64),
                    ),
                  ),
                ),
              ),
            const SizedBox(height: 16),
            Text(
              item.name,
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'Suggested home-style recipe based on the linked Korean food reference. It is not the restaurant’s proprietary recipe.',
            ),
            const SizedBox(height: 20),
            Text('Ingredients', style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 8),
            ...item.ingredients.map((ingredient) => ListTile(
                  dense: true,
                  contentPadding: EdgeInsets.zero,
                  leading: const Icon(Icons.check_circle_outline),
                  title: Text(ingredient),
                )),
            const SizedBox(height: 12),
            Text('Instructions', style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 8),
            ...item.instructions.indexed.map((entry) => Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        radius: 13,
                        backgroundColor: const Color(0xFFF3E1D5),
                        child: Text('${entry.$1 + 1}'),
                      ),
                      const SizedBox(width: 12),
                      Expanded(child: Text(entry.$2)),
                    ],
                  ),
                )),
            const SizedBox(height: 16),
            Text('Recipe reference',
                style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 4),
            Text(item.sourceTitle),
            SelectableText(item.sourceUrl,
                style: const TextStyle(color: Color(0xFF8E432B))),
            if (item.name.startsWith('회냉면')) ...[
              const SizedBox(height: 16),
              const Text(
                'Traditional hoe-naengmyeon is topped with raw fish. This version uses cooked fish; keep it chilled and follow safe handling directions.',
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
            ],
          ],
        ),
      );
}
