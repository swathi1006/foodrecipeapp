import 'package:flutter/material.dart';

import '../model/recipeModel.dart';

class DetailedRecipe extends StatelessWidget {

  final Recipe recipe;

   DetailedRecipe({required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(recipe.name ?? 'Recipe'),  ),

      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if(recipe.image != null)
              Image.network(recipe.image!,
               height: 200,
               width: double.infinity,
              fit: BoxFit.cover,),
            SizedBox(height: 16,),

          ],
        ),
      ),

    );
  }
}
