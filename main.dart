lib/main.dart
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

const bg = Color(0xFF1E1E2F);
const accent = Color(0xFF5865F2);
const soft = Color(0xFF9AA0FF);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Selamat Datang Ke Jabatan Multimedia',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: accent,
          brightness: Brightness.dark,
        ),
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
  int index = 0;

  @override
  Widget build(BuildContext context) {
    final pages = [
      WelcomeTab(onMula: () => setState(() => index = 1)),
      const IntroTab(),
      const QuizTab(),
      const ContactTab(),
    ];
    return Scaffold(
      backgroundColor: bg,
      appBar: AppBar(
        title: const Text('Jabatan Multimedia'),
        backgroundColor: accent,
      ),
      body: pages[index],
      bottomNavigationBar: NavigationBar(
        selectedIndex: index,
        onDestinationSelected: (i) => setState(() => index = i),
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home), label: 'Utama'),
          NavigationDestination(icon: Icon(Icons.info), label: 'Pengenalan'),
          NavigationDestination(icon: Icon(Icons.quiz), label: 'Kuiz'),
          NavigationDestination(icon: Icon(Icons.call), label: 'Hubungi'),
        ],
      ),
    );
  }
}

// ---------- UTAMA ----------
class WelcomeTab extends StatelessWidget {
  final VoidCallback onMula;
  const WelcomeTab({super.key, required this.onMula});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.movie_filter, size: 80, color: soft),
            const SizedBox(height: 20),
            const Text(
              'Selamat Datang Ke Jabatan Multimedia',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white),
            ),
            const SizedBox(height: 12),
            const Text('Kreatif. Digital. Inovatif.',
                style: TextStyle(fontSize: 16, color: soft)),
            const SizedBox(height: 30),
            ElevatedButton(onPressed: onMula, child: const Text('Mula')),
          ],
        ),
      ),
    );
  }
}

// ---------- PENGENALAN ----------
class Topic {
  final IconData icon;
  final String title;
  final String short;
  final String detail;
  final List<String> tools;
  final List<String> careers;
  const Topic(this.icon, this.title, this.short, this.detail, this.tools,
      this.careers);
}

const topics = [
  Topic(
    Icons.brush,
    'Reka Bentuk Grafik',
    'Poster, logo dan imej visual menggunakan perisian reka bentuk.',
    'Reka bentuk grafik ialah seni menyampaikan mesej melalui gambar, warna, '
        'tipografi dan susun atur. Ia digunakan dalam iklan, penjenamaan, '
        'media sosial, bungkusan produk dan banyak lagi.',
    ['Adobe Photoshop', 'Adobe Illustrator', 'CorelDRAW', 'Canva'],
    ['Pereka Grafik', 'Pereka Logo', 'Pengarah Seni', 'Pereka Media Sosial'],
  ),
  Topic(
    Icons.animation,
    'Animasi',
    'Menghasilkan gerakan 2D dan 3D untuk cerita dan iklan.',
    'Animasi ialah proses menghasilkan gerakan daripada banyak gambar yang '
        'dipaparkan berturutan. Ia digunakan dalam kartun, filem, permainan '
        'video, iklan dan video pendidikan.',
    ['Blender', 'Adobe After Effects', 'Adobe Animate', 'Toon Boom Harmony'],
    ['Animator 2D', 'Animator 3D', 'Artis Kesan Visual (VFX)', 'Pereka Gerakan'],
  ),
  Topic(
    Icons.videocam,
    'Video & Audio',
    'Merakam, menyunting dan menghasilkan video serta bunyi.',
    'Bidang ini merangkumi perakaman, penyuntingan dan penerbitan video serta '
        'audio. Ia penting untuk televisyen, YouTube, muzik, podcast dan '
        'video korporat.',
    ['Adobe Premiere Pro', 'DaVinci Resolve', 'CapCut', 'Audacity'],
    ['Penyunting Video', 'Jurukamera', 'Jurutera Audio', 'Penerbit Kandungan'],
  ),
  Topic(
    Icons.web,
    'Web & Aplikasi',
    'Membangunkan laman web dan aplikasi mudah alih.',
    'Pembangunan web dan aplikasi ialah proses membina laman web serta '
        'aplikasi untuk telefon dan komputer. Pereka juga memastikan '
        'paparan mudah dan menarik untuk pengguna (UI/UX).',
    ['HTML, CSS & JavaScript', 'Flutter & Dart', 'Figma', 'Visual Studio Code'],
    ['Pembangun Web', 'Pembangun Aplikasi Mudah Alih', 'Pereka UI/UX'],
  ),
];

class IntroTab extends StatelessWidget {
  const IntroTab({super.key});

