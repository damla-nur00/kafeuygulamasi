//Hosgeldin.dart
import 'package:flutter/material.dart';

class Girissonrasikuponlu extends StatelessWidget {
  final Map user;
  const Girissonrasikuponlu({super.key, required this.user});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            // Ana içerik
            SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  const SizedBox(height: 40),
                  Text(
                    'THE Coffee',
                    style: TextStyle(
                      color: const Color(0xFFF05454),
                      fontSize: 25,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                      shadows: [
                        Shadow(
                          offset: Offset(0, 4),
                          blurRadius: 4,
                          color: Color(0xFF000000).withOpacity(0.25),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 30),
                  Text(
                    'Hoş Geldin İsim Soyisim!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: const Color(0xB28B2495),
                      fontSize: 32,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                      letterSpacing: 0.5,
                    ),
                  ),
                  const SizedBox(height: 60),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => KuponSayfasi()),
                      );
                    },
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      decoration: BoxDecoration(
                        color: const Color(0xB28B2495),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Center(
                        child: Text(
                          'Kuponlarım',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),
                  Text(
                    'Oyunlardan kazandığın puanları yukarıdaki sekmeden kuponlara çevirip ödeme aşamasında kullanabilirsin. Şimdiden afiyet olsun!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                      height: 1.6,
                    ),
                  ),
                  const SizedBox(height: 160), // Alt menüye yer bırak
                ],
              ),
            ),

            // Yuvarlak buton
            Positioned(
              bottom: 60,
              left: MediaQuery.of(context).size.width / 2 - 43.5,
              child: Container(
                width: 87,
                height: 83,
                decoration: BoxDecoration(
                  color: const Color(0xFFCC4E50),
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Center(
                  child: Icon(Icons.local_cafe, color: Colors.white, size: 40),
                ),
              ),
            ),

            // Alt menü barı
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                height: 75,
                decoration: BoxDecoration(
                  color: const Color(0xB28B2495),
                  borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Icon(Icons.home, color: Colors.white, size: 30),
                      Icon(Icons.search, color: Colors.white, size: 30),
                      SizedBox(width: 30), // Ortadaki yuvarlak için boşluk
                      Icon(Icons.card_giftcard, color: Colors.white, size: 30),
                      Icon(Icons.person, color: Colors.white, size: 30),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class KuponSayfasi extends StatelessWidget {
  const KuponSayfasi({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kuponlarım'),
        backgroundColor: const Color(0xFFCC4E50),
      ),
      body: Center(
        child: Text(
          'Burada kuponlar listelenecek',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
