import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Modul 4',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const MainPage(),
    );
  }
}

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Text('Modul 4 – Flexible & Expanded'),
          bottom: const TabBar(
            isScrollable: true,
            tabs: [
              Tab(text: 'P1: Flexible'),
              Tab(text: 'P2: Expanded'),
              Tab(text: 'Tugas: Music Control'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            Percobaan1Flexible(),
            Percobaan2Expanded(),
            TugasMusicControl(),
          ],
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────
// PERCOBAAN 1 – Flexible
// ─────────────────────────────────────────────
class KotakBiruJempolKecil extends StatelessWidget {
  const KotakBiruJempolKecil({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 75,
      height: 75,
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.black, width: 2),
      ),
      child: const Icon(
        Icons.thumb_up,
        color: Colors.white,
        size: 40,
      ),
    );
  }
}

class Percobaan1Flexible extends StatelessWidget {
  const Percobaan1Flexible({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flexible'),
        automaticallyImplyLeading: false,
      ),
      body: const Center(
        child: Row(
          children: [
            Flexible(
              fit: FlexFit.tight,
              flex: 1,
              child: KotakBiruJempolKecil(),
            ),
            Flexible(
              fit: FlexFit.tight,
              flex: 3,
              child: KotakBiruJempolKecil(),
            ),
            Flexible(
              fit: FlexFit.loose,
              flex: 2,
              child: KotakBiruJempolKecil(),
            ),
          ],
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────
// PERCOBAAN 2 – Expanded
// ─────────────────────────────────────────────
class Percobaan2Expanded extends StatelessWidget {
  const Percobaan2Expanded({super.key});

  Container _kotakUji(Color warna, double tinggi, String teks) {
    return Container(
      width: double.infinity,
      height: tinggi,
      color: warna,
      alignment: const Alignment(0.0, 0.0),
      child: Text(
        teks,
        style: const TextStyle(fontSize: 30, color: Colors.white),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Expanded'),
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
          _kotakUji(Colors.amber, 150, 'Normal'),
          Flexible(
            fit: FlexFit.loose,
            flex: 1,
            child: _kotakUji(Colors.green, 100, 'Flexible'),
          ),
          Expanded(
            flex: 2,
            child: _kotakUji(Colors.blue, 250, 'Expanded'),
          ),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────
// TUGAS – Control Bar Pemutar Musik
// ─────────────────────────────────────────────
class TugasMusicControl extends StatelessWidget {
  const TugasMusicControl({super.key});

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData.dark(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Pemutar Musik'),
          automaticallyImplyLeading: false,
        ),
        body: const Center(
          child: Text(
            'Pemutar Musik',
            style: TextStyle(fontSize: 18),
          ),
        ),
        bottomNavigationBar: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
          color: Colors.black54,
          child: Row(
            children: [
              Expanded(
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.shuffle, color: Colors.white),
                ),
              ),
              Expanded(
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.skip_previous, color: Colors.white),
                ),
              ),
              Flexible(
                flex: 2,
                fit: FlexFit.tight,
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.play_circle_fill,
                    color: Colors.white,
                    size: 48,
                  ),
                ),
              ),
              Expanded(
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.skip_next, color: Colors.white),
                ),
              ),
              Expanded(
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.repeat, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
