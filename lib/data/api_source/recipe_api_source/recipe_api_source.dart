import 'dart:convert';
import 'dart:developer';

import 'package:recelena_app/domain/models/recipe/repository/recipe_repository.dart';
import 'package:recelena_app/domain/models/recipe/recipe.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class RecipeApiSource extends RecipeRepository {
  static final RecipeApiSource _instance = RecipeApiSource._internal();
  static Database? _database;

  factory RecipeApiSource() {
    return _instance;
  }

  RecipeApiSource._internal();

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }

    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final String path = await getDatabasesPath();
    final String databasePath = join(path, 'recipes.db');

    return await openDatabase(
      databasePath,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
        CREATE TABLE recipes (
          id TEXT PRIMARY KEY,
          title TEXT,
          imageUrl TEXT,
          rations INTEGER,
          preparationTime INTEGER,
          isStorable INTEGER,
          storage TEXT,
          storageTemperature INTEGER,
          notes TEXT,
          ingredients TEXT,
          preparation TEXT
        )
      ''');
      },
    );
  }

  @override
  Future<List<Recipe>> getRecipes() async {
    final Database db = await database;
    final List<Map<String, dynamic>> maps = await db.query('recipes');

    return List.generate(maps.length, (i) {
      return Recipe.fromMap({
        ...maps[i],
        // Convertir el campo isStorable de int a bool
        'isStorable': maps[i]['isStorable'] == 1 ? true : false,
        // Convertir el campo ingredients de JSON (texto) a lista
        'ingredients': maps[i]['ingredients'] == null
            ? []
            : List<Map<String, dynamic>>.from(
                json.decode(maps[i]['ingredients']),
              ),
      });
    });
  }

  @override
  Future<void> saveRecipe(Recipe recipe) async {
    final Database db = await database;

    // Verificar si el registro ya existe
    final List<Map<String, Object?>> existingRecord = await db.query(
      'recipes',
      where: 'id = ?',
      whereArgs: [recipe.id],
    );

    // Convertir ingredientes a JSON
    final Map<String, dynamic> recipeMap = recipe.toMap();
    recipeMap['ingredients'] = json.encode(recipeMap['ingredients']);

    if (existingRecord.isNotEmpty) {
      // Actualizar receta existente
      return await db.update(
        'recipes',
        recipeMap,
        where: 'id = ?',
        whereArgs: [recipe.id],
      ).then((affectedRows) => log(recipe.toString(), name: 'Updated recipe'));
    } else {
      // Insertar nueva receta
      return await db
          .insert(
            'recipes',
            recipeMap,
            conflictAlgorithm: ConflictAlgorithm.replace,
          )
          .then((affectedRows) => log(recipe.toString(), name: 'Saved recipe'));
    }
  }

  @override
  Future<void> deleteRecipe(String id) async {
    final Database db = await database;
    await db.delete(
      'recipes',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
