import 'package:flutter/material.dart';
import 'cartitem.dart';
import 'cartdata.dart'; 

class MenuIcerikSf extends StatefulWidget {
  final String title;
  final String description;
  final String price;
  final String imageUrl;

  const MenuIcerikSf({
    super.key,
    required this.title,
    required this.description,
    required this.price,
    required this.imageUrl,
  });

  @override
  State<MenuIcerikSf> createState() => _MenuIcerikSfState();
}

class _MenuIcerikSfState extends State<MenuIcerikSf> {
  String _selectedSize = 'Küçük'; // Tek boyut sabitlendi
  String _coffeeDescription = 'Delicious coffee'; 

  double updatedPrice = 0; // Güncellenmiş fiyatı tutmak için değişken

  Map<String, String> priceDetails = {
    'Iced Americano': '90',
    'Iced Cappuccino': '90',
    'Iced Latte': '80',
    'Iced Mocha': '80',
    'Iced Macchiato': '90',
    'Espresso Frappe': '90',
    'Americano': '80',
    'Cappuccino': '90',
    'Latte': '90',
    'White Chocolate Mocha': '100',
    'Caramel Macchiato': '100',
    'Türk Kahvesi': '80',
    'Earl Grey': '90',
    'Chai Tea': '80',
    'Çay': '70',
    'Yasemin Çayı': '80',
    'Papatya Çayı': '80',
    'Yeşil Çay': '80',
    'Limonlu Soğuk Çay': '80',
    'Şeftalili Soğuk Çay': '80',
    'Yaseminli Soğuk Çay': '90',
    'Yeşil Soğuk Çay': '90',
    'Berry Mix Soğuk Çay': '100',
    'Matcha Soğuk Çay': '100',
  };

  Map<String, String> descriptionDetails = {
    'Iced Americano':'Soğuk suyla karıştırılmış güçlü espresso, ferahlatıcı ve yoğun bir tat sunar.',
    'Iced Cappuccino':'Soğuk süt, köpük ve espresso ile hazırlanan kremamsı ve hafif acı bir içecek.',
    'Iced Latte':'Soğuk süt ve espresso karışımı, hafif ve yumuşak bir kahve deneyimi sunar.',
    'Iced Mocha':'Çikolata şurubu ve espresso karışımı, tatlı ve kahve severler için mükemmel bir içecek.',
    'Iced Macchiato':'Soğuk süt ve espresso ile yapılan yoğun kahve tadı ve hafif süt aromasıyla serinletici bir içecek.',
    'Espresso Frappe':'Buzlu, kremalı espresso karışımı, enerjik ve ferahlatıcı bir yaz içeceğidir.',
    'Americano':'Yoğun espresso üzerine sıcak su eklenerek hazırlanır, sade ve sert içimlidir.',
    'Cappuccino':'Espresso, sıcak süt ve bol süt köpüğüyle yapılan klasik bir İtalyan kahvesidir.',
    'Latte':'Espressoya bol süt eklenerek yumuşatılmış, hafif içimli bir kahvedir.',
    'White Chocolate Mocha':'Beyaz çikolata sosu, süt ve espresso ile hazırlanan tatlı ve kremamsı bir içecektir.',
    'Caramel Macchiato':'Vanilyalı süt ve espresso karışımı üzerine karamel sos gezdirilerek sunulur.',
    'Türk Kahvesi':'İnce çekilmiş kahveyle yapılan, bol köpüklü ve yoğun aromalı geleneksel bir kahvedir.',
    'Earl Grey':'Bergamot aromalı siyah çay, klasik ve ferahlatıcı bir tada sahiptir.',
    'Chai Tea':'Tarçın, karanfil ve zencefil gibi baharatlarla demlenen güçlü aromalı siyah çay.',
    'Çay':'Özenle seçilmiş yaprak ve bitkilerle demlenerek günün her anına eşlik eden doğal ve dinlendirici bir içecek deneyimi sunar.',
    'Yasemin Çayı':'Yasemin çiçekleriyle aromalandırılmış hafif ve floral yeşil çay.',
    'Papatya Çayı':'Rahatlatıcı ve yumuşak içimli, uyku öncesi tercih edilen bitki çayı.',
    'Yeşil Çay':'Hafif içimli, antioksidan açısından zengin sağlıklı bir çay.',
    'Limonlu Soğuk Çay':'Ferahlatıcı limon aromasıyla sıcak günlerde serinlik sunan klasik bir tercih.',
    'Şeftalili Soğuk Çay':'Doğal şeftali aromasıyla yumuşak ve tatlı içimli serinletici bir çay.',
    'Yaseminli Soğuk Çay':'Yasemin çiçeklerinin hoş kokusuyla harmanlanmış hafif ve aromatik bir içecek.',
    'Yeşil Soğuk Çay':'Antioksidan dolu yeşil çay, hafif aromasıyla sağlıklı bir serinlik sağlar.',
    'Berry Mix Soğuk Çay':'Orman meyvelerinin tatlı ve ekşi dengesiyle canlandırıcı bir deneyim sunar.',
    'Matcha Soğuk Çay':'Japon yeşil çayı matcha ile hazırlanan enerjik ve modern bir soğuk içecek.',
  };

  @override
  void initState() {
    super.initState();
    // Gelen title üzerinden açıklama ve fiyat belirleniyor
    _coffeeDescription = descriptionDetails[widget.title] ?? _coffeeDescription;
    updatedPrice = double.parse(
      priceDetails[widget.title]!,
    ); 
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
                    Positioned(
                      left: 22,
                      top: 447, 
                      child: Container(
                        width: 350,
                        height: 2,
                        color: Colors.grey, 
                      ),
                    ),
                    Positioned(
                      left: 35,
                      top: 520,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Boy Seçimi',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Row(
                            children:
                                ['Küçük', 'Orta', 'Büyük'].map((size) {
                                  final bool isSelected = _selectedSize == size;
                                  return GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        _selectedSize = size;
                                        if (size == 'Orta') {
                                          updatedPrice =
                                              double.parse(
                                                priceDetails[widget.title]!,
                                              ) +
                                              10; // Orta seçildiğinde 10 TL ekle
                                        } else if (size == 'Büyük') {
                                          updatedPrice =
                                              double.parse(
                                                priceDetails[widget.title]!,
                                              ) +
                                              20; // Büyük seçildiğinde 20 TL ekle
                                        } else {
                                          updatedPrice = double.parse(
                                            priceDetails[widget.title]!,
                                          ); // Küçük seçildiğinde fiyat değişmez
                                        }
                                      });
                                    },
                                    child: Container(
                                      margin: const EdgeInsets.only(right: 10),
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 16,
                                        vertical: 10,
                                      ),
                                      decoration: BoxDecoration(
                                        color:
                                            isSelected
                                                ? const Color.fromARGB(
                                                  255,
                                                  224,
                                                  188,
                                                  189,
                                                )
                                                : Colors.grey[300],
                                        borderRadius: BorderRadius.circular(18),
                                      ),
                                      child: Column(
                                        children: [
                                          Text(
                                            size,
                                            style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.black87,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                          if (size == 'Orta')
                                            Text(
                                              '+10 TL',
                                              style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.grey,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          if (size == 'Büyük')
                                            Text(
                                              '+20 TL',
                                              style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.grey,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                        ],
                                      ),
                                    ),
                                  );
                                }).toList(),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      left: 62,
                      top: 750,
                      child: Text(
                        '\n${updatedPrice.toStringAsFixed(2)} TL', // Güncellenmiş fiyatı göster
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
                              price:
                                  updatedPrice
                                      .toString(), 
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
