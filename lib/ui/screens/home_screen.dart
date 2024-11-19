import 'package:flutter/material.dart';

import 'package:recelena_app/domain/model/recipe/recipe.dart';
import 'package:recelena_app/settings/app_assets.dart';
import 'package:recelena_app/settings/app_colors.dart';
import 'package:recelena_app/ui/screens/details_screen.dart';
import 'package:recelena_app/ui/widgets/custom_image_container.dart';

class HomeScreen extends StatelessWidget {
  static const String routerName = 'Home';

  HomeScreen({super.key});

  final List<Recipe> recipeList = [
    Recipe(
      recipeId: '1',
      title: 'Pollo 🍗',
      imageUrl:
          'https://i.ytimg.com/vi/lS1YGtz2Mss/hq720.jpg?sqp=-oaymwEhCK4FEIIDSFryq4qpAxMIARUAAAAAGAElAADIQj0AgKJD&rs=AOn4CLCtoLur6A8VGqRkAhv7pyEpTiQh8g',
      rations: 5,
      preparationTime: 45,
      isStorable: true,
      storage: 'Refrigeration',
      storageTemperature: 4,
      notes: '',
      ingredients: [
        Ingredient(
          name: 'Pollo',
          quantity: 1,
          quantityUnit: 'unidad',
          observations: '',
        ),
      ],
      preparation: 'Se toma el alimento principal y se cocina hasta que',
    ),
    Recipe(
      recipeId: '2',
      title: 'Spaghetti 🍝',
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQlctWZdMpNF5eREeLWS1UhZAMQ-oWoS-5nQw&s',
      rations: 4,
      preparationTime: 50,
      isStorable: true,
      storage: 'Refrigeration',
      storageTemperature: 4,
      notes: '',
      ingredients: [
        Ingredient(
          name: 'Spaghetti',
          quantity: 1,
          quantityUnit: 'unidad',
          observations: '',
        ),
      ],
      preparation: 'Se toma el alimento principal y se cocina hasta que',
    ),
    Recipe(
      recipeId: '3',
      title: 'Crema de champiñones 🍄‍🟫 con pollo 🍲',
      imageUrl:
          'https://www.vvsupremo.com/wp-content/uploads/2016/07/Screen-Shot-2016-07-11-at-8.05.24-AM.jpg',
      rations: 2,
      preparationTime: 20,
      isStorable: true,
      storage: 'Refrigeration',
      storageTemperature: 4,
      notes: '',
      ingredients: [
        Ingredient(
          name: 'Pollo',
          quantity: 1,
          quantityUnit: 'unidad',
          observations: '',
        ),
      ],
      preparation: 'Se toma el alimento principal y se cocina hasta que',
    ),
    Recipe(
      recipeId: '4',
      title: 'Salmón al ajillo 🐟',
      imageUrl: 'https://i.ytimg.com/vi/Xc7-mEE3zAE/maxresdefault.jpg',
      rations: 4,
      preparationTime: 90,
      isStorable: true,
      storage: 'Refrigeration',
      storageTemperature: 4,
      notes: '',
      ingredients: [
        Ingredient(
          name: 'Salmón',
          quantity: 1,
          quantityUnit: 'unidad',
          observations: '',
        ),
      ],
      preparation: 'Se toma el alimento principal y se cocina hasta que',
    ),
    Recipe(
      recipeId: '1',
      title: 'Pollo 🍗',
      imageUrl:
          'https://i.ytimg.com/vi/lS1YGtz2Mss/hq720.jpg?sqp=-oaymwEhCK4FEIIDSFryq4qpAxMIARUAAAAAGAElAADIQj0AgKJD&rs=AOn4CLCtoLur6A8VGqRkAhv7pyEpTiQh8g',
      rations: 5,
      preparationTime: 45,
      isStorable: true,
      storage: 'Refrigeration',
      storageTemperature: 4,
      notes: '',
      ingredients: [
        Ingredient(
          name: 'Pollo',
          quantity: 1,
          quantityUnit: 'unidad',
          observations: '',
        ),
      ],
      preparation: 'Se toma el alimento principal y se cocina hasta que',
    ),
    Recipe(
      recipeId: '2',
      title: 'Spaghetti 🍝',
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQlctWZdMpNF5eREeLWS1UhZAMQ-oWoS-5nQw&s',
      rations: 4,
      preparationTime: 50,
      isStorable: true,
      storage: 'Refrigeration',
      storageTemperature: 4,
      notes: '',
      ingredients: [
        Ingredient(
          name: 'Spaghetti',
          quantity: 1,
          quantityUnit: 'unidad',
          observations: '',
        ),
      ],
      preparation: 'Se toma el alimento principal y se cocina hasta que',
    ),
    Recipe(
      recipeId: '3',
      title: 'Crema de champiñones 🍄‍🟫 con pollo 🍲',
      imageUrl:
          'https://www.vvsupremo.com/wp-content/uploads/2016/07/Screen-Shot-2016-07-11-at-8.05.24-AM.jpg',
      rations: 2,
      preparationTime: 20,
      isStorable: true,
      storage: 'Refrigeration',
      storageTemperature: 4,
      notes: '',
      ingredients: [
        Ingredient(
          name: 'Pollo',
          quantity: 1,
          quantityUnit: 'unidad',
          observations: '',
        ),
      ],
      preparation: 'Se toma el alimento principal y se cocina hasta que',
    ),
    Recipe(
      recipeId: '4',
      title: 'Salmón al ajillo 🐟',
      imageUrl: 'https://i.ytimg.com/vi/Xc7-mEE3zAE/maxresdefault.jpg',
      rations: 4,
      preparationTime: 90,
      isStorable: true,
      storage: 'Refrigeration',
      storageTemperature: 4,
      notes: '',
      ingredients: [
        Ingredient(
          name: 'Salmón',
          quantity: 1,
          quantityUnit: 'unidad',
          observations: '',
        ),
      ],
      preparation: 'Se toma el alimento principal y se cocina hasta que',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.whiteBackgroundColor,
        centerTitle: false,
        titleSpacing: 4.0,
        elevation: 1.0,
        shadowColor: Colors.black,
        surfaceTintColor: Colors.transparent,
        leading: const Padding(
          padding: EdgeInsets.only(left: 12.0, top: 12.0, bottom: 12.0),
          child: CircleAvatar(
            maxRadius: 120,
            backgroundImage: NetworkImage(
                'https://res.cloudinary.com/dqnudwull/image/upload/v1683774725/Luis_egrioh.jpg'),
          ),
        ),
        title: const Text(
          'Tu biblioteca',
          style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 16.0, vertical: 12.0),
                child: Row(
                  children: [
                    Text(
                      '${recipeList.length} recetas',
                      style: const TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(
                        left: 16.0, bottom: 8.0, right: 16.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) =>
                                DetailsScreen(recipe: recipeList[index])));
                      },
                      child: _RecipeCard(recipe: recipeList[index]),
                    ),
                  );
                },
                childCount: recipeList.length,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {},
      ),
    );
  }
}

