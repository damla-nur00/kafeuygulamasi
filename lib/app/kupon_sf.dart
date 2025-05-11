import 'package:flutter/material.dart';

class KuponAlmaSf extends StatefulWidget {
  const KuponAlmaSf({super.key});

  @override
  State<KuponAlmaSf> createState() => _KuponAlmaSfState();
}

class _KuponAlmaSfState extends State<KuponAlmaSf> {
  int selectedCouponIndex = -1;

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
            color: Color.fromARGB(255, 141, 107, 69),
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
                color: Color.fromARGB(217, 0, 0, 0),
              ),
            ),
            const SizedBox(height: 20),
            // Kupon seçim butonları
            Column(
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedCouponIndex = 0;
                    });
                  },
                  child: Container(
                    width: double.infinity,
                    height: 120,
                    decoration: BoxDecoration(
                      color:
                          selectedCouponIndex == 0
                              ? const Color.fromARGB(156, 81, 61, 42)
                              : const Color.fromARGB(255, 81, 61, 42),
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
                      selectedCouponIndex = 1;
                    });
                  },
                  child: Container(
                    width: double.infinity,
                    height: 120,
                    decoration: BoxDecoration(
                      color:
                          selectedCouponIndex == 1
                              ? const Color.fromARGB(156, 81, 61, 42)
                              : const Color.fromARGB(255, 81, 61, 42),
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
                      selectedCouponIndex = 2;
                    });
                  },
                  child: Container(
                    width: double.infinity,
                    height: 120,
                    decoration: BoxDecoration(
                      color:
                          selectedCouponIndex == 2
                              ? const Color.fromARGB(156, 81, 61, 42)
                              : const Color.fromARGB(255, 81, 61, 42),
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
                  Navigator.pop(context, selectedCouponIndex);
                }
              },
              child: const Text(
                "Seçilen Kuponu Onayla",
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
