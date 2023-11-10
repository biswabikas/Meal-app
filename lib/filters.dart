import 'package:flutter/material.dart';
import 'package:next_app/main_drawer.dart';
import 'package:next_app/sagar_task.dart';
import 'package:next_app/tabs.dart';

enum Filter { gluttenfree, lactosefree, vegeterian, vegan }

class Filtersscreen extends StatefulWidget {
  Filtersscreen({super.key, required this.currentfilters});
  final Map<Filter, bool> currentfilters;
  @override
  State<StatefulWidget> createState() {
    return Filtersscreenstate();
  }
}

class Filtersscreenstate extends State<Filtersscreen> {
  var glutternfreeset = false;
  var lactosefreeset = false;
  var vegeterianfreeset = false;
  var veganfreeset = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    glutternfreeset = widget.currentfilters[Filter.gluttenfree]!;
    lactosefreeset = widget.currentfilters[Filter.lactosefree]!;
    vegeterianfreeset = widget.currentfilters[Filter.vegeterian]!;
    veganfreeset = widget.currentfilters[Filter.vegan]!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your filters'),
      ),
      body: WillPopScope(
        onWillPop: () async {
          Navigator.of(context).pop({
            Filter.gluttenfree: glutternfreeset,
            Filter.lactosefree: lactosefreeset,
            Filter.vegeterian: vegeterianfreeset,
            Filter.vegan: veganfreeset
          });
          return false;
        },
        child: Column(
          children: [
            SwitchListTile(
              value: glutternfreeset,
              onChanged: (ischecked) {
                setState(() {
                  glutternfreeset = ischecked;
                });
              },
              title: Text(
                'Glutten-free',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              subtitle: Text(
                'Only include glutten-free meals',
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: EdgeInsets.only(left: 34, right: 22),
            ),
            SwitchListTile(
              value: lactosefreeset,
              onChanged: (ischecked) {
                setState(() {
                  lactosefreeset = ischecked;
                });
              },
              title: Text(
                'Lactose-free',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              subtitle: Text('Only include lactose-free meals'),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: EdgeInsets.only(left: 34, right: 22),
            ),
            SwitchListTile(
              value: vegeterianfreeset,
              onChanged: (ischecked) {
                setState(() {
                  vegeterianfreeset = ischecked;
                });
              },
              title: Text(
                'Vegetarian',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground),
              ),
              subtitle: Text(
                'Only include vegeterian meals',
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(color: Theme.of(context).colorScheme.tertiary),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: EdgeInsets.only(left: 34, right: 22),
            ),
            SwitchListTile(
              value: veganfreeset,
              onChanged: (ischecked) {
                setState(() {
                  veganfreeset = ischecked;
                });
              },
              title: Text(
                'Vegan',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground),
              ),
              subtitle: Text(
                'Only include vegan meals',
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(color: Theme.of(context).colorScheme.tertiary),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: EdgeInsets.only(left: 34, right: 22),
            ),
          ],
        ),
      ),
    );
  }
}
