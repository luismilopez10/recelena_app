import 'package:recelena_app/domain/models/recipe/repository/recipe_repository.dart';
import 'package:recelena_app/domain/models/recipe/recipe.dart';

class RecipeUseCase {
  final RecipeRepository repository;

  RecipeUseCase(this.repository);

  Future<List<Recipe>> getRecipes() => repository.getRecipes();
  Future<void> saveRecipe(Recipe recipe) => repository.saveRecipe(recipe);
  Future<void> deleteRecipe(String id) => repository.deleteRecipe(id);
}
