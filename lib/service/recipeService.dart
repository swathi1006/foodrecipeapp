import 'package:http/http.dart' as http;

import '../model/recipeModel.dart';

class RecipeService {
  static const String url = "https://dummyjson.com/recipes";

  Future<Recepie> fetchRecipes() async {
    final response = await http.get(Uri.parse(url));
    if(response.statusCode == 200){
      return recepieFromJson(response.body);
    }else{
      throw Exception('Failed to Load Recipes');
    }
  }
}