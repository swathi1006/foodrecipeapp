import 'package:flutter/material.dart';
import 'package:foodrecipe/provider/recipeProvider.dart';
import 'package:provider/provider.dart';

import '../model/recipeModel.dart';

class RecipeSearch extends SearchDelegate <String>{

  /// methods build the actions for the appbar ,eg: if
  /// it is a clear button that clears search query
  @override
  List<Widget>? buildActions(BuildContext context) {
   return [
     IconButton(onPressed: (){
       query == "";
     },
         icon: const Icon(Icons.clear))
   ];
  }
  ///this methods builds a leading widget for the appbar
  ///commonly a back button to close the search
  @override
  Widget? buildLeading(BuildContext context) {
   return IconButton(
       onPressed: (){
         close(context, '');
       },
       icon: const Icon(Icons.arrow_back));
  }
  ///this methods shows the result of search query,
  ///here it displays the search query itself

  @override
  Widget buildResults(BuildContext context) {
    return Container();
  }

  /// this method shows the suggestion while typing ,
  /// filters the search results list based on the query and
  /// displays the matching results

  @override
  Widget buildSuggestions(BuildContext context) {
   final recipeProvider = Provider.of<RecipeProvider>(context);
   final List<Recipe> suggestions = query.isEmpty ? [] :
       recipeProvider.recipes.where((recipe){
         return recipe.name!.toLowerCase().contains(query.toLowerCase());
       }).toList();
   return ListView.builder(
       itemCount: suggestions.length,
       itemBuilder: (context,index){
         return ListTile(
           title: Text(suggestions[index].name ?? ""),
           onTap: (){
             close(context, suggestions[index].name ?? "");
           },
         );
       });
  }
}