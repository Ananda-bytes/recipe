class Food {
  final int id;
  final String foodName;
  final String foodType;
  final bool isGlutenFree;
  final String steps;
  final String ingredients;
  final DateTime createdAt;
  final DateTime updatedAt;

  Food({
    required this.id,
    required this.foodName,
    required this.foodType,
    required this.isGlutenFree,
    required this.steps,
    required this.ingredients,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Food.fromJson(Map<String, dynamic> json) {
    final attributes = json['attributes'];
    return Food(
      id: json['id'],
      foodName: attributes['foodName'],
      foodType: attributes['foodType'],
      isGlutenFree: attributes['isGlutenFree'],
      steps: attributes['steps'],
      ingredients: attributes['ingredients'],
      createdAt: DateTime.parse(attributes['createdAt']),
      updatedAt: DateTime.parse(attributes['updatedAt']),
    );
  }
}