  Widget card(BuildContext context, Topic t) {
    return Card(
      color: const Color(0xFF2A2A40),
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        leading: Icon(t.icon, color: soft, size: 32),
        title: Text(t.title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(t.short),
        trailing: const Icon(Icons.chevron_right),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => DetailPage(topic: t)),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        const Text('Pengenalan',
            style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        const Text(
          'Jabatan Multimedia menggabungkan teknologi dan kreativiti untuk '
          'menghasilkan kandungan digital seperti grafik, animasi, video dan aplikasi.',
        ),
        const SizedBox(height: 20),
        const Text('Bidang Utama',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: soft)),
        const SizedBox(height: 4),
        const Text('Tekan mana-mana bidang untuk maklumat lanjut.',
            style: TextStyle(color: Colors.white54)),
        const SizedBox(height: 10),
        for (final t in topics) card(context, t),
      ],
    );
  }
}

class DetailPage extends StatelessWidget {
  final Topic topic;
  const DetailPage({super.key, required this.topic});

  Widget section(String heading, IconData icon, List<String> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 24),
        Text(heading,
            style: const TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: soft)),
        const SizedBox(height: 8),
        for (final item in items)
          ListTile(
            dense: true,
            contentPadding: EdgeInsets.zero,
            leading: Icon(icon, color: soft, size: 20),
            title: Text(item),
          ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bg,
      appBar: AppBar(title: Text(topic.title), backgroundColor: accent),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Center(child: Icon(topic.icon, size: 80, color: soft)),
          const SizedBox(height: 16),
          Text(topic.title,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
          const SizedBox(height: 16),
          Text(topic.detail, style: const TextStyle(fontSize: 16, height: 1.5)),
          section('Perisian Yang Digunakan', Icons.build, topic.tools),
          section('Peluang Kerjaya', Icons.work, topic.careers),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Kembali'),
          ),
        ],
      ),
    );
  }
}

// ---------- KUIZ ----------
class Question {
  final String text;
  final List<String> options;
  final int answer;
  const Question(this.text, this.options, this.answer);
}

const questions = [
  Question('Apakah maksud "multimedia"?',
      ['Satu jenis media sahaja', 'Gabungan teks, imej, audio dan video', 'Perisian antivirus'], 1),
  Question('Format fail manakah untuk video?',
      ['.mp4', '.docx', '.txt'], 0),
  Question('Apakah fungsi Flutter?',
      ['Menyunting audio', 'Membina aplikasi', 'Mencetak dokumen'], 1),
  Question('Bahasa pengaturcaraan yang digunakan oleh Flutter ialah?',
      ['Python', 'Java', 'Dart'], 2),
  Question('Animasi ialah gerakan yang dihasilkan daripada?',
      ['Satu gambar statik', 'Banyak gambar berturutan', 'Teks sahaja'], 1),
];

class QuizTab extends StatefulWidget {
  const QuizTab({super.key});
  @override
  State<QuizTab> createState() => _QuizTabState();
}

class _QuizTabState extends State<QuizTab> {
  int current = 0;
  int score = 0;
  int? picked;
  bool finished = false;

  void choose(int i) {
    if (picked != null) return;
    setState(() {
      picked = i;
      if (i == questions[current].answer) score++;
    });
  }

  void next() {
    setState(() {
      if (current < questions.length - 1) {
        current++;
        picked = null;
      } else {
        finished = true;
      }
    });
  }

  void restart() {
    setState(() {
      current = 0;
      score = 0;
      picked = null;
      finished = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (finished) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.emoji_events, size: 80, color: Colors.amber),
            const SizedBox(height: 16),
            Text('Skor anda: $score / ${questions.length}',
                style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            ElevatedButton(onPressed: restart, child: const Text('Cuba Lagi')),
          ],
        ),
      );
    }

    final q = questions[current];
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Text('Soalan ${current + 1} / ${questions.length}',
            style: const TextStyle(color: soft)),
        const SizedBox(height: 8),
        Text(q.text,
            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
        const SizedBox(height: 16),
        for (int i = 0; i < q.options.length; i++)
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(16),
                backgroundColor: picked == null
                    ? const Color(0xFF2A2A40)
                    : i == q.answer
                        ? Colors.green
                        : i == picked
                            ? Colors.red
                            : const Color(0xFF2A2A40),
              ),
              onPressed: () => choose(i),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(q.options[i], style: const TextStyle(fontSize: 16)),
              ),
            ),
          ),
        if (picked != null)
          ElevatedButton(
            onPressed: next,
            child: Text(current == questions.length - 1 ? 'Lihat Skor' : 'Seterusnya'),
          ),
      ],
    );
  }
}

// ---------- HUBUNGI ----------
class ContactTab extends StatelessWidget {
  const ContactTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: const [
        Text('Hubungi Kami',
            style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
        SizedBox(height: 16),
        ListTile(
          leading: Icon(Icons.location_on, color: soft),
          title: Text('Jabatan Multimedia'),
          subtitle: Text('Tukar kepada alamat sebenar anda'),
        ),
        ListTile(
          leading: Icon(Icons.email, color: soft),
          title: Text('multimedia@contoh.edu.my'),
        ),
        ListTile(
          leading: Icon(Icons.phone, color: soft),
          title: Text('03-1234 5678'),
        ),
        ListTile(
          leading: Icon(Icons.access_time, color: soft),
          title: Text('Isnin - Jumaat, 8.00 pagi - 5.00 petang'),
        ),
      ],
    );
  }
}
