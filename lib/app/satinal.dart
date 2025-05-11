
import 'package:flutter/material.dart';


class Satinal extends StatefulWidget {
  @override
  _SatinalState createState() => _SatinalState();
}

class _SatinalState extends State<Satinal> {
  double toplamTutar = 210;
  double kuponIndirimi = 0;
  bool showCardNumber = false;

  double get guncelTutar => toplamTutar - kuponIndirimi;

 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color.fromARGB(255, 0, 0, 0)),
          onPressed: () {
            Navigator.pop(context); // Go back to the previous page
          },
        ),
        title: const Text(
          'THE Coffee',
          style: TextStyle(
            color: Color(0xFFF05454),
            fontSize: 32,
            fontWeight: FontWeight.bold,
            shadows: [
              Shadow(
                offset: Offset(0, 4),
                blurRadius: 4,
                color: Color.fromARGB(64, 255, 255, 255),
              ),
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Container(
              width: 393,
              padding: EdgeInsets.all(16),
              child: Column(
                children: [
                  SizedBox(height: 10),
                  Text(
                    'Ödeme Sayfası',
                    style: TextStyle(
                      color: const Color(0xFFF05454),
                      fontSize: 24,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: 30),
                  // Kart Üzerindeki İsim
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Kart Üzerindeki İsim Soyisim',
                      style: TextStyle(
                        color: Colors.black.withAlpha(178),
                        fontSize: 16,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.symmetric(horizontal: 12),
                    ),
                  ),
                  SizedBox(height: 20),

                  // Kart Numarası (gizli)
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Kart Numarası (16 Haneli)',
                      style: TextStyle(
                        color: Colors.black.withAlpha(178),
                        fontSize: 16,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  TextField(
                    obscureText: !showCardNumber,
                    maxLength: 16,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      counterText: "",
                      border: OutlineInputBorder(),
                      suffixIcon: IconButton(
                        icon: Icon(
                          showCardNumber
                              ? Icons.visibility_off
                              : Icons.visibility,
                        ),
                        onPressed: () {
                          setState(() {
                            showCardNumber = !showCardNumber;
                          });
                        },
                      ),
                      contentPadding: EdgeInsets.symmetric(horizontal: 12),
                    ),
                  ),
                  SizedBox(height: 20),

                  // Ay/Yıl ve Güvenlik No
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Ay/Yıl',
                              style: TextStyle(
                                color: Colors.black.withAlpha(171),
                                fontSize: 16,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            TextField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                contentPadding:
                                    EdgeInsets.symmetric(horizontal: 12),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Güvenlik No',
                              style: TextStyle(
                                color: Colors.black.withAlpha(171),
                                fontSize: 16,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            TextField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                contentPadding:
                                    EdgeInsets.symmetric(horizontal: 12),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 30),

             

                  // Güncel Tutar
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: 'Güncel Tutar',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            TextSpan(
                              text: ':',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w700,
                                letterSpacing: 5.40,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        '${guncelTutar.toStringAsFixed(0)} TL',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w900,
                          letterSpacing: 3.42,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 40),

                  // Öde Butonu
                  GestureDetector(
                    onTap: () {
                      // ödeme işlemi buraya
                    },
                    child: Container(
                      width: 172,
                      height: 56.71,
                      decoration: ShapeDecoration(
                        color: const Color(0xFFCC4E50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          'Öde',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: const Color(0xFFF6EDED),
                            fontSize: 20,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
