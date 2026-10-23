
import 'package:flutter/material.dart';

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
      theme: ThemeData(useMaterial3: true),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MaBiblio'),
      ),
      body: ListView(
        children: [
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Mon profil'),
            subtitle: const Text('Nom, e-mail, mot de passe'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Profil sélectionné'),
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.notifications),
            title: const Text('Notifications'),
            subtitle: const Text('Gérer les notifications'),
            tileColor: Colors.blue.shade100,
            iconColor: Colors.blue,
            textColor: Colors.black,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          const ListTile(
            leading: Icon(Icons.language),
            title: Text('Langue'),
            subtitle: Text('Français'),
          ),
          const ListTile(
            leading: Icon(Icons.info),
            title: Text('À propos'),
            subtitle: Text('Informations sur MaBiblio'),
            dense: true,
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Paramètres'),
            subtitle: const Text('Configuration de l’application'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Paramètres sélectionnés'),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
