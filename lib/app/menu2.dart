// menu_icerik_sf.dart
import 'package:flutter/material.dart';
import 'cartitem.dart';
import 'cartdata.dart'; // CartData'yi dahil et

class MenuIcerik2Sf extends StatefulWidget {
  final String title;
  final String description;
  final String price;
  final String imageUrl;

  const MenuIcerik2Sf({
    super.key,
    required this.title,
    required this.description,
    required this.price,
    required this.imageUrl,
  });

  @override
  State<MenuIcerik2Sf> createState() => _MenuIcerikSfState();
}

class _MenuIcerikSfState extends State<MenuIcerik2Sf> {
  final String _selectedSize = 'Standart'; // Tek boyut sabitlendi
  String _coffeeDescription = 'Delicious coffee'; // Default description
  double updatedPrice = 0;

  Map<String, String> priceDetails = {
    'Soğuk Sandviç': '90',
    'Kumru': '90',
    '3 Peynirli Bagel': '80',
    'Chesscake': '80',
    'Supangle': '90',
    'Brownie': '90',
  };

  Map<String, String> descriptionDetails = {
    'Soğuk Sandviç':
        'Soğuk suyla karıştırılmış güçlü espresso, ferahlatıcı ve yoğun bir tat sunar.',
    'Kumru':
        'Soğuk süt, köpük ve espresso ile hazırlanan kremamsı ve hafif acı bir içecek.',
    '3 Peynirli Bagel':
        'Soğuk süt ve espresso karışımı, hafif ve yumuşak bir kahve deneyimi sunar.',
    'Chesscake':
        'Çikolata şurubu ve espresso karışımı, tatlı ve kahve severler için mükemmel bir içecek.',
    'Supangle':
        'Soğuk süt ve espresso ile yapılan yoğun kahve tadı ve hafif süt aromasıyla serinletici bir içecek.',
    'Brownie':
        'Buzlu, kremalı espresso karışımı, enerjik ve ferahlatıcı bir yaz içeceğidir.',
  };

  @override
  void initState() {
    super.initState();
    // Gelen title üzerinden açıklama ve fiyat belirleniyor
    _coffeeDescription = descriptionDetails[widget.title] ?? _coffeeDescription;
    updatedPrice = double.tryParse(priceDetails[widget.title] ?? '0') ?? 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 18, 32, 47),
      body: ListView(
        children: [
          Column(
            children: [
              Container(
                width: 393,
                height: 852,
                clipBehavior: Clip.antiAlias,
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
                child: Stack(
                  children: [
                    Positioned(
                      left: 26,
                      top: 51,
                      child: GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: const Icon(
                          Icons.arrow_back_ios_new,
                          color: Colors.black,
                          size: 30,
                        ),
                      ),
                    ),
                    Positioned(
                      left: 30,
                      top: 350,
                      child: SizedBox(
                        width: 200,
                        child: Text(
                          widget.title,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),

                    Positioned(
                      left: 30,
                      top: 380,
                      child: SizedBox(
                        width: 300,
                        child: Text(
                          _coffeeDescription,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 13,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 118,
                      top: 101,
                      child: Container(
                        width: 147,
                        height: 220,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(widget.imageUrl),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    ),

                    // 👇 Bu kısım tamamen kaldırıldı: Choose Size
                    // Eğer sadece görünüm olarak kalsın istersen tekrar ekleyebiliriz
                    Positioned(
                      left: 62,
                      top: 780,
                      child: Text(
                        '${updatedPrice.toStringAsFixed(2)} TL',
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Positioned(
                      left: 197,
                      top: 762,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFD9A9AA),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          minimumSize: const Size(170, 55),
                        ),
                        onPressed: () {
                          CartData.addItem(
                            CartItem(
                              name: widget.title,
                              price: updatedPrice.toStringAsFixed(2),
                              imagePath: widget.imageUrl,
                              size: _selectedSize,
                            ),
                          );

                          // SnackBar ile kullanıcıyı bilgilendir
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                '${widget.title} ($_selectedSize) sepete eklendi.',
                              ),
                            ),
                          );
                        },
                        child: const Text(
                          'Sepete Ekle',
                          style: TextStyle(color: Colors.white70, fontSize: 20),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

//menu2.dart
