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
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if(recipe.image != null)
              Image.network(recipe.image!,
               height: 200,
               width: double.infinity,
              fit: BoxFit.cover,),
            const SizedBox(height: 16,),
            const Text("Ingredients",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),),
            const SizedBox(height: 8,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: List.generate(
                  recipe.ingredients?.length ?? 0,
                  (index) => Text('- ${recipe.ingredients![index]}')  ),
            ),
            const SizedBox(height: 16,),
            const Text('Instructions', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),),
            const SizedBox(height: 8,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: List.generate(
                  recipe.instructions?.length ?? 0,
                  (index) => Text("${index + 1}.${recipe.instructions![index]}")),
            )
          ],
        ),
      ),

    );
  }
}
