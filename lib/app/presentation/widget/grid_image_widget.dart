import 'package:flutter/material.dart';

import '../../../core/route/app_routes.dart';
import '../../domain/entity/character.dart';
import 'image_network_widget.dart';

class GridImageWidget extends StatelessWidget {
  const GridImageWidget({Key? key, required this.characters, required this.scrollController}) : super(key: key);

  final List<Character> characters;
  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.builder(
        itemCount: characters.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        controller: scrollController,
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: () {
              Navigator.of(context).pushNamed(AppRoutes.detail, arguments: characters[index]);
            },
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(48.0),
                  child: ImageNetworkWidget(
                    path: characters[index].thumbnail.imagePath,
                    width: 100.0,
                    height: 100.0,
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(characters[index].name, textAlign: TextAlign.center,),
              ],
            ),
          );
        },
      ),
    );
  }
}
