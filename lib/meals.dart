import 'package:flutter/material.dart';
import 'package:next_app/meal_items.dart';
import 'package:next_app/meals_data.dart';
import 'package:next_app/meals_details.dart';

class Mealsscreen extends StatelessWidget {
  Mealsscreen({super.key,  this.title, required this.meals,required this.ontogglefavorite});
  final String ?title;
  final List<Meal> meals;
  final void Function(Meal meal) ontogglefavorite;
  void selectmeal(BuildContext context, Meal meal) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (ctx) => Mealdetailsscreen(meal: meal,ontogglefavorite: ontogglefavorite,),
        ));
  }

  @override
  Widget build(BuildContext context) {
    Widget content = ListView.builder(
      itemBuilder: (context, index) => Mealitem(
        meal: meals[index],
        onselectmeal: (context,meal) {
          selectmeal(context, meal);
        },
      ),
      itemCount: meals.length,
    );
    if (meals.isEmpty) {
      content = Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Uh oh..nothing here!',
              style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            SizedBox(
              height: 16,
            ),
            Text(
              'Try selecting a different category!',
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            )
          ],
        ),
      );
    }
    if (title==null){
      return content;
    }
    return Scaffold(
      appBar: AppBar(title: Text(title!)),
      body: content,
    );
  }
}
