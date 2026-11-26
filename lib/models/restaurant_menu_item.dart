class RestaurantMenuItem {
  final String name;
  final int priceWon;
  final String? imageUrl;
  final String? badge;

  const RestaurantMenuItem({
    required this.name,
    required this.priceWon,
    this.imageUrl,
    this.badge,
  });
}
