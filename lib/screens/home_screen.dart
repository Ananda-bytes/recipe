import 'package:flutter/material.dart';

import '../models/category.dart';
import '../models/food.dart';
import '../services/api_service.dart';
import '../widgets/category_chip.dart';
import '../widgets/food_card.dart';
import 'foods_screen.dart';

class HomeScreen extends StatelessWidget {
  final ApiService apiService = ApiService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Recipe App"),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SearchScreen()),
              );
            },
          ),
        ],
      ),
      body: FutureBuilder(
          future: Future.wait(
              [apiService.fetchCategories(), apiService.fetchFoods()]),
          builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
            if (snapshot.connectionState == connectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return Center(child: Text('Error loading data'));
            } else {
              final categories = snapshot.data![0] as List<Category>;
              final foods = snapshot.data![1] as List<Food>;

              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        'Categories',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: categories.map((category) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      FoodsScreen(category: category),
                                ),
                              );
                            },
                            child: Categorychip(category: category),
                          );
                        }).toList(),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        'Popular Recipe',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    GridView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 3 / 2,
                      ),
                      itemCount: foods.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    RecipeScreen(food: foods[index]),
                              ),
                            );
                          },
                          child: FoodCard(food: foods[index]),
                        );
                      },
                    ),
                  ],
                ),
              );
            }
          }),
    );
  }
}
