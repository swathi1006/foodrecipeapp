import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:foodrecipe/provider/recipeProvider.dart';
import '../widgets/recipeGridView.dart';
import '../widgets/recipeSearch.dart';

class RecipeHome extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {

    var recipeProvider = Provider.of<RecipeProvider>(context);

    return Scaffold(
      appBar: AppBar(

        title: Text("Food Recipes",style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.teal,
        actions: [
          IconButton(onPressed: () async{
            final String ? query = await showSearch(
                context: context,
                delegate: RecipeSearch());
            if (query != null && query.isNotEmpty){
              recipeProvider.searchRecipes(query);
            }
          },
              icon: Icon(Icons.search))
        ],
      ),
      body: recipeProvider.recipes.isEmpty
             ? Center(
        child: CircularProgressIndicator(
          color: Colors.orange,
        ),
      )
          : LayoutBuilder(builder: (context, constrains) {
        if (constrains.maxWidth >= 600) {
          return RecipeGridView(
              recipeProvider.recipes, 4, constrains.maxWidth);
        } else if (constrains.maxWidth >= 400) {
          return RecipeGridView(
              recipeProvider.recipes, 2, constrains.maxWidth);
        } else {
          return RecipeGridView(
              recipeProvider.recipes, 1, constrains.maxWidth);
        }
      })
    );
  }
}

