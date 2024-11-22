import 'dart:convert';

Recipe recipeFromJson(String str) => Recipe.fromMap(json.decode(str));

String recipeToJson(Recipe data) => json.encode(data.toMap());

class Recipe {
  String? id;
  String? title;
  String? imageUrl;
  int? rations;
  int? preparationTime;
  bool? isStorable;
  String? storage;
  int? storageTemperature;
  String? notes;
  List<Ingredient>? ingredients;
  String? preparation;

  Recipe({
    this.id,
    this.title,
    this.imageUrl,
    this.rations,
    this.preparationTime,
    this.isStorable,
    this.storage,
    this.storageTemperature,
    this.notes,
    this.ingredients,
    this.preparation,
  });

  factory Recipe.fromMap(Map<String, dynamic> json) => Recipe(
        id: json["id"],
        title: json["title"],
        imageUrl: json["imageUrl"],
        rations: json["rations"],
        preparationTime: json["preparationTime"],
        isStorable: json["isStorable"],
        storage: json["storage"],
        storageTemperature: json["storageTemperature"],
        notes: json["notes"],
        ingredients: json["ingredients"] == null
            ? []
            : List<Ingredient>.from(
                json["ingredients"]!.map((x) => Ingredient.fromMap(x))),
        preparation: json["preparation"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "title": title,
        "imageUrl": imageUrl,
        "rations": rations,
        "preparationTime": preparationTime,
        "isStorable": isStorable,
        "storage": storage,
        "storageTemperature": storageTemperature,
        "notes": notes,
        "ingredients": ingredients == null
            ? []
            : List<dynamic>.from(ingredients!.map((x) => x.toMap())),
        "preparation": preparation,
      };
}

class Ingredient {
  String? name;
  int? quantity;
  String? quantityUnit;
  String? observations;

  Ingredient({
    this.name,
    this.quantity,
    this.quantityUnit,
    this.observations,
  });

  factory Ingredient.fromJson(String str) =>
      Ingredient.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Ingredient.fromMap(Map<String, dynamic> json) => Ingredient(
        name: json["name"],
        quantity: json["quantity"],
        quantityUnit: json["quantityUnit"],
        observations: json["observations"],
      );

  Map<String, dynamic> toMap() => {
        "name": name,
        "quantity": quantity,
        "quantityUnit": quantityUnit,
        "observations": observations,
      };
}
