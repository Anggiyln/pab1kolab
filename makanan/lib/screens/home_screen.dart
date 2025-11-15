import 'package:flutter/material.dart';
import 'package:makanan/models/dummy_resep.dart';
import 'package:makanan/screens/detail_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Resepku"),
        backgroundColor: Colors.brown,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text(
            "Resep Pilihan",
            style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),

          // =====================
          // 3 gambar portrait sejajar
          // =====================
          Row(
            children: [
              Expanded(
                child: _portraitCard(context, dummyResep[0]),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _portraitCard(context, dummyResep[1]),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _portraitCard(context, dummyResep[2]),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // Widget untuk gambar portrait + title + klik ke detail
  Widget _portraitCard(BuildContext context, recipe) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => DetailScreen(recipe: recipe),
          ),
        );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          AspectRatio(
            aspectRatio: 3 / 4, // portrait
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                recipe.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            recipe.title,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
