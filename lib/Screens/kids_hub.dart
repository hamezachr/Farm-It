import 'package:flutter/material.dart';
import 'learn_page.dart';
import 'quiz_page.dart';
import 'game_page.dart';

class KidsHub extends StatelessWidget {
  const KidsHub({super.key});
  static const Color primaryGreen = Color(0xFF4CAF50);
  static const Color darkGreen = Color(0xFF2E7D32);
  static const Color backgroundColor = Colors.white;
  @override
  Widget build(BuildContext context) {
    // Définition des couleurs qui correspondent au style de QuizPage
    const Color primaryGreen = Color(0xFF4CAF50); // More appealing green
    const Color darkGreen = Color(0xFF2E7D32);
    const Color backgroundColor = Colors.white; // White background

    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: backgroundColor,
        appBar: AppBar(
          title: const Text(
            '🌾 Farm IT – Kids Zone 🌱',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          backgroundColor: primaryGreen,
          centerTitle: true,
          elevation: 4,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(15),
            ),
          ),
          bottom: TabBar(
            indicator: BoxDecoration(
              color: const Color(0xFF388E3C), // Softer dark green
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(10),
              ),
            ),
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white70,
            indicatorSize: TabBarIndicatorSize.tab,
            labelStyle: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
            tabs: const [
              Tab(
                icon: Icon(Icons.menu_book),
                text: 'Apprendre',
                iconMargin: EdgeInsets.only(bottom: 4),
              ),
              Tab(
                icon: Icon(Icons.quiz),
                text: 'Quiz',
                iconMargin: EdgeInsets.only(bottom: 4),
              ),
              Tab(
                icon: Icon(Icons.videogame_asset),
                text: 'Jeu',
                iconMargin: EdgeInsets.only(bottom: 4),
              ),

              Tab(
                icon: Icon(Icons.agriculture),
                text: 'Programmes',
                iconMargin: EdgeInsets.only(bottom: 4),
              )
            ],
          ),
        ),
        body: Stack(
          children: [
            // Background decoration
            Positioned.fill(
              child: Opacity(
                opacity: 0.1,
                child: Image.asset(
                  'assets/farm_pattern.png',
                  repeat: ImageRepeat.repeat,
                  errorBuilder: (context, error, stackTrace) => Container(
                    color: backgroundColor,
                  ),
                ),
              ),
            ),

            // Tab content
            const TabBarView(
              children: [
                LearnPage(),
                QuizPage(),
                GamePage(),
                ProgramsPage()
              ],
            ),

            // Bottom decoration
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Image.asset(
                'assets/grass_bottom.png',
                height: 60,
                fit: BoxFit.fitWidth,
                errorBuilder: (context, error, stackTrace) => Container(
                  height: 20,
                  decoration: const BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(20),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: Container(
          color: primaryGreen,
          height: 10,
          width: double.infinity,
        ),
      ),
    );
  }
}

