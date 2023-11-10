import 'package:flutter/material.dart';
import 'package:next_app/meal_items_trait.dart';
import 'package:next_app/meals_data.dart';
import 'package:next_app/meals_details.dart';
import 'package:transparent_image/transparent_image.dart';
class Mealitem extends StatelessWidget{
  Mealitem({super.key,required this.meal,required this.onselectmeal});
  final Meal meal;
  // final void Function(Meal meal) onselectmeal;
  // final void Function(Meal meal) ontogglefavorite;
  final void Function(BuildContext context,Meal meal) onselectmeal;
  String get Complexitytext{
    return meal.complexity.name[0].toUpperCase() + meal.complexity.name.substring(1);
  }
  String get affordibilitytext{
        return meal.affordability.name[0].toUpperCase() + meal.affordability.name.substring(1);

  }
  @override
  Widget build(BuildContext context) {
   return Card(
    margin: EdgeInsets.all(16),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(16)
    ),
    clipBehavior: Clip.hardEdge,
    child: InkWell(
      onTap: () {
        onselectmeal(context,meal);
      },
      child: Stack(
        children: [
          FadeInImage(placeholder: MemoryImage(kTransparentImage), image: NetworkImage(meal.imageUrl),fit: BoxFit.cover,),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              color: Colors.black54,
              padding: EdgeInsets.symmetric(vertical: 6,horizontal: 44),
              child: Column(
                children: [
                  Text(meal.title,maxLines: 2,textAlign: TextAlign.center,
                  softWrap: true,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),),
                  SizedBox(height: 12,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Mealitemtrait(icon: Icons.schedule,label: '${meal.duration} min',),
                      SizedBox(width: 12,),
                      Mealitemtrait(icon: Icons.work, label: Complexitytext),
                      SizedBox(width: 12,),
                      Mealitemtrait(icon: Icons.attach_money,label:affordibilitytext ,)
                    ],
                  )
                ],
              ),
            ))
        ],
      ),
    ),
   );
  }
}