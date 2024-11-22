import 'package:flutter/material.dart';
import 'package:recelena_app/data/api_source/recipe_api_source/recipe_api_source.dart';
import 'package:recelena_app/domain/models/recipe/recipe.dart';
import 'package:recelena_app/domain/use_cases/recipe/recipe_use_case.dart';
import 'package:uuid/uuid.dart';

class RecipeProvider extends ChangeNotifier {
  RecipeProvider() {
    getRecipes();
  }

  List<Recipe> _recipeList = [];
  List<Recipe> get recipeList => _recipeList;
  set recipeList(List<Recipe> value) {
    _recipeList = value;
    notifyListeners();
  }

  Future<void> getRecipes() async {
    final RecipeUseCase recipeUseCase = RecipeUseCase(RecipeApiSource());

    List<Recipe> databaseRecipes = await recipeUseCase.getRecipes();

    recipeList = databaseRecipes;
  }

  void saveRecipe(Recipe recipe) async {
    final newRecipe = Recipe(
      id: recipe.id ?? const Uuid().v4(),
      title: recipe.title,
      imageUrl: recipe.imageUrl,
      rations: recipe.rations,
      preparationTime: recipe.preparationTime,
      isStorable: recipe.isStorable,
      storage: recipe.storage,
      storageTemperature: recipe.storageTemperature,
      notes: recipe.notes,
      ingredients: recipe.ingredients,
      preparation: recipe.preparation,
    );

    final RecipeUseCase recipeUseCase = RecipeUseCase(RecipeApiSource());

    var tempRecipeList = recipeList;

    if (recipe != null) {
      int modifiedIndex = recipeList.indexWhere(
        (recipe) => recipe.id == newRecipe.id,
      );
      tempRecipeList[modifiedIndex] = newRecipe;
    } else {
      tempRecipeList.add(newRecipe);
    }
    recipeList = tempRecipeList;

    await recipeUseCase.saveRecipe(newRecipe);
  }

