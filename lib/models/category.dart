class Category {
  final int id;
  final String categoryName;
  final bool isFavourite;
  final DateTime createdAt;
  final DateTime updatedAt;

  Category({
    required this.id,
    required this.categoryName,
    required this.isFavourite,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    final attributes = json['attributes'];
    return Category(
      id: json['id'],
      categoryName: attributes['categoryName'],
      isFavourite: attributes['isFavourite'] ?? false,
      createdAt: DateTime.parse(attributes['createdAt']),
      updatedAt: DateTime.parse(attributes['updatedAt']),
    );
  }
}
