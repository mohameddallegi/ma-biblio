
import 'package:flutter/material.dart';
import '../models/livre.dart';
import '../data/livres_data.dart';

class MaListeScreen extends StatefulWidget {
  const MaListeScreen({super.key});

  @override
  State<MaListeScreen> createState() => _MaListeScreenState();
}

class _MaListeScreenState extends State<MaListeScreen> {
  // Q3.2 : afficher uniquement les nouveautés
  bool _nouveautesSeulement = false;

  // Q3.3 : les cinq genres sont cochés au départ
  final Map<String, bool> _genres = {
    'Roman': true,
    'Jeunesse': true,
    'Science': true,
    'Histoire': true,
    'Informatique': true,
  };

  // Icône associée à chaque genre
  IconData iconeGenre(String genre) {
    switch (genre) {
      case 'Science':
        return Icons.science;
      case 'Informatique':
        return Icons.computer;
      case 'Histoire':
        return Icons.history_edu;
      case 'Jeunesse':
        return Icons.child_care;
      default:
        return Icons.menu_book;
    }
  }

  @override
  Widget build(BuildContext context) {
    // Q3.6 : état de la case « Tous les genres »
    final tousCoches = _genres.values.every((v) => v);
    final aucunCoche = _genres.values.every((v) => !v);

    final bool? valeurTous = tousCoches
        ? true
        : aucunCoche
            ? false
            : null;

    // Q3.7 : filtrer les livres selon les genres et les nouveautés
    final List<Livre> livresAffiches = livres.where((livre) {
      final genreSelectionne = _genres[livre.genre] ?? false;
      final nouveauteValide =
          !_nouveautesSeulement || livre.nouveaute;

      return genreSelectionne && nouveauteValide;
    }).toList();

    // Q3.8 : calcul du nombre de livres lus
    final nbLus = livresAffiches.where((livre) => livre.lu).length;

    return Scaffold(
      appBar: AppBar(
        title: Text('Lus : $nbLus / ${livresAffiches.length}'),
      ),
      body: Column(
        children: [
          // Q3.2 : filtre des nouveautés
          CheckboxListTile(
            title: const Text('Afficher uniquement les nouveautés'),
            value: _nouveautesSeulement,
            activeColor: Colors.blue,
            controlAffinity: ListTileControlAffinity.leading,
            onChanged: (value) {
              setState(() {
                _nouveautesSeulement = value ?? false;
              });
            },
          ),

          const Divider(),

          // Q3.6 : case « Tous les genres » à trois états
          CheckboxListTile(
            title: const Text(
              'Tous les genres',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            tristate: true,
            value: valeurTous,
            activeColor: Colors.blue,
            controlAffinity: ListTileControlAffinity.leading,
            onChanged: (value) {
              setState(() {
                final bool cocher = value != true;
                _genres.updateAll((genre, ancien) => cocher);
              });
            },
          ),

          // Q3.3 et Q3.4 : cases des cinq genres
          ..._genres.keys.map((genre) {
            final nombre = livres.where((l) => l.genre == genre).length;

            return CheckboxListTile(
              title: Text(genre),
              subtitle: Text('$nombre livre(s)'),
              secondary: Icon(iconeGenre(genre)),
              activeColor: Colors.teal,
              controlAffinity: ListTileControlAffinity.leading,
              value: _genres[genre],
              onChanged: (value) {
                setState(() {
                  _genres[genre] = value ?? false;
                });
              },
            );
          }),

          const Divider(),

          // Q3.7 : liste des livres à lire ou déjà lus
          Expanded(
            child: ListView.separated(
              itemCount: livresAffiches.length,
              separatorBuilder: (context, index) =>
                  const Divider(indent: 60),
              itemBuilder: (context, index) {
                final livre = livresAffiches[index];

                return CheckboxListTile(
                  controlAffinity: ListTileControlAffinity.leading,
                  secondary: CircleAvatar(
                    backgroundColor: livre.couleur,
                    child: const Icon(
                      Icons.menu_book,
                      color: Colors.white,
                    ),
                  ),
                  title: Text(
                    livre.titre,
                    style: TextStyle(
                      decoration: livre.lu
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                    ),
                  ),
                  subtitle: Text('${livre.auteur} - ${livre.annee}'),
                  value: livre.lu,
                  activeColor: Colors.green,
                  onChanged: (value) {
                    setState(() {
                      livre.lu = value ?? false;
                    });
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
