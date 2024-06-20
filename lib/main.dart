import 'package:flutter/material.dart';
import 'package:foodrecipe/provider/recipeProvider.dart';
import 'package:foodrecipe/view/recipehome.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(RecipeApp());
}

class RecipeApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(
        create: (context) => RecipeProvider()..getRecipes(),
       ),
    ],
        child:  MaterialApp(
          debugShowCheckedModeBanner: false,
          home: RecipeHome(),
        )
    );
  }
}
