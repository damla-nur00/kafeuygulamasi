//kupon_sf.dart
import 'package:flutter/material.dart';


class KuponAlmaSf extends StatefulWidget {
  const KuponAlmaSf({super.key});

  @override
  State<KuponAlmaSf> createState() => _KuponAlmaSfState();
}

class _KuponAlmaSfState extends State<KuponAlmaSf> {
  int selectedCouponIndex = -1; // -1 means no coupon selected

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 241, 240, 235),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'THE Coffee',
          style: TextStyle(
            color: Color(0xFFF05454),
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Oyunlardan Kazandığın Puanlar: 500',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 20),
            // Coupon selection buttons
            Column(
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedCouponIndex = 0; // Select the first coupon
                    });
                  },
                  child: Container(
                    width: double.infinity,
                    height: 120,
                    decoration: BoxDecoration(
                      color: selectedCouponIndex == 0
                          ? const Color(0xFFE16076) // Selected color
                          : const Color(0xFFF05454), // Default color
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        '20 TL İNDİRİM KUPONU\n2000 Puan',
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedCouponIndex = 1; // Select the second coupon
                    });
                  },
                  child: Container(
                    width: double.infinity,
                    height: 120,
                    decoration: BoxDecoration(
                      color: selectedCouponIndex == 1
                          ? const Color(0xFFE16076) // Selected color
                          : const Color(0xFFF05454), // Default color
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        '10 TL İNDİRİM KUPONU\n1000 Puan',
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedCouponIndex = 2; // Select the third coupon
                    });
                  },
                  child: Container(
                    width: double.infinity,
                    height: 120,
                    decoration: BoxDecoration(
                      color: selectedCouponIndex == 2
                          ? const Color(0xFFE16076) // Selected color
                          : const Color(0xFFF05454), // Default color
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        '40 TL İNDİRİM KUPONU\n3000 Puan',
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (selectedCouponIndex != -1) {
                  Navigator.pop(context, selectedCouponIndex); // Pass the selected coupon index back
                }
              },
              child: const Text("Seçilen Kuponu Onayla"),
            )
          ],
        ),
      ),
    );
  }
}
