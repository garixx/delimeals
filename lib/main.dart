import 'package:delimeals/data/dummy_data.dart';
import 'package:delimeals/screens/tabs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:delimeals/screens/categories.dart';
import 'package:delimeals/screens/meals.dart';

final theme = ThemeData(
    useMaterial3: true,
    textTheme: GoogleFonts.latoTextTheme(),
    colorScheme: ColorScheme.fromSeed(
      brightness: Brightness.dark,
      seedColor: const Color.fromARGB(255, 131, 57, 0),
    ));

void main() {
  runApp(ProviderScope(child: App()));
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: theme,
      home: const TabsScreen(),
      //home: const Meals(title: "Some cat..", meals: dummyMeals,),
    );
  }
}
