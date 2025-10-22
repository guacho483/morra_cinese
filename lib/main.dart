import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sasso Carta Forbice',
      theme: ThemeData(
        colorSchemeSeed: Colors.indigo,
        useMaterial3: true,
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        colorSchemeSeed: Colors.blue,
        useMaterial3: true,
        brightness: Brightness.dark,
      ),
      home: const MyHomePage(title: 'Sasso Carta Forbice'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String playerMove = '';
  String computerMove = '';
  String winner = '';
  
  final List<String> choices = ['Sasso', 'Carta', 'Forbice'];

  void playGame(String playerChoice) {
    setState(() {
      playerMove = playerChoice;
      computerMove = choices[Random().nextInt(3)];
      
      if (playerMove == computerMove) {
        winner = 'Pareggio!';
      } else if (
        (playerMove == 'Sasso' && computerMove == 'Forbice') ||
        (playerMove == 'Forbice' && computerMove == 'Carta') ||
        (playerMove == 'Carta' && computerMove == 'Sasso')
      ) {
        winner = 'Hai vinto tu!';
      } else {
        winner = 'Ha vinto il PC!';
      }
    });
  }

  void resetGame() {
    setState(() {
      playerMove = '';
      computerMove = '';
      winner = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Tre pulsanti colorati equidistanziati
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () => playGame('Sasso'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.all(30),
                    shape: const CircleBorder(),
                  ),
                  child: const Icon(Icons.circle, size: 40),
                ),
                ElevatedButton(
                  onPressed: () => playGame('Carta'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.all(30),
                    shape: const CircleBorder(),
                  ),
                  child: const Icon(Icons.note, size: 40),
                ),
                ElevatedButton(
                  onPressed: () => playGame('Forbice'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.all(30),
                    shape: const CircleBorder(),
                  ),
                  child: const Icon(Icons.content_cut, size: 40),
                ),
              ],
            ),
            
            const SizedBox(height: 40),
            
            // Testi sotto i pulsanti
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Text(
                    'La mia mossa: ${playerMove.isEmpty ? '-' : playerMove}',
                    style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Mossa del PC: ${computerMove.isEmpty ? '-' : computerMove}',
                    style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Vincitore: ${winner.isEmpty ? '-' : winner}',
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.purple,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: resetGame,
        backgroundColor: Colors.red,
        tooltip: 'Ricomincia',
        child: const Icon(Icons.refresh, color: Colors.white),
      ),
    );
  }
}