import 'package:flutter/material.dart';

import 'package:recelena_app/domain/model/recipe/recipe.dart';
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
                // _PosterAndTitle(recipe: recipe),
                // _Overview(recipe: recipe),
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
      // backgroundColor: Colors.indigo,
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
          padding: const EdgeInsets.only(left: 10.0, right: 10.0, bottom: 10.0),
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.black38,
                Colors.transparent,
                Colors.black54,
              ],
              stops: [
                0.05,
                0.84,
                1.0,
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

// class _PosterAndTitle extends StatelessWidget {
//   final Recipe recipe;

//   const _PosterAndTitle({
//     Key? key,
//     required this.recipe,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final TextTheme textTheme = Theme.of(context).textTheme;
//     final size = MediaQuery.of(context).size;

//     return Container(
//       margin: const EdgeInsets.only(top: 20),
//       padding: const EdgeInsets.symmetric(horizontal: 20),
//       child: Row(children: [
//         GestureDetector(
//           onTap: () async {
//             await showDialog(
//               context: context,
//               builder: (_) {
//                 return ImageAsModal(
//                     imageUrls: [recipe.fullPosterImg], index: 0);
//               },
//             );
//           },
//           child: Hero(
//             tag: recipe.recipeId!,
//             child: ClipRRect(
//               borderRadius: BorderRadius.circular(12),
//               child: FadeInImage(
//                 placeholder: const AssetImage('assets/no-image.jpg'),
//                 image: NetworkImage(recipe.fullPosterImg),
//                 height: 150,
//               ),
//             ),
//           ),
//         ),
//         const SizedBox(
//           width: 15,
//         ),
//         ConstrainedBox(
//           constraints: BoxConstraints(maxWidth: size.width - 185),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               SelectableText(
//                 recipe.title,
//                 style: textTheme.headline5,
//                 maxLines: 2,
//               ),
//               // Text(
//               //   movie.title,
//               //   style: textTheme.headline5,
//               //   overflow: TextOverflow.ellipsis,
//               //   maxLines: 2,
//               // ),
//               SelectableText(
//                 recipe.originalTitle,
//                 style: textTheme.subtitle1,
//                 // overflow: TextOverflow.ellipsis,
//                 maxLines: 2,
//               ),
//               Row(
//                 children: [
//                   const Icon(
//                     Icons.star_outline,
//                     size: 15,
//                     color: Colors.grey,
//                   ),
//                   const SizedBox(
//                     width: 5,
//                   ),
//                   Text(
//                     '${recipe.voteAverage}',
//                     style: textTheme.caption,
//                   ),
//                 ],
//               )
//             ],
//           ),
//         )
//       ]),
//     );
//   }
// }

// class _Overview extends StatelessWidget {
//   final Movie movie;
//   const _Overview({Key? key, required this.movie}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
//       child: Text(
//         movie.overview,
//         textAlign: TextAlign.justify,
//         style: Theme.of(context).textTheme.subtitle1,
//       ),
//     );
//   }
// }
























// import 'package:flutter/material.dart';

// import 'package:recelena_app/domain/model/recipe/recipe.dart';
// import 'package:recelena_app/settings/app_assets.dart';
// import 'package:recelena_app/ui/widgets/custom_image_container.dart';

// class DetailsScreen extends StatelessWidget {
//   static const String routerName = 'Details';
//   final Recipe recipe;

//   const DetailsScreen({super.key, required this.recipe});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Theme.of(context).colorScheme.inversePrimary,
//         title: Text(recipe.title!),
//       ),
//       body: Column(
//         children: [
//           // SizedBox(
//           //   height: 250.0,
//           //   width: double.infinity,
//           //   child: Hero(
//           //     tag: recipe.recipeId!,
//           //     child: recipe.imageUrl!.isNotEmpty
//           //         ? CustomImageContainer(imageUrl: recipe.imageUrl!)
//           //         : Image.asset(AppAssets.imageNotFound),
//           //   ),
//           // ),
//         ],
//       ),
//     );
//   }
// }































// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';

// import 'package:cat_breeds_app/DTOs/cat_breed_dto.dart';
// import 'package:cat_breeds_app/settings/app_assets.dart';
// import 'package:cat_breeds_app/ui/widgets/widgets.dart';

// class DetailsScreen extends StatelessWidget {
//   final CatBreedDTO catBreed;

//   const DetailsScreen({
//     required this.catBreed,
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Theme.of(context).platform == TargetPlatform.iOS
//         ? CupertinoPageScaffold(
//             navigationBar: CupertinoNavigationBar(
//               middle: Text(catBreed.name),
//             ),
//             child: _buildContent(context),
//           )
//         : Scaffold(
//             appBar: AppBar(
//               centerTitle: true,
//               title: Text(catBreed.name),
//             ),
//             body: _buildContent(context),
//           );
//   }

//   Column _buildContent(BuildContext context) {
//     return Column(
//       children: [
//         ConstrainedBox(
//           constraints: const BoxConstraints(
//             maxHeight: 500.0,
//             minWidth: double.infinity,
//           ),
//           child: Hero(
//             tag: catBreed.id,
//             child: catBreed.imageUrl.isNotEmpty
//                 ? CustomImageContainer(imageUrl: catBreed.imageUrl)
//                 : Image.asset(AppAssets.imageNotFound),
//           ),
//         ),
//         Expanded(
//           child: Padding(
//             padding: const EdgeInsets.only(top: 12.0, right: 8.0, bottom: 12.0),
//             child: Scrollbar(
//               // trackVisibility: true,
//               thumbVisibility: true,
//               radius: const Radius.circular(20.0),
//               child: Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 14.0),
//                 child: SingleChildScrollView(
//                   physics: Theme.of(context).platform == TargetPlatform.iOS
//                       ? const BouncingScrollPhysics()
//                       : const ClampingScrollPhysics(),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       InfoItem(
//                         boldText: 'Description',
//                         normalText: catBreed.description,
//                       ),
//                       const SizedBox(height: 14.0),
//                       InfoItem(
//                         boldText: 'Country of Origin',
//                         normalText: catBreed.origin,
//                       ),
//                       const SizedBox(height: 14.0),
//                       InfoItem(
//                         boldText: 'Intelligence',
//                         normalText: '${catBreed.intelligence}',
//                       ),
//                       const SizedBox(height: 14.0),
//                       InfoItem(
//                         boldText: 'Adaptability',
//                         normalText: '${catBreed.adaptability}',
//                       ),
//                       const SizedBox(height: 14.0),
//                       InfoItem(
//                         boldText: 'Life Span',
//                         normalText: '${catBreed.lifeSpan}  Years',
//                       ),
//                       const SizedBox(height: 14.0),
//                       InfoItem(
//                         boldText: 'Affection Level',
//                         normalText: '${catBreed.affectionLevel}',
//                       ),
//                       const SizedBox(height: 14.0),
//                       InfoItem(
//                         boldText: 'Child Friendly',
//                         normalText: '${catBreed.childFriendly}',
//                       ),
//                       const SizedBox(height: 14.0),
//                       InfoItem(
//                         boldText: 'Stranger Friendly',
//                         normalText: '${catBreed.strangerFriendly}',
//                       ),
//                       const SizedBox(height: 14.0),
//                       InfoItem(
//                         boldText: 'Dog Friendly',
//                         normalText: '${catBreed.dogFriendly}',
//                       ),
//                       const SizedBox(height: 14.0),
//                       InfoItem(
//                         boldText: 'Energy Level',
//                         normalText: '${catBreed.energyLevel}',
//                       ),
//                       const SizedBox(height: 14.0),
//                       InfoItem(
//                         boldText: 'Social Needs',
//                         normalText: '${catBreed.socialNeeds}',
//                       ),
//                       const SizedBox(height: 14.0),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
