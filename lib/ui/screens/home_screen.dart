import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:recelena_app/domain/models/recipe/recipe.dart';
import 'package:recelena_app/providers/new_recipe_form_provider.dart';
import 'package:recelena_app/providers/recipe_provider.dart';
import 'package:recelena_app/settings/app_assets.dart';
import 'package:recelena_app/settings/app_colors.dart';
import 'package:recelena_app/ui/screens/details_screen.dart';
import 'package:recelena_app/ui/screens/new_recipe_form_screen.dart';
import 'package:recelena_app/ui/widgets/custom_image_container.dart';

class HomeScreen extends StatelessWidget {
  static const String routerName = 'Home';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final RecipeProvider recipeProvider = Provider.of<RecipeProvider>(context);
    var recipeList = recipeProvider.recipeList;

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
            maxRadius: 120.0,
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
            onPressed: () {}, //TODO: Add search logic
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

            //* App Watermark
            SliverToBoxAdapter(
              child: Container(
                height: 80.0,
                constraints: const BoxConstraints(maxWidth: 40.0),
                child: const Center(
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: 'Recelena App',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(
                          text: '\n1.0.0+1',
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Colors.black54,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          // Navigator.of(context).push(MaterialPageRoute(
          //     builder: (context) => const NewRecipeFormScreen()));
        },
      ),
    );
  }
}

class _RecipeCard extends StatelessWidget {
  const _RecipeCard({required this.recipe});

  final Recipe recipe;

  @override
  Widget build(BuildContext context) {
    final availableScreenWidth = MediaQuery.sizeOf(context).width - 32.0;
    final recipeImageWidth = availableScreenWidth * 0.35;
    final recipeInfoWidth = availableScreenWidth - recipeImageWidth;

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
                      const SizedBox(height: 6.0),
                      //* Recipe Info
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          //* Recipe Preparation Time
                          _InfoItem(
                              icon: Icons.timer_outlined,
                              text: '${recipe.preparationTime} minutos'),
                          //* Recipe Rations
                          _InfoItem(
                              icon: Icons.people_outline,
                              text: '${recipe.rations} platos'),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),

            //* Recipe Image and Bookmark
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
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.black38,
                              Colors.transparent,
                              Colors.transparent,
                              Colors.black45,
                            ],
                            stops: [
                              0.05,
                              0.3,
                              0.65,
                              1.0,
                            ],
                          ),
                        ),
                        //* Recipe Options Menu and Bookmark/Save Recipe
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            //* Recipe Options Menu
                            PopupMenuButton<String>(
                              icon: const Icon(Icons.more_horiz),
                              menuPadding: EdgeInsets.zero,
                              position: PopupMenuPosition.under,
                              offset: const Offset(-30.0, 0.0),
                              // constraints: BoxConstraints(
                              //   minWidth: 0.0,
                              //   minHeight: 0.0,
                              // ),

                              color: AppColors.whiteBackgroundColor,
                              iconColor: Colors.white,
                              iconSize: 30.0,
                              popUpAnimationStyle:
                                  AnimationStyle(curve: Curves.easeInCubic),
                              onSelected: (value) {
                                if (value == 'editar') {
                                  //TODO: Navigate to recipe form
                                } else if (value == 'borrar') {
                                  //TODO: Show alert
                                }
                              },
                              itemBuilder: (BuildContext context) =>
                                  <PopupMenuEntry<String>>[
                                const PopupMenuItem<String>(
                                  value: 'editar',
                                  child: Row(
                                    children: [
                                      Icon(Icons.edit_outlined, size: 16.0),
                                      SizedBox(width: 6.0),
                                      Text(
                                        'Editar',
                                        style: TextStyle(
                                          fontSize: 13.0,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const PopupMenuItem<String>(
                                  value: 'borrar',
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.delete_forever_outlined,
                                        size: 16.0,
                                        color: AppColors.warningColor,
                                      ),
                                      SizedBox(width: 6.0),
                                      Text(
                                        'Borrar',
                                        style: TextStyle(
                                          fontSize: 13.0,
                                          color: AppColors.warningColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            //* Bookmark/Save Recipe
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: GestureDetector(
                                onTap: () {}, //TODO: Add save logic
                                child: const Icon(
                                  Icons.bookmark,
                                  // Icons.bookmark_border_rounded,
                                  color: Colors.white,
                                  size: 28.0,
                                ),
                              ),
                            ),
                          ],
                        ),
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
    const Color color = Colors.black87;

    return Row(
      children: [
        Icon(
          icon,
          size: 17.0,
          color: color,
        ),
        const SizedBox(width: 4.0),
        Text(
          text,
          style: const TextStyle(
            fontSize: 11.0,
            color: color,
          ),
        ),
      ],
    );
  }
}
