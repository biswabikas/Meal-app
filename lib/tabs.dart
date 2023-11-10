import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:next_app/categories.dart';
import 'package:next_app/dummy_data.dart';
import 'package:next_app/filters.dart';
import 'package:next_app/main_drawer.dart';
import 'package:next_app/meals.dart';
import 'package:next_app/meals_data.dart';
// import 'package:next_app/provider/meals_provider.dart';

const kintialfilters = {
  Filter.gluttenfree: false,
  Filter.lactosefree: false,
  Filter.vegeterian: false,
  Filter.vegan: false,
};

class Tabsscreen extends ConsumerStatefulWidget {
  Tabsscreen({super.key});
  @override
  ConsumerState<Tabsscreen> createState() {
    return Tabsscreenstate();
  }
}

class Tabsscreenstate extends ConsumerState<Tabsscreen> {
  Map<Filter, bool> selectedfilters = kintialfilters;
  int _selectedpageindex = 0;
  void selectpage(int index) {
    setState(() {
      _selectedpageindex = index;
    });
  }

  final List<Meal> favouritesmeal = [];
  void showinfomessage(String message) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text('message'),
    ));
  }

  void tooglemealfavouritestatus(Meal meal) {
    final isexisting = favouritesmeal.contains(meal);
    if (isexisting) {
      setState(() {
        favouritesmeal.remove(meal);
      });
      showinfomessage('Meal is no longer a favorite');
    } else {
      setState(() {
        favouritesmeal.add(meal);
      });
      showinfomessage('Marked as a favorite');
    }
  }

  Future<void> setscreen(String identifiers) async {
    Navigator.pop(context);
    if (identifiers == 'filters') {
      final results = await Navigator.of(context).push<Map<Filter, bool>>(
        MaterialPageRoute(
          builder: (ctx) => Filtersscreen(
            currentfilters: selectedfilters,
          ),
        ),
      );
      setState(() {
        selectedfilters = results ?? kintialfilters;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // final meals = ref.watch(mealsprovider);
    final availablemeals = dummyMeals.where((meal) {
      if (selectedfilters[Filter.gluttenfree]! && !meal.isGlutenFree) {
        return false;
      }
      if (selectedfilters[Filter.lactosefree]! && !meal.isLactoseFree) {
        return false;
      }
      if (selectedfilters[Filter.vegeterian]! && !meal.isVegetarian) {
        return false;
      }
      if (selectedfilters[Filter.vegan]! && !meal.isVegan) {
        return false;
      }
      return true;
    }).toList();
    Widget activepage = Categoriesscreen(
      ontogglefavorite: tooglemealfavouritestatus,
      availablemeals: availablemeals,
    );
    var activepagetitle = 'Categories';
    if (_selectedpageindex == 1) {
      activepage = Mealsscreen(
        meals: favouritesmeal,
        ontogglefavorite: tooglemealfavouritestatus,
      );
      activepagetitle = 'Favourites';
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(activepagetitle),
      ),
      body: activepage,
      drawer: Maindrawer(
        onselectscreen: setscreen,
      ),
      bottomNavigationBar: BottomNavigationBar(
          onTap: selectpage,
          currentIndex: _selectedpageindex,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.set_meal), label: 'Categories'),
            BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Favourites')
          ]),
    );
  }
}
