
import 'package:flutter/material.dart';

import 'screens/parametres_screen.dart';
import 'screens/catalogue_screen.dart';
import 'screens/ma_liste_screen.dart';
import 'screens/galerie_screen.dart';
import 'data/livres_data.dart';
import 'widgets/livre_card.dart';

void main() {
  runApp(const MaBiblioApp());
}

class MaBiblioApp extends StatelessWidget {
  const MaBiblioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MaBiblio',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void ouvrirPage(Widget page) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => page),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MaBiblio'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Icon(
            Icons.menu_book,
            size: 80,
            color: Colors.blue,
          ),
          const Center(
            child: Text(
              'Bienvenue dans MaBiblio !',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 20),

          // Partie 01 : Paramètres
          Card(
            child: ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Paramètres'),
              subtitle: const Text('Partie 01'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () => ouvrirPage(const ParametresScreen()),
            ),
          ),

          // Partie 02 : ListView et catalogue
          Card(
            child: ListTile(
              leading: const Icon(Icons.list),
              title: const Text('Catalogue des livres'),
              subtitle: const Text('Partie 02 - ListView'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () => ouvrirPage(const CatalogueScreen()),
            ),
          ),

          // Partie 03 : CheckboxListTile
          Card(
            child: ListTile(
              leading: const Icon(Icons.check_box),
              title: const Text('Ma liste de lecture'),
              subtitle: const Text('Partie 03 - CheckboxListTile'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () => ouvrirPage(const MaListeScreen()),
            ),
          ),

          // Partie 04 : Card
          Card(
            child: ListTile(
              leading: const Icon(Icons.credit_card),
              title: const Text('Cartes des livres'),
              subtitle: const Text('Partie 04 - Card'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () => ouvrirPage(const CardDemoScreen()),
            ),
          ),

          // Partie 05 : GridView
          Card(
            child: ListTile(
              leading: const Icon(Icons.grid_view),
              title: const Text('Galerie des livres'),
              subtitle: const Text('Partie 05 - GridView'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () => ouvrirPage(const GalerieScreen()),
            ),
          ),
        ],
      ),
    );
  }
}

// Écran de démonstration du widget LivreCard

class CardDemoScreen extends StatelessWidget {
  const CardDemoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cartes des livres'),
      ),
      body: ListView.builder(
        itemCount: livres.length,
        itemBuilder: (context, index) {
          final livre = livres[index];

          return Card(
            elevation: 4,
            margin: const EdgeInsets.all(8),
            color: livre.couleur.withValues(alpha: 0.15),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: livre.couleur,
                child: const Icon(
                  Icons.menu_book,
                  color: Colors.white,
                ),
              ),
              title: Text(livre.titre),
              subtitle: Text('${livre.auteur} - ${livre.annee}'),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('${livre.note}'),
                  const Icon(Icons.star, color: Colors.amber),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

