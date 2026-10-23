
import 'package:flutter/material.dart';
import '../models/livre.dart';
import '../data/livres_data.dart';

class CatalogueScreen extends StatelessWidget {
  const CatalogueScreen({super.key});

  Widget livreTile(Livre livre) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: livre.couleur,
        child: Text(
          livre.titre[0],
          style: const TextStyle(color: Colors.white),
        ),
      ),
      title: Text(livre.titre),
      subtitle: Text('${livre.auteur} - ${livre.annee}'),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('${livre.note}'),
          const Icon(Icons.star, color: Colors.yellow),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final nouveautes = livres.where((l) => l.nouveaute).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Catalogue'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(8),
            child: Text(
              'Nouveautés',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          SizedBox(
            height: 160,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: nouveautes.map((l) {
                return Container(
                  width: 110,
                  margin: const EdgeInsets.all(8),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: l.couleur,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: const EdgeInsets.all(8),
                  child: Text(
                    l.titre,
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: Colors.white),
                  ),
                );
              }).toList(),
            ),
          ),

          const Padding(
            padding: EdgeInsets.all(8),
            child: Text(
              'Tout le catalogue',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          Expanded(
            child: ListView.separated(
              itemCount: livres.length,
              itemBuilder: (context, index) {
                return livreTile(livres[index]);
              },
              separatorBuilder: (context, index) {
                return const Divider(indent: 72);
              },
            ),
          ),
        ],
      ),
    );
  }
}
