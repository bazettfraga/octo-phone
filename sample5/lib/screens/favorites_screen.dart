import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../widgets/meal_item.dart';

import '../dummy_data.dart';

class FavoritesScreen extends StatefulWidget {
  final List<Meal> favoriteMeals;

  FavoritesScreen(this.favoriteMeals);

  @override
  _FavoritesScreenState createState() => _FavoritesScreenState();
}


class _FavoritesScreenState extends State<FavoritesScreen> {

  @override
  Widget build(BuildContext context) {
    if(widget.favoriteMeals.isEmpty) {
      return const Center(
        child: Text('You have no favorites yet!'),
      );
    }else{
      return ListView.builder(
          itemBuilder: (ctx, index) {
            return MealItem(
                id: widget.favoriteMeals[index].id,
                title: widget.favoriteMeals[index].title,
                imageUrl: widget.favoriteMeals[index].imageUrl,
                duration: widget.favoriteMeals[index].duration,
                complexity: widget.favoriteMeals[index].complexity,
                affordability: widget.favoriteMeals[index].affordability,
                isFavorite: _isMealFavorite,
                toggleFavorite: _toggleFavorite
            );
          },
          itemCount: widget.favoriteMeals.length,
      );
    }
  }

  void _toggleFavorite(String mealId){
    final existingIndex =
    widget.favoriteMeals.indexWhere((meal) => meal.id == mealId);
    if(existingIndex >= 0){
      setState(() {
        widget.favoriteMeals.removeAt(existingIndex);
      });
    }else{
      setState(() {
        widget.favoriteMeals.add(
            DUMMY_MEALS.firstWhere((meal) => meal.id == mealId),
        );
      });
    }
  }
  bool _isMealFavorite(String id) {
    return widget.favoriteMeals.any((meal) => meal.id == id);
  }
}
