import 'package:flutter/material.dart';

class DineOutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 1;

  final List<IconData> icons = [
    Icons.pedal_bike,
    Icons.restaurant,
    Icons.shopping_bag,
  ];

  final List<String> labels = [
    "Pengantaran",
    "Dine Out Deals",
    "Pickup",
  ];

  final List<Map<String, dynamic>> promoDeals = [
    {"image": "assets/bangkok_crab.jpg", "label": "Bangkok Crab!"},
    {"image": "assets/caffe_bromo.jpg", "label": "Caffe Sheraton!"},
    {"image": "assets/gudeg.jpg", "label": "Gudeg Jogja!"},
    {"image": "assets/ramadhan.jpg", "label": "Ramdhan Special!"},
    {"image": "assets/lontong_kupang.jpg", "label": "Lontong Kupang!"},
    {"image": "assets/martabak.jpg", "label": "Martabak Inggris"},
    {"image": "assets/nasi_gor.jpg", "label": "Nasi Goreng"},
    {"image": "assets/mixue_deal.jpg", "label": "Mixue"},
    {"image": "assets/sate_lilit.jpg", "label": "Sate Lilit Bali!"},
    {"image": "assets/nasi_kabuli.jpg", "label": "Nasi Kabuli!"},
    {"image": "assets/nasi_padang.jpg", "label": "Nasi Padang!"},
    {"image": "assets/nasi_pecel.jpg", "label": "Nasi Pecel!"},
    {"image": "assets/pizza.jpg", "label": "Pizza Hut!"},
    {"image": "assets/rawon.jpg", "label": "Rawon Surabaya"},
    {"image": "assets/soto_banjar.jpg", "label": "Soto Banjar"},
    {"image": "assets/sate.jpg", "label": "Sate Madura"},
    {
      "image": "assets/ricis.webp",
      "nama": "Reaches Factory Sidoarjo",
      "rating": 4.9,
      "jumlah_rating": 318,
      "jarak": "0.3 km",
      "harga": " Mulai 20.000",
    },
    {
      "image": "assets/mcd.jpg",
      "nama": "McDonald'S Indonesia",
      "rating": 4.6,
      "jumlah_rating": 240,
      "jarak": "0.4 km",
      "harga": "Mulai 15.000",
    },
    {
      "image": "assets/res_gacoan.jpg",
      "nama": "Mie Gacoan",
      "rating": 4.6,
      "jumlah_rating": 240,
      "jarak": "0.4 km",
      "harga": "Mulai 9.000",
    },
  ];

  Widget buildMenuItem(BuildContext context, Map<String, dynamic> item) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.45,
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(10)),
            child: Image.asset(item["image"],
                width: double.infinity, height: 120, fit: BoxFit.cover),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(item["nama"] ?? item["label"] ?? '',
                    style: const TextStyle(fontWeight: FontWeight.bold)),
                if (item["rating"] != null)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.star, color: Colors.amber, size: 16),
                          Text("${item["rating"]} (${item["jumlah_rating"]})"),
                        ],
                      ),
                      Text("${item["jarak"]} ${item["harga"]}"),
                    ],
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> filteredPromoDeals = promoDeals
        .where((item) => item["nama"] == null)
        .toList();

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      colors: [Color(0xFF60C3C0), Color(0xFF50C0E4)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight)),
              child: SafeArea(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(children: [
                      IconButton(
                          icon: const Icon(Icons.arrow_back,
                              color: Colors.white),
                          onPressed: () {
                            Navigator.pop(context); // Go back to DashboardPage
                          }),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("MAKAN DI",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w300)),
                          Row(children: [
                            const Text("Optik Kutuk Barat",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold)),
                            const SizedBox(width: 4),
                            const Icon(Icons.keyboard_arrow_down,
                                color: Colors.white),
                          ]),
                        ],
                      ),
                    ]),
                    Row(children: [
                      IconButton(
                          icon: const Icon(Icons.favorite_border,
                              color: Colors.white),
                          onPressed: () {}),
                      IconButton(
                          icon: const Icon(Icons.receipt_long,
                              color: Colors.white),
                          onPressed: () {}),
                    ]),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: TextField(
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: "What's for dining?",
                      prefixIcon: const Icon(Icons.search),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none))),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(3, (index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: ChoiceChip(
                        label: Row(mainAxisSize: MainAxisSize.min, children: [
                          Icon(icons[index],
                              size: 18,
                              color: selectedIndex == index
                                  ? Colors.white
                                  : Colors.black),
                          const SizedBox(width: 5),
                          Text(labels[index],
                              style: TextStyle(
                                  color: selectedIndex == index
                                      ? Colors.white
                                      : Colors.black,
                                  fontWeight: FontWeight.bold))
                        ]),
                        selected: selectedIndex == index,
                        selectedColor: Colors.teal[900],
                        backgroundColor: Colors.teal[50],
                        onSelected: (bool selected) {
                          setState(() {
                            selectedIndex = index;
                          });
                        },
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 10),
                      ),
                    );
                  }),
                ),
              ),
            ),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 4,
                  childAspectRatio: 0.8),
              itemCount: filteredPromoDeals.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white, width: 2),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black12,
                                blurRadius: 4,
                                offset: Offset(0, 2))
                          ]),
                      child: ClipOval(
                          child: Image.asset(filteredPromoDeals[index]["image"]!,
                              fit: BoxFit.cover)),
                    ),
                    const SizedBox(height: 4),
                    Text(filteredPromoDeals[index]["label"]!,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            fontSize: 10, fontWeight: FontWeight.bold)),
                  ],
                );
              },
            ),
            SizedBox(
              height: 260,
              child: Padding(
                padding: const EdgeInsets.only(top: 0),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: promoDeals.length,
                  itemBuilder: (context, index) {
                    if (promoDeals[index]["nama"] != null) {
                      return buildMenuItem(context, promoDeals[index]);
                    } else {
                      return const SizedBox.shrink();
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}