import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:next_app/categories.dart';
import 'package:next_app/tabs.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final theme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
      seedColor: Color.fromARGB(255, 131, 57, 0), brightness: Brightness.dark),
  textTheme: GoogleFonts.latoTextTheme(),
);
void main() {
  runApp(ProviderScope(child: App()));
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme,
      home: Tabsscreen(),
    );
  }
}
