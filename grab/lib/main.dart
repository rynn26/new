import 'package:flutter/material.dart';
import 'dineout.dart';
import 'aktivitas.dart';
import 'kontak_masuk.dart';
import 'profile.dart';
import 'motor.dart';
import 'mobil.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: HomeScreen());
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    HomePage(),
    AktivitasPage(),
    Center(child: Text("Pembayaran")),
    KontakMasukPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Beranda"),
          BottomNavigationBarItem(
            icon: Icon(Icons.receipt_long),
            label: "Aktivitas",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.attach_money),
            label: "Pembayaran",
          ),
          BottomNavigationBarItem(
            icon: Stack(
              children: [
                Icon(Icons.chat),
                Positioned(
                  top: 0,
                  right: 0,
                  child: Container(
                    width: 8,
                    height: 8,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ],
            ),
            label: "Kotak Masuk",
          ),
        ],
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          children: [
            Icon(Icons.qr_code_scanner, color: Colors.black),
            SizedBox(width: 10),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    Icon(Icons.search, color: Colors.grey),
                    SizedBox(width: 5),
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: "Cari makanan, tempat, dll...",
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        actions: [
          InkWell(
            //Tambahkan InkWell untuk membuat ikon bisa di tap
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          ProfilePage())); // Navigasi ke halaman profil
            },
            child: CircleAvatar(
              backgroundColor: Colors.green,
              child: Icon(Icons.person, color: Colors.white),
            ),
          ),
          SizedBox(width: 16),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20),
            GridView.count(
              crossAxisCount: 4,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              children: [
                _buildIcon(
                    "assets/dineout.png", "Dine Out", context, DineOutPage()),
                _buildIcon("assets/motor.png", "Motor", context, MotorPage()),
                _buildIcon("assets/mobil.png", "Mobil", context, MobilPage()),
                _buildIcon(
                    "assets/makanan.png", "Makanan", context, MakananPage()),
                _buildIcon(
                    "assets/belanja.png", "Belanja", context, BelanjaPage()),
                _buildIcon(
                    "assets/express.png", "Express", context, ExpressPage()),
                _buildIcon("assets/pulsa.png", "Pulsa & Listrik", context,
                    PulsaBillsPage()),
                _buildIcon("assets/semua.png", "Semua", context, null,
                    showBottomSheet: true), //Perubahan disini
              ],
            ),
            SizedBox(height: 10),
            _buildDiscountRow(),
            SizedBox(height: 20),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  _buildPaymentCard(
                      "Pembayaran", "Tambah kartu", Icons.credit_card),
                  _buildPaymentCard(
                      "Jalan ke", "Sidoarjo", Icons.directions_bike),
                  _buildPaymentCard(
                      "Promo", "Diskon spesial", Icons.local_offer),
                ],
              ),
            ),
            SizedBox(height: 20),
            _buildSectionTitle("Rekomendasi restoran untukmu"),
            SizedBox(height: 10),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  _buildRestaurantCard("Mie Gacoan Ponti", "4.0 km", 4.7,
                      "Diskon Rp15.000", "assets/gacoan.png"),
                  _buildRestaurantCard("MIXUE Gading Fajar", "1.7 km", 4.8,
                      "Diskon Rp10.000", "assets/mixue.jpg"),
                  _buildRestaurantCard("Pizaat hut", "3.1 km", 4.6,
                      "Diskon Rp20.000", "assets/sederhana.jpg"),
                  _buildRestaurantCard("KFC Larangan", "2.5 km", 4.5,
                      "Diskon Rp25.000", "assets/kfc.jpg"),
                ],
              ),
            ),
            SizedBox(height: 20),
            _buildSectionTitle("Pesan Makan Malam Dari"),
            SizedBox(height: 10),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  _buildRestaurantCard("Terang Bulan", "4.0 km", 4.7,
                      "Diskon Rp15.000", "assets/terangbulan.png"),
                  _buildRestaurantCard("Donat", "1.7 km", 4.8,
                      "Diskon Rp10.000", "assets/donat.jpg"),
                  _buildRestaurantCard("French fries", "3.1 km", 4.6,
                      "Diskon Rp20.000", "assets/kentang.jpg"),
                  _buildRestaurantCard("Ice Creem", "2.5 km", 4.5,
                      "Diskon Rp25.000", "assets/eskrim.jpg"),
                ],
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildIcon(
      String image, String label, BuildContext context, Widget? page,
      {bool showBottomSheet = false}) {
    return InkWell(
      onTap: () {
        if (showBottomSheet) {
          _showBottomSheetSemuaLayanan(context);
        } else if (page != null) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => page));
        }
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.green.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Image.asset(image, height: 40, width: 40),
          ),
          SizedBox(height: 5),
          Text(label, style: TextStyle(fontSize: 14)),
        ],
      ),
    );
  }

  void _showBottomSheetSemuaLayanan(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      isScrollControlled: true,
      builder: (context) {
        return Container(
          padding: EdgeInsets.all(20),
          height: 400,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  width: 40,
                  height: 5,
                  decoration: BoxDecoration(
                    color: Colors.grey[400],
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Text("Untukmu",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              _buildIconGrid([
                {'icon': 'assets/paket_diskon.jpg', 'label': 'Paket Diskon'},
                {'icon': 'assets/kesehatan.jpg', 'label': 'Kesehatan'},
                {'icon': 'assets/bank.jpg', 'label': 'Superbank'},
                {'icon': 'assets/sewa.jpg', 'label': 'Sewa'},
              ]),
              SizedBox(height: 15),
              Text("Jasa lainnya",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              Expanded(
                child: _buildIconGrid([
                  {'icon': 'assets/makanan.png', 'label': 'Makanan'},
                  {'icon': 'assets/motor.png', 'label': 'Motor'},
                  {'icon': 'assets/mobil.png', 'label': 'Mobil'},
                  {'icon': 'assets/express.png', 'label': 'Express'},
                  {'icon': 'assets/belanja.png', 'label': 'Belanja'},
                  {'icon': 'assets/pulsa.png', 'label': 'Pulsa & Bills'},
                  {'icon': 'assets/asuransi.jpg', 'label': 'Jastip'},
                  {'icon': 'assets/hadiah.jpg', 'label': 'Sewa'},
                ]),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildIconGrid(List<Map<String, dynamic>> items) {
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 1,
      ),
      itemCount: items.length,
      itemBuilder: (context, index) {
        return Column(
          children: [
            CircleAvatar(
              radius: 25,
              backgroundColor: Colors.green[100],
              child: Image.asset(items[index]['icon'], width: 35, height: 35),
            ),
            SizedBox(height: 5),
            Text(items[index]['label'],
                style: TextStyle(fontSize: 12), textAlign: TextAlign.center),
          ],
        );
      },
    );
  }

  Widget _buildDiscountRow() {
    return _buildSectionTitle("Promo Spesial");
  }

  Widget _buildPaymentCard(String title, String subtitle, IconData icon) {
    return Container(
      width: 160,
      margin: EdgeInsets.symmetric(horizontal: 8),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Icon(icon, color: Colors.green),
          SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: TextStyle(fontSize: 12, color: Colors.grey)),
              Text(
                subtitle,
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildRestaurantCard(String name, String distance, double rating,
      String discount, String imagePath) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8),
      width: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 5, spreadRadius: 2)
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
            child: Image.asset(imagePath,
                height: 120, width: double.infinity, fit: BoxFit.cover),
          ),
          Padding(
            padding: EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name,
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                SizedBox(height: 4),
                Text(distance, style: TextStyle(color: Colors.grey)),
                SizedBox(height: 4),
                Row(
                  children: [
                    Icon(Icons.star,
                        color: const Color.fromARGB(255, 209, 212, 14),
                        size: 16),
                    SizedBox(width: 4),
                    Text(rating.toString(),
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold)),
                  ],
                ),
                SizedBox(height: 4),
                Text(discount,
                    style: TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontWeight: FontWeight.bold)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSnackCard(String name, String price, String? imagePath) {
    String formattedName = name.toLowerCase().replaceAll(" ", "_");
    String finalImagePath = imagePath ?? "assets/images/$formattedName.jpg";
    return _buildCard(name, price, null, finalImagePath);
  }

  Widget _buildCard(
      String title, String subtitle, String? discount, String imagePath) {
    return Container(
      width: 160,
      margin: EdgeInsets.symmetric(horizontal: 8),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: [BoxShadow(color: Colors.grey.shade300, blurRadius: 5)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(imagePath,
                  width: 160, height: 100, fit: BoxFit.cover)),
          SizedBox(height: 5),
          Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
          Text(subtitle),
          if (discount != null)
            Text(discount,
                style: TextStyle(
                    color: const Color.fromARGB(255, 0, 0, 0),
                    fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(title,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
      ),
    );
  }
}

//... halaman lain seperti MakananPage, MotorPage, etc.
class MakananPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Makanan")),
      body: Center(child: Text("Halaman Makanan")),
    );
  }
}



class BelanjaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Belanja")),
      body: Center(child: Text("Halaman Belanja")),
    );
  }
}

class ExpressPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Express")),
      body: Center(child: Text("Halaman Express")),
    );
  }
}

class PulsaBillsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Pulsa & Bills")),
      body: Center(child: Text("Halaman Pulsa & Bills")),
    );
  }
}
