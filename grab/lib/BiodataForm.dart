import 'package:flutter/material.dart';

class BiodataForm extends StatefulWidget {
  @override
  _BiodataFormState createState() => _BiodataFormState();
}

class _BiodataFormState extends State<BiodataForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(120),
        child: AppBar(
          automaticallyImplyLeading: false,
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF44C7BC), Color(0xFF6ED2D1)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.arrow_back, color: Colors.white),
                        SizedBox(width: 8),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('ANTAR KE', style: TextStyle(color: Colors.white, fontSize: 12)),
                            Text(
                              'Dekat Toko Oleh Oleh Raf...',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14),
                            ),
                          ],
                        ),
                        Spacer(),
                        Icon(Icons.favorite_border, color: Colors.white),
                        SizedBox(width: 12),
                        Icon(Icons.receipt_long, color: Colors.white),
                      ],
                    ),
                    SizedBox(height: 12),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.search, color: Colors.grey),
                          SizedBox(width: 8),
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: "GrabMart",
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          Text(
            "Cus, Belanja",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: promoBox("assets/promo_bank.jpg"),
              ),
              SizedBox(width: 8),
              Expanded(
                child: promoBox('assets/promo_a.jpg'),
              ),
            ],
          ),
          SizedBox(height: 8),
          Text("Gunakan promo Bank Biar Makin Hemat"),
          SizedBox(height: 32),
          Center(
            child: Text(
              "Wah, kamu udah scroll sampai ke paling bawah.\nCoba persempit pencarianmu yuk.",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey[700]),
            ),
          )
        ],
      ),
    );
  }

  Widget promoBox(String assetPath) {
    return Container(
      height: 140,
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(12),
        image: DecorationImage(
          image: AssetImage(assetPath),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
