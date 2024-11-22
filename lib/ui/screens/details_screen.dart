import 'package:flutter/material.dart';
import 'package:recelena_app/domain/models/recipe/recipe.dart';
import 'package:recelena_app/settings/app_assets.dart';

class DetailsScreen extends StatelessWidget {
  static const String routerName = 'Details';
  final Recipe recipe;

  const DetailsScreen({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _CustomAppBar(recipe: recipe),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                _PosterAndTitle(recipe: recipe),
                _Ingredients(recipe: recipe),
                _Preparation(recipe: recipe),
                _Notes(recipe: recipe),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _CustomAppBar extends StatelessWidget {
  final Recipe recipe;

  const _CustomAppBar({required this.recipe});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 250.0,
      floating: false,
      pinned: true,
      foregroundColor: Colors.white,
      backgroundColor: Colors.black,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        titlePadding: EdgeInsets.zero,
        title: Container(
          alignment: Alignment.bottomCenter,
          padding: const EdgeInsets.only(left: 40.0, right: 40.0, bottom: 10.0),
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.black38,
                Colors.transparent,
                Colors.black54,
              ],
              stops: [
                0.05,
                0.8,
                0.9,
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Text(
            recipe.title!,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 14.0,
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        background: FadeInImage(
          placeholder: const AssetImage(AppAssets.loadingGif),
          image: NetworkImage(recipe.imageUrl!),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class _PosterAndTitle extends StatelessWidget {
  final Recipe recipe;

  const _PosterAndTitle({required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: Image.network(
              recipe.imageUrl!,
              height: 150.0,
              width: 100.0,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 20.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  recipe.title!,
                  style: const TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
                const SizedBox(height: 10.0),
                Text(
                  'Raciones: ${recipe.rations}',
                  style: const TextStyle(fontSize: 16.0),
                ),
                const SizedBox(height: 10.0),
                Text(
                  'Tiempo de preparación: ${recipe.preparationTime} minutos',
                  style: const TextStyle(fontSize: 16.0),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _Ingredients extends StatelessWidget {
  final Recipe recipe;

  const _Ingredients({required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Ingredientes',
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10.0),
          ...recipe.ingredients!.map((ingredient) => Text(
                '${ingredient.quantity} ${ingredient.quantityUnit} de ${ingredient.name}',
                style: const TextStyle(fontSize: 16.0),
              )),
        ],
      ),
    );
  }
}

class _Preparation extends StatelessWidget {
  final Recipe recipe;

  const _Preparation({required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Preparación',
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10.0),
          Text(
            recipe.preparation!,
            style: const TextStyle(fontSize: 16.0),
          ),
        ],
      ),
    );
  }
}

class _Notes extends StatelessWidget {
  final Recipe recipe;

  const _Notes({required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Notas',
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10.0),
          Text(
            recipe.notes!,
            style: const TextStyle(fontSize: 16.0),
          ),
        ],
      ),
    );
  }
}
