// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:next_app/category.dart';

class Categorygriditem extends StatelessWidget {
  Categorygriditem({super.key, required this.category,required this.onselectcategory});
  final Category category;
  final void Function() onselectcategory;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(16),
      onTap: onselectcategory,
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          category.color.withOpacity(0.55),
          category.color.withOpacity(0.9)
        ], begin: Alignment.topLeft, end: Alignment.bottomRight),
        borderRadius: BorderRadius.circular(16)),
        
        child: Text(
          category.title,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.onBackground,
              ),
        ),
      ),
    );
  }
}
