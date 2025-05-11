import 'package:flutter/material.dart';
import 'cartdata.dart';
import 'kupon_sf.dart';

class Sepetimsf extends StatefulWidget {
  const Sepetimsf({super.key});

  @override
  State<Sepetimsf> createState() => _SepetimsfState();
}

class _SepetimsfState extends State<Sepetimsf> {
  int? selectedCouponIndex; 

  // Sepet öğelerinin toplam sayısını hesaplamak
  int get totalItems =>
      CartData.items.fold(0, (sum, item) => (sum + item.count).toInt());

  // Sepet öğelerinin toplam fiyatını hesaplamak
  double get totalPrice {
    double sum = 0.0;
    for (var item in CartData.items) {
      final unitPrice = double.tryParse(item.price) ?? 0.0;
      sum += (unitPrice * item.count);
    }

    // Kupon indirimi ekleniyor
    if (selectedCouponIndex == 0) {
      sum -= 20; // 20 TL indirim
    } else if (selectedCouponIndex == 1) {
      sum -= 10; // 10 TL indirim
    } else if (selectedCouponIndex == 2) {
      sum -= 40; // 40 TL indirim
    }

    return sum > 0 ? sum : 0.0; // Fiyat negatif olmasın diye kontrol
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 40.0, left: 16.0),
            child: Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back,color:Colors.black),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                const Text(
                  'Sepetim',
                  style: TextStyle(
                    fontSize: 18,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w700,
                    color: Color.fromARGB(255, 120, 90, 61),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              buttonBox('Kuponlarım', Colors.white, const Color.fromARGB(255, 0, 0, 0), () async {
                final selectedCoupon = await Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => KuponAlmaSf()),
                );
                if (selectedCoupon != null) {
                  setState(() {
                    selectedCouponIndex = selectedCoupon;
                  });
                }
              }),
            ],
          ),
          const SizedBox(height: 20),
          if (selectedCouponIndex != null)
            Text(
              'Seçilen Kupon: ${selectedCouponIndex == 0
                  ? "20 TL İndirim"
                  : selectedCouponIndex == 1
                  ? "10 TL İndirim"
                  : "40 TL İndirim"}',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          const SizedBox(height: 20),
          Expanded(
            child: ListView.builder(
              itemCount: CartData.items.length,
              itemBuilder: (context, index) {
                final item = CartData.items[index];
                final unitPrice =
                    double.tryParse(item.price) ?? 0.0; 
                return Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 10,
                  ),
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: const Color(0xFFD9D9D9),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset(
                          item.imagePath,
                          width: 89,
                          height: 89,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item.name,
                              style: const TextStyle(
                                fontSize: 18,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w700,
                                color: Color(0xFF2C0909),
                              ),
                            ),
                            Text(
                              'Boyut: ${item.size}', // Boyut burada gösteriliyor
                              style: const TextStyle(
                                fontSize: 14,
                                fontFamily: 'Poppins',
                                color: Color(0xFF2C0909),
                              ),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              '${(unitPrice * item.count).toStringAsFixed(2)} TL', // Güncellenmiş fiyatı burada gösteriyoruz
                              style: const TextStyle(
                                fontSize: 15,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w700,
                                color: Color(0xFF2C0909),
                              ),
                            ),
                            const SizedBox(height: 5),
                            Row(
                              children: [
                                iconButton('-', () {
                                  if (item.count > 1) {
                                    setState(() => item.count--);
                                  }
                                }),
                                const SizedBox(width: 10),
                                Text(
                                  '${item.count}',
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w700,
                                    color: Color.fromARGB(255, 199, 171, 153),
                                  ),
                                ),
                                const SizedBox(width: 10),
                                iconButton('+', () {
                                  setState(() => item.count++);
                                }),
                              ],
                            ),
                          ],
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.delete, color: Color.fromARGB(255, 0, 0, 0)),
                        onPressed: () {
                          setState(() {
                            CartData.items.removeAt(index);
                          });
                        },
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 206, 203, 203),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.black12),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Ürün Sayısı: $totalItems',
                    style: const TextStyle(
                      fontSize: 16,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF2C0909),
                    ),
                  ),
                  Text(
                    'Toplam: ${totalPrice.toStringAsFixed(2)} TL', // Burada toplam fiyatı gösteriyoruz
                    style: const TextStyle(
                      fontSize: 16,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w700,
                      color: Color.fromARGB(255, 118, 88, 68),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 10), 
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text('Sipariş Onaylandı'),
                      content: const Text(
                        'Siparişiniz başarıyla onaylandı. Teşekkür ederiz!',
                      ),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop(); 
                          },
                          child: const Text('Tamam'),
                        ),
                      ],
                    );
                  },
                );
              },
              child: Container(
                width: double.infinity,
                height: 56.71,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 79, 52, 35),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: const Center(
                  child: Text(
                    'Onayla',
                    style: TextStyle(
                      color: Color(0xFFF6EDED),
                      fontSize: 20,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget buttonBox(
    String text,
    Color bgColor,
    Color textColor,
    VoidCallback onPressed,
  ) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 126.07,
        height: 34,
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.black12),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: textColor,
              fontSize: 14,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
    );
  }

  Widget iconButton(String sign, VoidCallback onPressed) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 163, 124, 98),
          shape: BoxShape.circle,
        ),
        child: Center(
          child: Text(
            sign,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ),
      ),
    );
  }
}