class _RecipeCard extends StatelessWidget {
  const _RecipeCard({required this.recipe});

  final Recipe recipe;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width - 40;
    final recipeImageWidth = screenWidth * 0.35;
    final recipeInfoWidth = screenWidth - recipeImageWidth;

    return SizedBox(
      height: 130.0,
      child: Card(
        margin: EdgeInsets.zero,
        clipBehavior: Clip.antiAlias,
        elevation: 1.0,
        color: AppColors.whiteBackgroundColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //* Recipe Info
            ConstrainedBox(
              constraints:
                  BoxConstraints.tight(Size.fromWidth(recipeInfoWidth)),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //* Recipe Title
                      Text(
                        recipe.title!,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10.0),
                      //* Recipe Preparation
                      Text(
                        recipe.preparation!,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 12.0,
                          color: Colors.black54,
                        ),
                      ),
                      const SizedBox(height: 4.0),
                      //* Recipe Info
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          //* Recipe Preparation Time
                          _InfoItem(
                              icon: Icons.timer,
                              text: '${recipe.preparationTime} minutos'),
                          //* Recipe Rations
                          _InfoItem(
                              icon: Icons.people,
                              text: '${recipe.rations} platos'),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),

            //* Recipe Image
            Align(
              alignment: Alignment.centerRight,
              child: SizedBox(
                width: recipeImageWidth,
                height: double.infinity,
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: recipe.imageUrl!.isNotEmpty
                          ? CustomImageContainer(imageUrl: recipe.imageUrl!)
                          : Image.asset(
                              AppAssets.imageNotFound,
                              fit: BoxFit.cover,
                            ),
                    ),
                    Positioned.fill(
                      child: Container(
                        color: Colors.black.withOpacity(0.05),
                        //* Bookmark recipe / save recipe
                        // child: const Padding(
                        //   padding: EdgeInsets.all(6.0),
                        //   child: Align(
                        //     alignment: Alignment.bottomRight,
                        //     child: Icon(
                        //       Icons.bookmark_border,
                        //       color: Colors.white,
                        //       size: 28.0,
                        //     ),
                        //   ),
                        // ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _InfoItem extends StatelessWidget {
  final IconData icon;
  final String text;

  const _InfoItem({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          size: 17.0,
        ),
        const SizedBox(width: 4.0),
        Text(
          text,
          style: const TextStyle(
            fontSize: 11.0,
          ),
        ),
      ],
    );
  }
}