  Future<void> deleteSection(String recipeId) async {
    final RecipeUseCase recipeUseCase = RecipeUseCase(RecipeApiSource());

    var tempRecipeList = recipeList;

    int modifiedIndex = recipeList.indexWhere(
      (recipe) => recipe.id == recipeId,
    );
    tempRecipeList.removeAt(modifiedIndex);

    recipeList = tempRecipeList;

    await recipeUseCase.deleteRecipe(recipeId);
  }
}






























  // List<Recipe> _recipeList = [
  //   Recipe(
  //     id: '1',
  //     title: 'Pollo al curri 🍗',
  //     imageUrl:
  //         'https://i.ytimg.com/vi/lS1YGtz2Mss/hq720.jpg?sqp=-oaymwEhCK4FEIIDSFryq4qpAxMIARUAAAAAGAElAADIQj0AgKJD&rs=AOn4CLCtoLur6A8VGqRkAhv7pyEpTiQh8g',
  //     rations: 5,
  //     preparationTime: 45,
  //     isStorable: true,
  //     storage: 'Refrigeration',
  //     storageTemperature: 4,
  //     notes: '',
  //     ingredients: [
  //       Ingredient(
  //         name: 'Pollo',
  //         quantity: 1,
  //         quantityUnit: 'unidad',
  //         observations: '',
  //       ),
  //     ],
  //     preparation: 'Se toma el alimento principal y se cocina hasta que',
  //   ),
  //   Recipe(
  //     id: '2',
  //     title: 'Spaghettis a la bolognesa 🍝',
  //     imageUrl:
  //         'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQlctWZdMpNF5eREeLWS1UhZAMQ-oWoS-5nQw&s',
  //     rations: 4,
  //     preparationTime: 50,
  //     isStorable: true,
  //     storage: 'Refrigeration',
  //     storageTemperature: 4,
  //     notes: '',
  //     ingredients: [
  //       Ingredient(
  //         name: 'Spaghetti',
  //         quantity: 1,
  //         quantityUnit: 'unidad',
  //         observations: '',
  //       ),
  //     ],
  //     preparation: 'Se toma el alimento principal y se cocina hasta que',
  //   ),
  //   Recipe(
  //     id: '3',
  //     title:
  //         'Crema de champiñones 🍄‍🟫 con pollo 🍲 y queso y otras cosas todas ricas que cuando se comen saben delicioso',
  //     imageUrl:
  //         'https://www.vvsupremo.com/wp-content/uploads/2016/07/Screen-Shot-2016-07-11-at-8.05.24-AM.jpg',
  //     rations: 2,
  //     preparationTime: 20,
  //     isStorable: true,
  //     storage: 'Refrigeration',
  //     storageTemperature: 4,
  //     notes: '',
  //     ingredients: [
  //       Ingredient(
  //         name: 'Pollo',
  //         quantity: 1,
  //         quantityUnit: 'unidad',
  //         observations: '',
  //       ),
  //     ],
  //     preparation: 'Se toma el alimento principal y se cocina hasta que',
  //   ),
  //   Recipe(
  //     id: '4',
  //     title: 'Salmón al ajillo 🐟',
  //     imageUrl: 'https://i.ytimg.com/vi/Xc7-mEE3zAE/maxresdefault.jpg',
  //     rations: 4,
  //     preparationTime: 90,
  //     isStorable: true,
  //     storage: 'Refrigeration',
  //     storageTemperature: 4,
  //     notes: '',
  //     ingredients: [
  //       Ingredient(
  //         name: 'Salmón',
  //         quantity: 1,
  //         quantityUnit: 'unidad',
  //         observations: '',
  //       ),
  //     ],
  //     preparation: 'Se toma el alimento principal y se cocina hasta que',
  //   ),
  //   Recipe(
  //     id: '1',
  //     title: 'Pollo 🍗',
  //     imageUrl:
  //         'https://i.ytimg.com/vi/lS1YGtz2Mss/hq720.jpg?sqp=-oaymwEhCK4FEIIDSFryq4qpAxMIARUAAAAAGAElAADIQj0AgKJD&rs=AOn4CLCtoLur6A8VGqRkAhv7pyEpTiQh8g',
  //     rations: 5,
  //     preparationTime: 45,
  //     isStorable: true,
  //     storage: 'Refrigeration',
  //     storageTemperature: 4,
  //     notes: '',
  //     ingredients: [
  //       Ingredient(
  //         name: 'Pollo',
  //         quantity: 1,
  //         quantityUnit: 'unidad',
  //         observations: '',
  //       ),
  //     ],
  //     preparation: 'Se toma el alimento principal y se cocina hasta que',
  //   ),
  //   Recipe(
  //     id: '2',
  //     title: 'Spaghetti 🍝',
  //     imageUrl:
  //         'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQlctWZdMpNF5eREeLWS1UhZAMQ-oWoS-5nQw&s',
  //     rations: 4,
  //     preparationTime: 50,
  //     isStorable: true,
  //     storage: 'Refrigeration',
  //     storageTemperature: 4,
  //     notes: '',
  //     ingredients: [
  //       Ingredient(
  //         name: 'Spaghetti',
  //         quantity: 1,
  //         quantityUnit: 'unidad',
  //         observations: '',
  //       ),
  //     ],
  //     preparation: 'Se toma el alimento principal y se cocina hasta que',
  //   ),
  //   Recipe(
  //     id: '3',
  //     title: 'Crema de champiñones 🍄‍🟫 con pollo 🍲',
  //     imageUrl:
  //         'https://www.vvsupremo.com/wp-content/uploads/2016/07/Screen-Shot-2016-07-11-at-8.05.24-AM.jpg',
  //     rations: 2,
  //     preparationTime: 20,
  //     isStorable: true,
  //     storage: 'Refrigeration',
  //     storageTemperature: 4,
  //     notes: '',
  //     ingredients: [
  //       Ingredient(
  //         name: 'Pollo',
  //         quantity: 1,
  //         quantityUnit: 'unidad',
  //         observations: '',
  //       ),
  //     ],
  //     preparation: 'Se toma el alimento principal y se cocina hasta que',
  //   ),
  //   Recipe(
  //     id: '4',
  //     title: 'Salmón al ajillo 🐟',
  //     imageUrl: 'https://i.ytimg.com/vi/Xc7-mEE3zAE/maxresdefault.jpg',
  //     rations: 4,
  //     preparationTime: 90,
  //     isStorable: true,
  //     storage: 'Refrigeration',
  //     storageTemperature: 4,
  //     notes: '',
  //     ingredients: [
  //       Ingredient(
  //         name: 'Salmón',
  //         quantity: 1,
  //         quantityUnit: 'unidad',
  //         observations: '',
  //       ),
  //     ],
  //     preparation: 'Se toma el alimento principal y se cocina hasta que',
  //   ),
  // ];
