class RestaurantMenuItem {
  final String name;
  final int priceWon;
  final String? imageUrl;
  final String? badge;
  final List<String> ingredients;
  final List<String> instructions;
  final String sourceTitle;
  final String sourceUrl;

  const RestaurantMenuItem({
    required this.name,
    required this.priceWon,
    this.imageUrl,
    this.badge,
    required this.ingredients,
    required this.instructions,
    required this.sourceTitle,
    required this.sourceUrl,
  });
}
