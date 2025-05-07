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
                      left: 25,
                      top: 347,
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
                      left: 21,
                      top: 371,
                      child: Row(
                        children: const [
                          Icon(Icons.star,
                              color: Color.fromARGB(255, 246, 215, 15),
                              size: 20),
                          SizedBox(width: 4),
                          Text("4.5", style: TextStyle(color: Colors.black)),
                        ],
                      ),
                    ),
                    Positioned(
                      left: 35,
                      top: 440,
                      child: SizedBox(
                        width: 300,
                        child: Text(
                          widget.description,
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
                      top: 765,
                      child: Text(
                        'Price\n${widget.price} TL',
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 14,
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
                          CartData.addItem(CartItem(
                            name: widget.title,
                            price: widget.price,
                            imagePath: widget.imageUrl,
                            size: _selectedSize,
                          ));

                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                  '${widget.title} ($_selectedSize) sepete eklendi.'),
                            ),
                          );
                        },
                        child: const Text(
                          'Buy Now',
                          style: TextStyle(
                            color: Color(0xFFA47F4B),
                            fontSize: 20,
                          ),
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