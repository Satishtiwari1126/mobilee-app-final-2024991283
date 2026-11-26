class Category {
  final String id;
  final String name;
  final String thumbnail;

  const Category({
    required this.id,
    required this.name,
    required this.thumbnail,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['idCategory']?.toString() ?? '',
      name: json['strCategory']?.toString() ?? 'Unknown',
      thumbnail: json['strCategoryThumb']?.toString() ?? '',
    );
  }
}
