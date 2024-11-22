import 'package:recelena_app/domain/models/recipe/recipe.dart';

abstract class RecipeRepository {
  Future<List<Recipe>> getRecipes();
  Future<void> saveRecipe(Recipe recipe);
  Future<void> deleteRecipe(String id);
}
