import 'package:flutter/material.dart';
import 'question.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  // Couleurs partagées (cohérence avec LearnPage)
  static const Color primaryGreen = Color(0xFF4CAF50);
  static const Color darkGreen = Color(0xFF2E7D32);
  static const Color backgroundColor = Colors.white;
  static const Color correctGreen = Color(0xFFAED581);
  static const Color incorrectRed = Color(0xFFFFAB91);

  final List<Question> _questions = [
    Question(
      text: '🌱 Pourquoi arrose‑t‑on les plantes ?',
      options: [
        'Pour les décorer 🎀',
        "Pour leur donner de l'eau 💧",
        'Pour les réchauffer 🔥',
      ],
      answerIndex: 1,
    ),
    Question(
      text: "🧪 Quel capteur mesure l'humidité du sol ?",
      options: [
        'Capteur de température 🌡️',
        "Capteur d'humidité 💦",
        'Capteur de lumière 🌞',
      ],
      answerIndex: 1,
    ),
    Question(
      text: '⏰ Quand vaut‑il mieux arroser ?',
      options: [
        'À midi 🕛',
        'Le soir tard 🌙',
        'Tôt le matin 🌄',
      ],
      answerIndex: 2,
    ),
    Question(
      text: '🍃 Quelle plante a besoin d’un sol sec ?',
      options: [
        'Cactus 🌵',
        'Rose 🌹',
        'Tulipe 🌷',
      ],
      answerIndex: 0,
    ),
    Question(
      text: '💧 Comment savoir si une plante a besoin d’eau ?',
      options: [
        'Les feuilles sont vertes 🍃',
        'Les feuilles sont tombées 🍂',
        'Le sol est sec 🌾',
      ],
      answerIndex: 2,
    ),
    Question(
      text: '🌞 Pourquoi les plantes aiment‑elles le soleil ?',
      options: [
        'Il leur donne de la chaleur 🔥',
        'Il aide à la photosynthèse 🌿',
        'Il les protège des insectes 🐞',
      ],
      answerIndex: 1,
    ),
    Question(
      text: '🌻 Qu’est‑ce qu’une serre ?',
      options: [
        'Un endroit pour stocker des outils 🛠️',
        'Un endroit pour cultiver des plantes 🌱',
        'Un endroit pour ranger les plantes malades 🤧',
      ],
      answerIndex: 1,
    ),

    // ─────────  Nouvelles questions  ─────────
    Question(
      text: '🚿 Que fait une pompe ?',
      options: [
        "Elle pousse l'eau vers les tuyaux ↗️",
        'Elle coupe la lumière 💡',
        'Elle fait pousser les plantes sans eau 🌱',
      ],
      answerIndex: 0,
    ),
    Question(
      text: '🔆 Que donnent les panneaux solaires ?',
      options: [
        "De l'électricité ⚡",
        'Du vent 💨',
        'Des bulles 🫧',
      ],
      answerIndex: 0,
    ),
    Question(
      text: '🌡️ Que mesure un thermomètre ?',
      options: [
        'La température 🌡️',
        'Le bruit 🔊',
        'La vitesse ⚡',
      ],
      answerIndex: 0,
    ),
    Question(
      text: '🍀 Pourquoi met‑on du paillage sur le sol ?',
      options: [
        "Pour garder l'humidité 💧",
        'Pour décorer 🎨',
        'Pour faire du bruit 🔔',
      ],
      answerIndex: 0,
    ),
    Question(
      text: '🔌 Que fait un module IoT ?',
      options: [
        'Il envoie les infos au téléphone 📱',
        'Il éclaire la plante 💡',
        'Il change la couleur des feuilles 🎨',
      ],
      answerIndex: 0,
    ),
  ];

  int _current = 0;
  int _score = 0;
  int? _selectedIndex;

  void _select(int index) {
    if (_selectedIndex != null) return;

    setState(() {
      _selectedIndex = index;
      if (index == _questions[_current].answerIndex) _score++;
    });

    Future.delayed(const Duration(seconds: 1), () {
      if (_current < _questions.length - 1) {
        setState(() {
          _current++;
          _selectedIndex = null;
        });
      } else {
        _showResult();
      }
    });
  }

  void _showResult() {
    String titleMessage;
    String resultMessage;

    if (_score >= (_questions.length * 0.7).round()) {
      titleMessage = '🎉 Bravo !';
      resultMessage = '🏆 Tu as eu $_score sur ${_questions.length} bonnes réponses !\n\n🌟 Continue comme ça, petit jardinier 👩‍🌾👨‍🌾 !';
    } else {
      titleMessage = '🤔 Hmmm, pense encore !';
      resultMessage = '🏆 Tu as eu $_score sur ${_questions.length} bonnes réponses.\n\n🌱 Pas de soucis, réessaie et apprends davantage !';
    }

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => AlertDialog(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: Text(
          titleMessage,
          style: const TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.bold,
            color: darkGreen,
          ),
          textAlign: TextAlign.center,
        ),
        content: Text(
          resultMessage,
          style: const TextStyle(fontSize: 18, color: darkGreen),
          textAlign: TextAlign.center,
        ),
        actions: [
          Center(
            child: ElevatedButton.icon(
              icon: const Icon(Icons.replay, size: 20),
              label: const Text('Rejouer', style: TextStyle(fontSize: 18)),
              style: ElevatedButton.styleFrom(
                backgroundColor: primaryGreen,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
              ),
              onPressed: () {
                Navigator.pop(context);
                setState(() {
                  _current = 0;
                  _score = 0;
                  _selectedIndex = null;
                });
              },
            ),
          ),
        ],
        actionsAlignment: MainAxisAlignment.center,
        actionsPadding: const EdgeInsets.only(bottom: 16),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final q = _questions[_current];

    return Scaffold(
      backgroundColor: backgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              decoration: BoxDecoration(
                color: primaryGreen.withOpacity(0.1),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: primaryGreen.withOpacity(0.5), width: 1),
              ),
              child: Text(
                '📖 Question ${_current + 1} / ${_questions.length}',
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                  color: darkGreen,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
              decoration: BoxDecoration(
                color: primaryGreen.withOpacity(0.15),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: primaryGreen.withOpacity(0.7), width: 1.5),
              ),
              child: Text(
                q.text,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: darkGreen,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 24),
            ...List.generate(q.options.length, (i) {
              final isCorrect = i == q.answerIndex;
              final isSelected = _selectedIndex == i;
              Color? cardColor;

              if (_selectedIndex != null) {
                if (isCorrect) {
                  cardColor = correctGreen;
                } else if (isSelected) {
                  cardColor = incorrectRed;
                }
              } else {
                cardColor = Colors.white;
              }

              return Card(
                color: cardColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                  side: BorderSide(
                    color: isCorrect && _selectedIndex != null
                        ? Colors.green
                        : isSelected && _selectedIndex != null
                        ? Colors.red
                        : primaryGreen.withOpacity(0.5),
                    width: 1.5,
                  ),
                ),
                elevation: 3,
                margin: const EdgeInsets.only(bottom: 10),
                child: InkWell(
                  onTap: () => _select(i),
                  borderRadius: BorderRadius.circular(15),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: ListTile(
                      leading: _selectedIndex != null
                          ? (isCorrect
                          ? const Icon(Icons.check_circle, color: Colors.green, size: 28)
                          : isSelected
                          ? const Icon(Icons.cancel, color: Colors.red, size: 28)
                          : Icon(Icons.circle, color: primaryGreen.withOpacity(0.3), size: 28))
                          : Icon(Icons.circle_outlined, color: primaryGreen, size: 28),
                      title: Text(
                        q.options[i],
                        style: TextStyle(
                          fontSize: 18,
                          color: darkGreen,
                          fontWeight: _selectedIndex != null && (isCorrect || isSelected)
                              ? FontWeight.bold
                              : FontWeight.normal,
                        ),
                      ),
                    ),
                  ),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
