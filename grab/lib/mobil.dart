import 'package:flutter/material.dart';

class MobilPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[50],
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 180,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.green[100],
              ),
              child: Stack(
                children: [
                  Positioned(
                    top: 40,
                    left: 16,
                    child: Row(
                      children: [
                        InkWell( // Wrap the Icon with InkWell for tap detection
                          onTap: () {
                            Navigator.pop(context); // Navigate back
                          },
                          child: Icon(Icons.arrow_back, color: Colors.black),
                        ),
                        SizedBox(width: 8),
                        Text(
                          "Transportasi",
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 75,
                    left: 16,
                    child: Text(
                      "Ke mana pun kamu mau pergi, ayo kita ke sana!",
                      style: TextStyle(fontSize: 14),
                    ),
                  ),
                  Positioned(
                    top: 40,
                    right: 16,
                    child: ElevatedButton.icon(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        elevation: 0,
                      ),
                      icon: Icon(Icons.map, size: 18),
                      label: Text("Peta"),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Image.asset(
                      "assets/uhuy.png",
                      height: 90,
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 2,
                          blurRadius: 5,
                        )
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.location_on, color: Colors.red),
                            SizedBox(width: 8),
                            Text("Mau ke mana?", style: TextStyle(fontSize: 16)),
                          ],
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                          decoration: BoxDecoration(
                            color: Colors.green[100],
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(
                            children: [
                              Text("Sekarang", style: TextStyle(color: Colors.black87)),
                              Icon(Icons.arrow_drop_down, color: Colors.grey),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 16),
                  LocationList(),
                  SizedBox(height: 16),
                  Text("Perjalanan untuk setiap kebutuhanmu", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  SizedBox(height: 8),
                  TransportOptions(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LocationList extends StatelessWidget {
  final List<Map<String, String>> locations = [
    {
      "title": "Stasiun Sidoarjo",
      "subtitle": "Jl. Stasiun, Lemahputro, Sidoarjo, Sidoarjo, Jawa Timur",
    },
    {
      "title": "Halte Pondok Mutiara",
      "subtitle": "Jl. Pahlawan, Jati, Sidoarjo, Sidoarjo, Jawa Timur",
    },
    {
      "title": "Lippo Plaza Sidoarjo",
      "subtitle": "Jl. Raya No. 1, Jati, Sidoarjo, Sidoarjo, Jawa Timur",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: locations.map((loc) => ListTile(
        leading: Container(
          width: 36,
          height: 36,
          decoration: BoxDecoration(
            color: Colors.green[100],
            shape: BoxShape.circle,
          ),
          child: Icon(Icons.place, color: Colors.green[900]),
        ),
        title: Text(loc["title"]!, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
        subtitle: Text(loc["subtitle"]!),
      )).toList(),
    );
  }
}

class TransportOptions extends StatelessWidget {
  final List<Map<String, dynamic>> options = [
    {"title": "Jadwalkan dulu", "color": Colors.lightBlue[100], "image": "assets/jadwall.png"},
    {"title": "Motor XL", "color": Colors.lightGreen[300], "image": "assets/motorr.png"},
    {"title": "Sewa Mobil", "color": Colors.orange[200], "image": "assets/sewamobill.png"},
    {"title": "Mobil 6 kursi", "color": Colors.yellow[200], "image": "assets/mobill.png"},
    {"title": "Jemputan Airport", "color": Colors.lightBlue[200], "image": "assets/jemputann.png"},
  ];

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 10,
      runSpacing: 10,
      children: options.map((option) {
        return Container(
          width: 160.0,
          height: 90.0,
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: option["color"],
            borderRadius: BorderRadius.circular(12),
          ),
          child: Stack(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  option["title"],
                  style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold),
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Image.asset(option["image"], height: 32),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}