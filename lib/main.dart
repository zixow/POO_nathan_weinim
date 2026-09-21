import 'package:flutter/material.dart';
import 'Hotel.dart';
import 'Commentaires.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Office du Tourisme',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
      ),
      home: const Navigation(),
    );
  }
}

// La structure principale : barre du haut + contenu + barre du bas
class Navigation extends StatefulWidget {
  const Navigation({super.key});

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  // Numéro de l'onglet sélectionné (0 = Accueil)
  int index = 0;

  // Les 3 pages, dans le même ordre que les onglets
  final List<Widget> pages = const [
    PageAccueil(),
    PageHotels(),
    PageCommentaires(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Barre du haut
      appBar: AppBar(
        title: const Text('Office du Tourisme'),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
      ),

      // La page affichée change selon l'onglet
      body: pages[index],

      // Barre du bas
      bottomNavigationBar: NavigationBar(
        selectedIndex: index,
        onDestinationSelected: (i) {
          setState(() {
            index = i;
          });
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home),
            label: 'Accueil',
          ),
          NavigationDestination(
            icon: Icon(Icons.hotel_outlined),
            selectedIcon: Icon(Icons.hotel),
            label: 'Hôtels',
          ),
          NavigationDestination(
            icon: Icon(Icons.comment_outlined),
            selectedIcon: Icon(Icons.comment),
            label: 'Commentaires',
          ),
        ],
      ),
    );
  }
}

// ---------- PAGE ACCUEIL (avec ta barre de recherche) ----------
class PageAccueil extends StatelessWidget {
  const PageAccueil({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF333333),
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          TextField(
            onChanged: (valeur) {
              print(valeur);
            },
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              prefixIcon: const Icon(Icons.search, color: Colors.grey),
              contentPadding: const EdgeInsets.symmetric(vertical: 0),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide.none,
              ),
            ),
          ),
          const SizedBox(height: 24),
          const Text(
            "Bienvenue sur l'application",
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
        ],
      ),
    );
  }
}

// ---------- PAGE COMMENTAIRES ----------
class PageCommentaires extends StatelessWidget {
  const PageCommentaires({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("Page des commentaires", style: TextStyle(fontSize: 22)),
    );
  }
}