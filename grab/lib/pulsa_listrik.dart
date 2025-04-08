import 'package:flutter/material.dart';

class PulsaBillsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pulsa/Bills'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Search Bar
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: TextField(
                  decoration: InputDecoration(
                    icon: Icon(Icons.search),
                    hintText: "Cari top up atau biller",
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
            SizedBox(height: 16),

            // Banner Promo
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  'assets/banner1.png', // <- Ganti dengan banner kamu
                  height: 150,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 16),

            // Bisa minta bayarin
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Bisa minta bayarin tagihan",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  SizedBox(height: 4),
                  Text("Coba Fitur Bayarin untuk minta bayarin tagihan"),
                ],
              ),
            ),
            SizedBox(height: 16),

            // Promo dan Transaksi box
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Expanded(
                    child: _featureBox(
                      color: Colors.lightBlue.shade100,
                      icon: Icons.local_offer,
                      title: "Cek promo menarik",
                      subtitle: "2 rewards tersedia!",
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: _featureBox(
                      color: Colors.yellow.shade100,
                      icon: Icons.receipt_long,
                      title: "Daftar transaksi",
                      subtitle: "Cek transaksi kamu",
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),

            // Top-Up
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text("Top-Up",
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              ),
            ),
            SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Wrap(
                spacing: 24,
                runSpacing: 24,
                children: [
                  _topUpItem("E-Money", Icons.wifi),
                  _topUpItem("Pulsa dan\nPaket Data", Icons.phone_android),
                  _topUpItem("Token Listrik", Icons.electric_bolt),
                  _topUpItem("Game\nTop-Up", Icons.videogame_asset),
                  _topUpItem("TSEL Hemat", Icons.sim_card),
                  _topUpItem("Donasi", Icons.favorite),
                ],
              ),
            ),
            SizedBox(height: 24),

            // Tagihan (optional, bisa kamu lanjutkan)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text("Tagihan",
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              ),
            ),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  Widget _featureBox({
    required Color color,
    required IconData icon,
    required String title,
    required String subtitle,
  }) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Icon(icon, size: 28),
          SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
                Text(subtitle, style: TextStyle(fontSize: 12)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _topUpItem(String label, IconData icon) {
    return SizedBox(
      width: 80,
      child: Column(
        children: [
          CircleAvatar(
            backgroundColor: Colors.green.shade100,
            radius: 28,
            child: Icon(icon, size: 28, color: Colors.green),
          ),
          SizedBox(height: 6),
          Text(
            label,
            style: TextStyle(fontSize: 12),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
