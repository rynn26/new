import 'package:flutter/material.dart';

class MakananPage extends StatefulWidget {
  @override
  _MakananPageState createState() => _MakananPageState();
}

class _MakananPageState extends State<MakananPage> {
  final PageController _bannerController = PageController();
  int _currentBanner = 0;

  final List<String> bannerImages = [
    'https://via.placeholder.com/400x180?text=Banner+1',
    'https://via.placeholder.com/400x180?text=Banner+2',
    'https://via.placeholder.com/400x180?text=Banner+3',
  ];

  final List<Map<String, String>> categories = [
    {'title': 'Aneka Nasi', 'image': 'https://via.placeholder.com/80'},
    {'title': 'Ayam', 'image': 'https://via.placeholder.com/80'},
    {'title': 'Asli\nIndonesia', 'image': 'https://via.placeholder.com/80'},
    {'title': 'Cemilan', 'image': 'https://via.placeholder.com/80'},
  ];

  final List<Map<String, dynamic>> promoCards = [
    {'title': 'Dekat Saya', 'desc': 'Dapatkan cepat', 'color': Colors.pink[100]},
    {'title': 'Diskon s/d 55%', 'desc': 'Diskon terbaik GrabFood', 'color': Colors.blue[100]},
    {'title': 'Resto Bintang 5', 'desc': 'Resto pilihan terbaik', 'color': Colors.orange[100]},
    {'title': 'GrabFood Mandiri 22rb', 'desc': 'Termasuk ongkir!', 'color': Colors.yellow[100]},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ListView(
          children: [
            _buildHeader(),
            _buildSearchBar(),
            _buildTabBar(),
            _buildCategories(),
            _buildPromoCards(),
            _buildBannerCarousel(),
            _buildPromoSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Icon(Icons.arrow_back),
          SizedBox(width: 8),
          Expanded(
            child: Text(
              'Dekat STKIP PGRI Sidoarjo',
              style: TextStyle(fontWeight: FontWeight.bold),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Icon(Icons.favorite_border),
          SizedBox(width: 8),
          Icon(Icons.receipt_long),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
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
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _tabOption('Pengantaran', true),
          _tabOption('Dine Out Deals', false),
          _tabOption('Pick-Up', false),
        ],
      ),
    );
  }

  Widget _tabOption(String label, bool isActive) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: isActive ? Colors.green[800] : Colors.grey[200],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: isActive ? Colors.white : Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildCategories() {
    return Container(
      height: 100,
      padding: EdgeInsets.symmetric(vertical: 8),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (_, index) {
          final item = categories[index];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Column(
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(item['image']!),
                  radius: 30,
                ),
                SizedBox(height: 4),
                Text(
                  item['title']!,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 12),
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
                Text(card['title'], style: TextStyle(fontWeight: FontWeight.bold)),
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
                  child: Image.network(
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
              Text('CUMA 3 HARI', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              Icon(Icons.chevron_right),
            ],
          ),
          SizedBox(height: 12),
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              'https://via.placeholder.com/400x200.png?text=Promo+Ngopi',
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
