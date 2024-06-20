import 'package:flutter/material.dart';
import 'package:foodrecipe/service/recipeService.dart';

import '../model/recipeModel.dart';

class RecipeProvider extends ChangeNotifier{

  List<Recipe> _recipes = [];
  List<Recipe> _filteredRecipes = [];

  List<Recipe> get recipes => _filteredRecipes.isNotEmpty ? _filteredRecipes : _recipes;

  Future<void> getRecipes() async{
   try{
     Recepie recepie = await RecipeService().fetchRecipes();
     _recipes = recepie.recipes ?? [];
     _filteredRecipes = _recipes; // initialize filtered recipes with all recipes
     notifyListeners();
   }catch(e){
     throw Exception("Filed to load recipes : $e");
   }
  }

  void searchRecipes (String query){
    _filteredRecipes = _recipes.where((recipe){
      return recipe.name!.toLowerCase().contains(query.toLowerCase());
    }).toList();
    notifyListeners();
  }

}