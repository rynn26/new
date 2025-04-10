import 'package:flutter/material.dart';

class TitipOlehOlehPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5FBFA),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(150),
        child: AppBar(
          elevation: 0,
          backgroundColor: Color(0xFFDDF4F1),
          automaticallyImplyLeading: false,
          flexibleSpace: Padding(
            padding: const EdgeInsets.only(top: 40, left: 16, right: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(Icons.arrow_back, color: Colors.black),
                    SizedBox(width: 8),
                    Text(
                      "Titip Oleh Oleh",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    Spacer(),
                    Icon(Icons.receipt_long, color: Colors.black),
                  ],
                ),
                SizedBox(height: 10),
                Text(
                  "Ongkir mulai Rp.10rb!",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color: Colors.black,
                  ),
                ),
                Text(
                  "GrabJastip diskon s.d. 30rb",
                  style: TextStyle(color: Colors.black87),
                ),
              ],
            ),
          ),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)],
            ),
            child: Column(
              children: [
                locationRow(Icons.location_on, "Dekat Toko Oleh Oleh Raflesia N...", Colors.blue),
                Divider(),
                locationRow(Icons.location_on, "Antar ke?", Colors.red),
              ],
            ),
          ),
          SizedBox(height: 16),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: [
              shortcutButton("Stasiun Madiun"),
              shortcutButton("Terminal Tipe A"),
              shortcutButton("Terminal Tipe B"),
            ],
          ),
          SizedBox(height: 24),
          Text(
            "Jualan dengan GrabShop",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          Text("Cara gampang jualan online, bebas komisi!"),
          SizedBox(height: 12),
          Row(
            children: [
              Expanded(child: featureCard("Buat katalog", Icons.assignment, Colors.lightBlue.shade100)),
              SizedBox(width: 8),
              Expanded(child: featureCard("Panduan cepat", Icons.star, Colors.yellow.shade100)),
            ],
          ),
          SizedBox(height: 24),
          Text(
            "Intip juga",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          SizedBox(height: 12),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: [
              gridCard("Instant Hemat", "Dijemput <30 menit,\nsampai dalam 2 jam", Icons.percent, Colors.yellow.shade100),
              gridCard("GrabExpress Car", "Untuk kiriman besar", Icons.local_shipping, Colors.pink.shade100),
              gridCard("Reguler", "Untuk kiriman antar kota", Icons.move_to_inbox, Colors.blue.shade100),
              gridCard("Klub Juragan", "Dapatkan bonus usaha 1jt", Icons.emoji_events, Colors.orange.shade100),
              gridCard("GrabJastip", "Titip beli apa aja dari mana aja", Icons.delivery_dining, Colors.green.shade100),
              gridCard("Formulir Pengantaran", "Isi untuk detail pengiriman", Icons.assignment_outlined, Colors.brown.shade100),
            ],
          ),
        ],
      ),
    );
  }

  Widget locationRow(IconData icon, String text, Color iconColor) {
    return Row(
      children: [
        Icon(icon, color: iconColor),
        SizedBox(width: 10),
        Expanded(
          child: Text(
            text,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Icon(Icons.sync_alt),
      ],
    );
  }

  Widget shortcutButton(String label) {
    return Chip(
      backgroundColor: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      avatar: Icon(Icons.location_on, size: 18),
      label: Text(label),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: Colors.grey.shade300),
      ),
    );
  }

  Widget featureCard(String title, IconData icon, Color bgColor) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Icon(icon, size: 28),
          SizedBox(width: 10),
          Expanded(
            child: Text(
              title,
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
    );
  }

  Widget gridCard(String title, String desc, IconData icon, Color bgColor) {
    return Container(
      width: (MediaQueryData.fromWindow(WidgetsBinding.instance.window).size.width - 52) / 2,
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 32),
          SizedBox(height: 8),
          Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
          SizedBox(height: 4),
          Text(desc, style: TextStyle(fontSize: 12)),
        ],
      ),
    );
  }
}
