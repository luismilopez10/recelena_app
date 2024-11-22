import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recelena_app/data/api_source/recipe_api_source/recipe_api_source.dart';
import 'package:recelena_app/domain/models/recipe/recipe.dart';
import 'package:recelena_app/providers/recipe_provider.dart';
import 'package:uuid/uuid.dart';

class NewRecipeFormProvider extends ChangeNotifier {
  // GlobalKey<FormState> newSectionFormKey = GlobalKey<FormState>();

  // TextEditingController _sectionNameController = TextEditingController();
  // TextEditingController get sectionNameController => _sectionNameController;
  // set sectionNameController(TextEditingController value) {
  //   _sectionNameController = value;
  //   notifyListeners();
  // }

  // TextEditingController _minutesController = TextEditingController();
  // TextEditingController get minutesController => _minutesController;
  // set minutesController(TextEditingController value) {
  //   _minutesController = value;
  //   notifyListeners();
  // }

  // TextEditingController _secondsController = TextEditingController();
  // TextEditingController get secondsController => _secondsController;
  // set secondsController(TextEditingController value) {
  //   _secondsController = value;
  //   notifyListeners();
  // }

  // void resetValues() {
  //   _sectionNameController.clear();
  //   _minutesController.clear();
  //   _secondsController.clear();
  // }

  // bool isValidForm() {
  //   return newSectionFormKey.currentState?.validate() ?? false;
  // }

  // String? validate(String value, String key) => value.isEmpty ? key : null;

  // void saveShowerSection(
  //     BuildContext context, ShowerSection? showerSection) async {
  //   final showerSectionProvider =
  //       Provider.of<ShowerSectionProvider>(context, listen: false);
  //   final NewSectionFormProvider newSectionFormProvider =
  //       Provider.of<NewSectionFormProvider>(context, listen: false);

  //   final newShowerSection = ShowerSection(
  //     id: showerSection != null ? showerSection.id : const Uuid().v4(),
  //     sectionName: newSectionFormProvider.sectionNameController.text,
  //     orderIndex: showerSectionProvider.showerSectionList.length,
  //     seconds: int.parse(newSectionFormProvider.secondsController.text),
  //     minutes: int.parse(newSectionFormProvider.minutesController.text),
  //   );

  //   final databaseProvider = DatabaseProvider();

  //   _updateListInProvider(
  //       showerSectionProvider, newShowerSection, showerSection);

  //   await databaseProvider.saveShowerSection(newShowerSection);
  // }

  // void _updateListInProvider(ShowerSectionProvider showerSectionProvider,
  //     ShowerSection newShowerSection, ShowerSection? showerSection) {
  //   var tempShowerSectionList = showerSectionProvider.showerSectionList;

  //   if (showerSection != null) {
  //     int modifiedIndex = showerSectionProvider.showerSectionList.indexWhere(
  //       (showerSection) => showerSection.id == newShowerSection.id,
  //     );
  //     tempShowerSectionList[modifiedIndex] = newShowerSection;
  //   } else {
  //     tempShowerSectionList.add(newShowerSection);
  //   }
  //   showerSectionProvider.showerSectionList = tempShowerSectionList;
  // }

  // void saveShowerSection(BuildContext context, {Recipe? recipe}) async {
  //   final recipeProvider = Provider.of<RecipeProvider>(context, listen: false);
  //   // final NewRecipeFormProvider newRecipeFormProvider =
  //   //     Provider.of<NewRecipeFormProvider>(context, listen: false);

  //   final newRecipe = Recipe(
  //     id: recipe != null ? recipe.id : const Uuid().v4(),
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
  //   );

  //   final recipeApiSource = RecipeApiSource();

  //   _updateListInProvider(recipeProvider, newRecipe, recipe);

  //   await recipeApiSource.saveRecipe(newRecipe);
  // }

  // void _updateListInProvider(
  //     RecipeProvider recipeProvider, Recipe newRecipe, Recipe? recipe) {
  //   var tempRecipeList = recipeProvider.recipeList;

  //   if (recipe != null) {
  //     int modifiedIndex = recipeProvider.recipeList.indexWhere(
  //       (recipe) => recipe.id == newRecipe.id,
  //     );
  //     tempRecipeList[modifiedIndex] = newRecipe;
  //   } else {
  //     tempRecipeList.add(newRecipe);
  //   }
  //   recipeProvider.recipeList = tempRecipeList;
  // }
}
