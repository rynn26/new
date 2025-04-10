import 'package:flutter/material.dart';

class MakananPage extends StatefulWidget {
  @override
  _MakananPageState createState() => _MakananPageState();
}

class _MakananPageState extends State<MakananPage> {
  final PageController _bannerController = PageController();
  int _currentBanner = 0;

  final List<String> bannerImages = [
    'assets/makanan_roti.jpg',
    'assets/makanan_pizza.jpg',
  ];

  final List<Map<String, String>> categories = [
    {'title': 'Aneka Nasi', 'image': 'assets/gudeg.jpg'},
    {'title': 'Ayam', 'image': 'assets/gudeg.jpg'},
    {'title': 'kentang', 'image': 'assets/kentang.jpg'},
    {'title': 'sate', 'image': 'assets/sate.jpg'},
    {'title': 'pizza', 'image': 'assets/pizza.jpg'},
    {'title': 'nasipadang', 'image': 'assets/nasi_padang.jpg'},
    {'title': 'nasi_kabuli', 'image': 'assets/nasi_kabuli.jpg'},
    {'title': 'martabak', 'image': 'assets/martabak.jpg'},
  ];

  final List<Map<String, dynamic>> promoCards = [
    {
      'title': 'Dekat Saya',
      'desc': 'Dapatkan cepat',
      'color': Colors.pink[100],
      'icon': Icons.location_on,
    },
    {
      'title': 'Diskon s/d 55%',
      'desc': 'Diskon terbaik GrabFood',
      'color': Colors.blue[100],
      'icon': Icons.percent,
    },
    {
      'title': 'Resto Bintang 5',
      'desc': 'Resto pilihan dengan ulasan terbaik',
      'color': Colors.orange[100],
      'icon': Icons.star,
    },
    {
      'title': 'GrabFood Mandiri 22rb',
      'desc': 'Makan sendiri, termasuk ongkir!',
      'color': Colors.yellow[100],
      'icon': Icons.delivery_dining,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea( // Bungkus seluruh body dengan SafeArea
        child: Column(
          children: [
            _buildHeader(context),
            Expanded(
              child: ListView(
                children: [
                  _buildSearchBar(),
                  _buildTabBar(),
                  _buildCategories(),
                  _buildPromoCards(),
                  _buildBannerCarousel(),
                  _buildPromoSection(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF00C59A), Color(0xFF00C5A1)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Row(
        children: [
          InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back, color: Colors.white),
          ),
          SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('ANTAR KE', style: TextStyle(color: Colors.white, fontSize: 12)),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Dekat STKIP PGRI Sidoarjo',
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Icon(Icons.keyboard_arrow_down, color: Colors.white),
                  ],
                ),
              ],
            ),
          ),
          Icon(Icons.favorite_border, color: Colors.white),
          SizedBox(width: 8),
          Icon(Icons.receipt_long, color: Colors.white),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Kamu pesan apa nih?',
          prefixIcon: Icon(Icons.search),
          filled: true,
          fillColor: Colors.grey[200],
          contentPadding: EdgeInsets.symmetric(vertical: 8),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }

Widget _buildTabBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            _tabItem(Icons.delivery_dining, 'Pengantaran', true, () {
              // Aksi yang akan dijalankan ketika tab 'Pengantaran' diklik
              print('Tab Pengantaran diklik');
            }),
            SizedBox(width: 8),
            _tabItem(Icons.restaurant, 'Dine Out Deals', false, () {
              // Aksi yang akan dijalankan ketika tab 'Dine Out Deals' diklik
              print('Tab Dine Out Deals diklik');
            }),
            SizedBox(width: 8),
            _tabItem(Icons.storefront, 'Pick-Up', false, () {
              // Aksi yang akan dijalankan ketika tab 'Pick-Up' diklik
              print('Tab Pick-Up diklik');
            }),
            // Anda bisa menambahkan tab-tab lain di sini
          ],
        ),
      ),
    );
  }

  Widget _tabItem(IconData icon, String label, bool isActive, VoidCallback onTap) {
    return InkWell( // Bungkus Container dengan InkWell agar bisa diklik
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: isActive ? Colors.green[800] : Colors.grey[200],
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            Icon(icon, color: isActive ? Colors.white : Colors.black, size: 16),
            SizedBox(width: 4),
            Text(
              label,
              style: TextStyle(
                color: isActive ? Colors.white : Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategories() {
    return Container(
      height: 110,
      padding: EdgeInsets.symmetric(vertical: 8),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (_, index) {
          final item = categories[index];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage(item['image']!),
                  radius: 28,
                  backgroundColor: Colors.grey[200],
                ),
                SizedBox(height: 6),
                SizedBox(
                  width: 64,
                  child: Text(
                    item['title']!,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 12,
                      height: 1.2,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildPromoCards() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Wrap(
        spacing: 10,
        runSpacing: 10,
        children: promoCards.map((card) {
          return Container(
            width: (MediaQuery.of(context).size.width - 52) / 2,
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: card['color'],
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(card['icon'], size: 20),
                    SizedBox(width: 6),
                    Expanded(
                      child: Text(card['title'], style: TextStyle(fontWeight: FontWeight.bold)),
                    ),
                  ],
                ),
                SizedBox(height: 4),
                Text(card['desc']),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildBannerCarousel() {
    return Column(
      children: [
        Container(
          height: 180,
          child: PageView.builder(
            controller: _bannerController,
            itemCount: bannerImages.length,
            onPageChanged: (index) {
              setState(() {
                _currentBanner = index;
              });
            },
            itemBuilder: (_, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    bannerImages[index],
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                ),
              );
            },
          ),
        ),
        SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            bannerImages.length,
            (index) => Container(
              margin: EdgeInsets.symmetric(horizontal: 4),
              width: _currentBanner == index ? 12 : 8,
              height: 8,
              decoration: BoxDecoration(
                color: _currentBanner == index ? Colors.green : Colors.grey,
                borderRadius: BorderRadius.circular(4),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPromoSection() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text('CUMA 3 HARI',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              Icon(Icons.chevron_right),
            ],
          ),
          SizedBox(height: 12),
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              'assets/makanan_pizza.jpg',
              fit: BoxFit.cover,
              width: double.infinity,
            ),
          ),
          SizedBox(height: 8),
          Text('Spesial Diskon Ngopi di Resto s.d. 27%'),
        ],
      ),
    );
  }
}