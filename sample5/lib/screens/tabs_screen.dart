import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../screens/favorites_screen.dart';
import '../widgets/main_drawer.dart';

import 'categories_screen.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> favoriteMeals;
  final Function isFavorite;
  final Function toggleFavorite;

  TabsScreen(this.favoriteMeals, this.isFavorite, this.toggleFavorite);

  @override
  _TabsScreenState createState() => _TabsScreenState();
}


class _TabsScreenState extends State<TabsScreen> {
  late List<Map<String, dynamic>> _pages;
  int _selectedPageIndex = 0;

  @override
  void initState() {
    _pages = [
      {
        'page': CategoriesScreen(),
        'title': 'Categories'
      },
      {
        'page': FavoritesScreen(widget.favoriteMeals),
        'title': 'Your Favorites'
      }
    ];
    super.initState();
  }
  void _selectPage(int index){
    setState(() {
      _selectedPageIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedPageIndex]['title']),
      ),
      drawer: MainDrawer(),
      body: _pages[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).accentColor,
        currentIndex: _selectedPageIndex,
        items: [
          BottomNavigationBarItem(
              icon: const Icon(Icons.category),
              backgroundColor: Theme.of(context).primaryColor,
            label: 'Categories'
          ),
          BottomNavigationBarItem(
              icon: const Icon(Icons.star),
            backgroundColor: Theme.of(context).primaryColor,
            label: 'Favorites'
          )
        ],
      ),
    );
  }


}
