import 'package:flutter/material.dart';

class LearnPage extends StatelessWidget {
  const LearnPage({super.key});

  @override
  Widget build(BuildContext context) {
    const Color primaryGreen = Color(0xFF4CAF50);
    final topics = [
      _Topic(
        title: '🌱 Les capteurs',
        description:
        'Les capteurs sentent si la terre est sèche ou mouillée. Quand c’est sec, on donne de l’eau ! ',
        imageUrl:
        'https://cepmaroc.com/111-large_default/capteur-d-humidite-de-sol-soil-yl-69.jpg',
      ),
      _Topic(
        title: '🚿 Les pompes',
        description:
        'Les pompes poussent l’eau comme un toboggan vers les tuyaux.',
        imageUrl:
        'https://images.unsplash.com/photo-1526045478516-99145907023c?auto=format&fit=crop&w=400&q=60',
      ),
      _Topic(
        title: '🔧 Les vannes',
        description:
        'Les vannes sont des portes qui s’ouvrent ou se ferment pour laisser passer l’eau.',
        imageUrl:
        'https://cdn.manomano.com/media/edison/b/a/8/9/ba89257b79dc.jpg',
      ),
      _Topic(
        title: '💧 Cycle de l’eau',
        description:
        'Suis la goutte d’eau : elle sort du réservoir, arrose les plantes, puis retourne dans la nature.',
        imageUrl:
        'https://escape-kit.com/wp-content/uploads/2022/02/cycle-de-l-eau-min-1030x785.png',
      ),
      _Topic(
        title: '🌞 Bonnes pratiques',
        description:
        'Arrose le matin, cache la terre avec des feuilles, et regarde souvent les capteurs.',
        imageUrl:
        'https://images.unsplash.com/photo-1501004318641-b39e6451bec6?auto=format&fit=crop&w=400&q=60',
      ),
      _Topic(
        title: '🧠 Pourquoi irriguer ?',
        description:
        'Sans arrosage, les plantes ont soif ; avec l’eau, elles grandissent contentes ! ',
        imageUrl:
        'https://cdn.pixabay.com/photo/2020/08/01/10/01/the-cultivation-of-5455003_1280.jpg',
      ),
      _Topic(
        title: '👩‍🌾 Les outils d’un fermier',
        description:
        'Un arrosoir, c’est comme une petite douche pour tes plantes adorées.',
        imageUrl:
        'https://cdn.pixabay.com/photo/2017/07/19/08/50/gardening-2518377_1280.jpg',
      ),
      _Topic(
        title: '🔌 Les panneaux solaires',
        description:
        'Les panneaux solaires attrapent la lumière du soleil pour donner de l’énergie aux machines.',
        imageUrl:
        'https://images.unsplash.com/photo-1509395062183-67c5ad6faff9?auto=format&fit=crop&w=400&q=60',
      ),
      _Topic(
        title: '📊 Données & analyse',
        description:
        'L’ordi lit les nombres des capteurs et dit : “Arrose maintenant !” ou “Attends encore.”',
        imageUrl:
        'https://images.unsplash.com/photo-1555949963-aa79dcee981c?auto=format&fit=crop&w=400&q=60',
      ),
      _Topic(
        title: '🛰️ Modules IoT',
        description:
        'Les modules IoT envoient les infos des plantes jusqu’à ton téléphone, comme un message secret.',
        imageUrl:
        'https://www.fourfaith.com/uploadfile/2022/0627/20220627034624705.jpg',
      ),
      _Topic(
        title: '🌿 Les nutriments',
        description:
        'Les engrais sont des “vitamines” que l’on ajoute à l’eau pour que les plantes soient fortes.',
        imageUrl:
        'https://blog.labrigadedevero.com/wp-content/uploads/sites/4/2021/04/pyramide-nutriments-1024x876.jpg',
      ),
      _Topic(
        title: '♻️ Durabilité',
        description:
        'On économise l’eau et l’électricité pour protéger la planète.',
        imageUrl:
        'https://api-backend-assets.s3.eu-south-1.amazonaws.com/private/filer_public/01/3f/013f1d16-c987-4dac-919e-f4f58865cd83/e26128da-0845-4644-92a4-eb31e113f6b4.jpg',
      ),
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFFFFAF0),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Bandeau supérieur
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: primaryGreen,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Row(
                  children: [
                    Icon(Icons.book, color: Colors.white),
                    SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        'Découvre l’arrosage malin !',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'ComicSans',
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // Grille des cours
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 0.75,
                ),
                itemCount: topics.length,
                itemBuilder: (context, index) {
                  final t = topics[index];
                  return InkWell(
                    onTap: () => showDialog(
                      context: context,
                      builder: (_) => AlertDialog(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16)),
                        title: Text(t.title),
                        content: Text(
                          t.description,
                          style: const TextStyle(fontFamily: 'ComicSans'),
                        ),
                        actions: [
                          TextButton(
                            child: const Text('Fermer'),
                            onPressed: () => Navigator.of(context).pop(),
                          ),
                        ],
                      ),
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 6,
                            offset: Offset(2, 2),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Expanded(
                            child: ClipRRect(
                              borderRadius: const BorderRadius.vertical(
                                  top: Radius.circular(20)),
                              child: Image.network(
                                t.imageUrl,
                                fit: BoxFit.cover,
                                loadingBuilder: (context, child, progress) {
                                  if (progress == null) return child;
                                  return const Center(
                                    child: CircularProgressIndicator(),
                                  );
                                },
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8),
                            child: Text(
                              t.title,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'ComicSans',
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Topic {
  final String title;
  final String description;
  final String imageUrl;

  _Topic({
    required this.title,
    required this.description,
    required this.imageUrl,
  });
}