class ProgramsPage extends StatelessWidget {
  const ProgramsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final programs = [
      _Program(
        title: 'Seed to Plant',
        subtitle: 'Du grain à la plante',
        description:
        'Découvre le cycle complet de la plante – de la germination à la récolte – à l’aide d’outils de suivi intelligents.',
        duration: 'Atelier 2 h',
        ages: '6-10 ans',
        icon: Icons.spa,
        lessons: const [
          'Introduction : qu’est-ce qu’une graine ?',
          'Conditions de germination',
          'Observer les racines',
          'Suivi de la croissance avec un capteur',
          'Récolte et dégustation',
        ],
      ),
      _Program(
        title: 'Smart Irrigation',
        subtitle: 'Irrigation intelligente',
        description:
        'Construis et programme un système d’arrosage qui réagit automatiquement au taux d’humidité du sol.',
        duration: 'Atelier 3 h',
        ages: '8-12 ans',
        icon: Icons.water_drop,
        lessons: const [
          'Pourquoi l’eau est-elle importante ?',
          'Capteurs d’humidité : fonctionnement',
          'Montage du circuit (pompe + relais)',
          'Coder la logique ON/OFF',
          'Test sur mini-potager',
        ],
      ),
      _Program(
        title: 'Farm Data Science',
        subtitle: 'La data au service de la ferme',
        description:
        'Apprends à collecter et analyser les données de croissance pour prendre de meilleures décisions agricoles.',
        duration: 'Atelier 4 h',
        ages: '10-14 ans',
        icon: Icons.bar_chart,
        lessons: const [
          'Mesurer la hauteur d’une plante',
          'Enregistrer les données sous CSV',
          'Graphiques de croissance',
          'Détecter les anomalies',
          'Prendre une décision : quand récolter ?',
        ],
      ),
    ];

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: KidsHub.primaryGreen,
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Row(
              children: [
                Icon(Icons.lightbulb, color: Colors.white),
                SizedBox(width: 10),
                Expanded(
                  child: Text(
                    'Nos programmes – Des ateliers interactifs pour inspirer et éduquer',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          ...programs
              .map((p) => InkWell(
            borderRadius: BorderRadius.circular(20),
            onTap: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (_) => ProgramDetailPage(program: p))),
            child: _ProgramCard(program: p),
          ))
              .toList(),
        ],
      ),
    );
  }
}

/*────────────────────────  DÉTAIL PROGRAMME  ─────────────────────────*/

class ProgramDetailPage extends StatelessWidget {
  final _Program program;
  const ProgramDetailPage({super.key, required this.program});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(program.title),
        backgroundColor: KidsHub.primaryGreen,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            // Illustration (optionnelle)
            Icon(program.icon, size: 72, color: KidsHub.darkGreen),
            const SizedBox(height: 16),
            Text(
              program.subtitle,
              style: const TextStyle(fontSize: 18, color: Colors.grey),
            ),
            const SizedBox(height: 8),
            Text(
              program.description,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            Wrap(
              spacing: 8,
              children: [
                Chip(label: Text(program.duration)),
                Chip(label: Text(program.ages)),
              ],
            ),
            const Divider(height: 32),
            // ----- Contenu pédagogique -----
            const Text('Contenu du cours',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: KidsHub.darkGreen)),
            const SizedBox(height: 12),
            ...program.lessons.map((l) => ListTile(
              leading: const Icon(Icons.check_circle_outline),
              title: Text(l),
            )),
            // ----- Exemple de vidéo intégrée -----
            /*Container(
              height: 200,
              margin: const EdgeInsets.only(top: 24),
              color: Colors.black12, // → remplace par un lecteur vidéo
              child: const Center(child: Text('Vidéo tutorielle ici')),
            ),*/
          ],
        ),
      ),
    );
  }
}

/*─────────────────────────  DATA MODEL  ─────────────────────────*/

class _Program {
  final String title;
  final String subtitle;
  final String description;
  final String duration;
  final String ages;
  final IconData icon;
  final List<String> lessons; // ← nouveau

  _Program({
    required this.title,
    required this.subtitle,
    required this.description,
    required this.duration,
    required this.ages,
    required this.icon,
    required this.lessons,
  });
}

/*────────────────────────  CARTE PROGRAMME  ─────────────────────────*/

class _ProgramCard extends StatelessWidget {
  final _Program program;
  const _ProgramCard({required this.program});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.only(bottom: 16),
      shape:
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 24,
                  backgroundColor:
                  KidsHub.primaryGreen.withOpacity(0.2),
                  child:
                  Icon(program.icon, color: KidsHub.darkGreen, size: 28),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(program.subtitle,
                          style:
                          const TextStyle(fontSize: 14, color: Colors.grey)),
                      Text(program.title,
                          style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: KidsHub.darkGreen)),
                    ],
                  ),
                ),
                const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey)
              ],
            ),
            const SizedBox(height: 12),
            Text(program.description,
                style:
                const TextStyle(fontSize: 16, color: Colors.black87)),
            const SizedBox(height: 12),
            Row(
              children: [
                Chip(label: Text(program.duration)),
                const SizedBox(width: 8),
                Chip(label: Text(program.ages)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}