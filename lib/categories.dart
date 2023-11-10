import 'package:next_app/category.dart';
import 'package:flutter/material.dart';
import 'package:next_app/categorygriditem.dart';
import 'package:next_app/dummy_data.dart';
import 'package:next_app/meals.dart';
import 'package:next_app/meals_data.dart';

class Categoriesscreen extends StatefulWidget {
  Categoriesscreen(
      {super.key,
      required this.ontogglefavorite,
      required this.availablemeals});
  final void Function(Meal meal) ontogglefavorite;
  final List<Meal> availablemeals;

  @override
  State<Categoriesscreen> createState() => _CategoriesscreenState();
}

class _CategoriesscreenState extends State<Categoriesscreen>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animationController = AnimationController(
        vsync: this,
        duration: Duration(milliseconds: 300),
        lowerBound: 0,
        upperBound: 1);
    animationController.forward();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    animationController.dispose();
    super.dispose();
  }

  void selectcategory(BuildContext context, Category category) {
    final filteredmeals = widget.availablemeals
        .where((meal) => meal.categories.contains(category.id))
        .toList();
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Mealsscreen(
            title: category.title,
            meals: filteredmeals,
            ontogglefavorite: widget.ontogglefavorite,
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController,
      child: GridView(
          padding: EdgeInsets.all(24),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 1.5,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20),
          children: availableCategories
              .map((category) => Categorygriditem(
                    category: category,
                    onselectcategory: () {
                      selectcategory(context, category);
                    },
                  ))
              .toList()),
      builder: (context, child) => SlideTransition(
        position: Tween(begin: Offset(0, 0.3), end: Offset(0, 0)).animate(
            CurvedAnimation(
                parent: animationController, curve: Curves.bounceIn)),
        child: child,
      ),
    );
  }
}
