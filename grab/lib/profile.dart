import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool isDashboardActive = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {},
        ),
        backgroundColor: Colors.green[50],
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.green[50],
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage('assets/pp_.png'),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Muzaka Najih',
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 4),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            'Bergabung dengan GrabUnlimited',
                            style: TextStyle(fontSize: 12, color: Colors.black87),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 8),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      'Profil',
                      style: TextStyle(fontSize: 12),
                    ),
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isDashboardActive = true;
                      });
                    },
                    child: Column(
                      children: [
                        Text(
                          'Dasbor',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: isDashboardActive ? FontWeight.bold : FontWeight.normal,
                          ),
                        ),
                        if (isDashboardActive)
                          Container(
                            width: 50,
                            height: 2,
                            color: Colors.green,
                          ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isDashboardActive = false;
                      });
                    },
                    child: Column(
                      children: [
                        Text(
                          'Aktivitas',
                          style: TextStyle(
                            fontSize: 18,
                            color: isDashboardActive ? Colors.grey : Colors.black,
                          ),
                        ),
                        if (!isDashboardActive)
                          Container(
                            width: 50,
                            height: 2,
                            color: Colors.green,
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            if (isDashboardActive)
              buildDashboardContent()
            else
              buildActivityContent(),
          ],
        ),
      ),
    );
  }

  Widget buildDashboardContent() {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              buildFeatureCard('assets/keluarga.png'),
              buildFeatureCard('assets/bisnis.png'),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Text('Lebih banyak keuntungan', style: TextStyle(fontWeight: FontWeight.bold)),
        ),
        ListTile(
          leading: Icon(Icons.verified, color: Colors.green),
          title: Text('MEMBER'),
          trailing: Icon(Icons.chevron_right),
          onTap: () {},
        ),
        ListTile(
          title: Text('Langganan'),
          trailing: Icon(Icons.chevron_right),
          onTap: () {},
        ),
        ListTile(
          title: Text('Tantangan'),
          trailing: Icon(Icons.chevron_right),
          onTap: () {},
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Text('Umum', style: TextStyle(fontWeight: FontWeight.bold)),
        ),
        ListTile(
          title: Text('Favorit'),
          trailing: Icon(Icons.chevron_right),
          onTap: () {},
        ),
        ListTile(
          title: Text('Prefensi Diet'),
          trailing: Icon(Icons.chevron_right),
          onTap: () {},
        ),
        ListTile(
          title: Text('Metode Pembayaran'),
          trailing: Icon(Icons.chevron_right),
          onTap: () {},
        ),
        ListTile(
          title: Text('Pengaturan'),
          trailing: Icon(Icons.chevron_right),
          onTap: () {},
        ),
        ListTile(
          title: Text('Pengaturan Keamanan'),
          trailing: Icon(Icons.chevron_right),
          onTap: () {},
        ),
        ListTile(
          title: Text('Bahasa'),
          trailing: Icon(Icons.chevron_right),
          onTap: () {},
        ),
        ListTile(
          title: Text('Alamat Tersimpan'),
          trailing: Icon(Icons.chevron_right),
          onTap: () {},
        ),
      ],
    );
  }

  Widget buildActivityContent() {
    return Column(
      children: [
        Image.asset(
          'assets/papper.aktivitas.png',
          width: 240,
        ),
        Padding(
          padding: EdgeInsets.only(top: 20, left: 16, right: 16),
          child: Text(
            'Layanan yang digunakan di 30 hari terakhir akan muncul di sini',
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 10, left: 16, right: 16),
          child: Text(
            'Pergi ke aktivitas sebelumnya untuk menemukan yang lebih lama dari itu.',
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(height: 20),
        TextButton(
          onPressed: () {},
          child: Text(
            'Buka aktivitas sebelumnya',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
          ),
        ),
      ],
    );
  }

  Widget buildFeatureCard(String imagePath) {
    return Container(
      width: (MediaQuery.of(context).size.width - 48) / 2,
      height: 100,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Image.asset(
            imagePath,
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}