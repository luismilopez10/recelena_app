import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:recelena_app/providers/new_recipe_form_provider.dart';
import 'package:recelena_app/providers/recipe_provider.dart';
import 'package:recelena_app/settings/app_colors.dart';
import 'package:recelena_app/ui/screens/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (_) => RecipeProvider(),
      ),
      ChangeNotifierProvider(
        create: (_) => NewRecipeFormProvider(),
      ),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Recelena App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryColor),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}
