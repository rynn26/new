import 'package:flutter/material.dart';

class PulsaBillsPage extends StatelessWidget {
  const PulsaBillsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: const BackButton(color: Colors.black),
        title: const Text(
          'Pulsa/Bills',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search bar
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const TextField(
                decoration: InputDecoration(
                  icon: Icon(Icons.search),
                  hintText: 'Cari top up atau biller',
                  border: InputBorder.none,
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Banner
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(
                'assets/banner1.png', // Ganti dengan banner milikmu
                height: 140,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 16),

            // Bisa minta bayarin
            const Text(
              'Bisa minta bayarin tagihan',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            const Text('Coba Fitur Bayarin untuk minta bayarin tagihan'),
            const SizedBox(height: 16),

            // Promo dan transaksi
            Row(
              children: [
                Expanded(
                  child: _infoCard(
                    color: const Color(0xFFD9F2FF),
                    icon: Icons.discount_outlined,
                    title: 'Cek promo menarik',
                    subtitle: '2 rewards tersedia!',
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _infoCard(
                    color: const Color(0xFFFFF4C5),
                    icon: Icons.receipt_long_rounded,
                    title: 'Daftar transaksi',
                    subtitle: 'Cek transaksi kamu',
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),

            const Text(
              'Top-Up',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),

            Wrap(
              spacing: 24,
              runSpacing: 24,
              children: [
                _topUpItem('E-Money', 'assets/emoney.png'),
                _topUpItem('Pulsa dan\nPaket Data', 'assets/pulsa_paket.png'),
                _topUpItem('Token Listrik', 'assets/token.png'),
                _topUpItem('Game\nTop-Up', 'assets/game.png'),
                _topUpItem('TSEL Hemat\nLengkap', 'assets/tsel.png'),
                _topUpItem('Donasi', 'assets/donasi.png'),

              ],
            ),
            const SizedBox(height: 24),

            const Text(
              'Tagihan',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  Widget _infoCard({
    required Color color,
    required IconData icon,
    required String title,
    required String subtitle,
  }) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Icon(icon, color: Colors.orange, size: 30),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: const TextStyle(
                        fontSize: 13, fontWeight: FontWeight.bold)),
                const SizedBox(height: 2),
                Text(subtitle,
                    style: const TextStyle(fontSize: 12, color: Colors.black54)),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _topUpItem(String label, String iconPath) {
    return SizedBox(
      width: 72,
      child: Column(
        children: [
          CircleAvatar(
            backgroundColor: const Color(0xFFE6F7EC),
            radius: 28,
            backgroundImage: AssetImage(iconPath),
          ),
          const SizedBox(height: 6),
          Text(
            label,
            style: const TextStyle(fontSize: 12),
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
