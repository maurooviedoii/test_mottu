import 'package:flutter/material.dart';

import '../domain/entity/character.dart';
import '../domain/entity/comic_summary.dart';
import 'widget/image_network_widget.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({Key? key, required this.character}) : super(key: key);

  final Character character;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          character.name,
        ),
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.red,
          ),
        ),
      ),
      body: ListView(
        children: [
          ImageNetworkWidget(
              path: character.thumbnail.imagePath, width: MediaQuery.of(context).size.width, height: 250),
          const SizedBox(
            height: 8,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(character.description.isEmpty ? 'Description not found' : character.description,
                textAlign: TextAlign.center, style: const TextStyle(fontWeight: FontWeight.bold)),
          ),
          const SizedBox(
            height: 20,
          ),
          Visibility(
            visible: character.comics.items.isNotEmpty,
            child: Column(
              children: [
                const Text(
                  'Comics: ',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red, fontSize: 22),
                ),
                const SizedBox(
                  height: 8,
                ),
                Column(
                  children: _buildComicsTextList(),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  List<Padding> _buildComicsTextList() {
    return character.comics.items
        .map(
          (ComicSummary element) => Padding(
            padding: const EdgeInsets.all(8),
            child: Text(
              element.name,
              textAlign: TextAlign.justify,
            ),
          ),
        )
        .toList();
  }
}
