import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: KontakMasukPage(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.teal,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
    );
  }
}

class KontakMasukPage extends StatefulWidget {
  @override
  _KontakMasukPageState createState() => _KontakMasukPageState();
}

class _KontakMasukPageState extends State<KontakMasukPage> {
  int _selectedIndex = 1;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Kotak Masuk', style: TextStyle(color: Colors.black)),
          backgroundColor: Colors.white,
          elevation: 0,
          actions: [
            IconButton(
              icon: Icon(Icons.delete_outline, color: Colors.grey[700]),
              onPressed: () {},
            ),
          ],
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(kToolbarHeight),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedIndex = 0;
                        });
                      },
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                        decoration: BoxDecoration(
                          color:
                              _selectedIndex == 0 ? Colors.teal : Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Colors.teal),
                        ),
                        child: Center(
                          child: Text(
                            'Chat',
                            style: TextStyle(
                              color: _selectedIndex == 0
                                  ? Colors.white
                                  : Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedIndex = 1;
                        });
                      },
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                        decoration: BoxDecoration(
                          color:
                              _selectedIndex == 1 ? Colors.teal : Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Colors.teal),
                        ),
                        child: Center(
                          child: Text(
                            'Notifikasi',
                            style: TextStyle(
                              color: _selectedIndex == 1
                                  ? Colors.white
                                  : Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        body: IndexedStack(
          index: _selectedIndex,
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/customservis.png',
                        width: 200, height: 200),
                    SizedBox(height: 24),
                    Text(
                      'Temukan chat kamu dengan staf layanan pelanggan kami di sini!',
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(height: 16),
                    Text(
                      'Kamu juga bisa mendapatkan bantuan dari mereka melalui Pusat Bantuan kami.',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                    ),
                  ],
                ),
              ),
            ),
            ListView.builder(
              itemCount: 6,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                  decoration: BoxDecoration(
                    color: Colors.blue[50],
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: NotificationItem(
                    title: [
                      'Keuntungan Tersembunyi Dari Family Account..',
                      'Nyaman sebelum perjalanan jauh',
                      'Dapatkan OVO Points tiap jalan!',
                      'Libur butuh cadangan dana?',
                      'Duel antara Man City dan Leicester',
                      'Tarif Grab Paling Hemat, Ke...',
                    ][index],
                    subtitle: [
                      'Bagikan Metode Pembayaran Sambil Tetap Mengontrol Pengeluaran.',
                      'Naik GrabCar, diskon s.d. Rp30rb',
                      'Naik Grab pakai OVO dapat cashback OV...',
                      'Ajuin PAS aja!',
                      'Iklan Vidio',
                      'Kami kangen kamu, nikmati perjalanan h...',
                    ][index],
                    time: [
                      '5:21 PM',
                      '3:05 PM',
                      '31 Mar',
                      '29 Mar',
                      '29 Mar',
                      '25 Mar'
                    ][index],
                    iconAsset: [
                      'assets/family.png',
                      'assets/pesanmasuk.png',
                      'assets/pesanmasuk.png',
                      'assets/pesanmasuk.png',
                      'assets/pesanmasuk.png',
                      'assets/pesanmasuk.png',
                    ][index],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class NotificationItem extends StatelessWidget {
  final String title;
  final String subtitle;
  final String time;
  final String iconAsset;

  NotificationItem({
    required this.title,
    required this.subtitle,
    required this.time,
    required this.iconAsset,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      child: ListTile(
        leading: Image.asset(iconAsset, width: 40, height: 40),
        title: Text(title, style: TextStyle(fontWeight: FontWeight.w500)),
        subtitle: Text(subtitle, style: TextStyle(color: Colors.grey[700])),
        trailing: Text(time, style: TextStyle(color: Colors.grey[600])),
      ),
    );
  }
}
