//ıcetea.dart
import 'package:flutter/material.dart';
import 'icecoffee.dart';
import 'hotcoffee.dart';
import 'hottea.dart';
import 'bakery.dart';
import 'frame9.dart';
import 'menu_icerik_sf.dart';
import 'sepetim_sf.dart';
import 'GirisKaydol.dart';

class Icetea extends StatefulWidget {
  const Icetea({super.key});

  @override
  _IceteaState createState() => _IceteaState();
}

class _IceteaState extends State<Icetea> {
  TextEditingController _searchController = TextEditingController();
  List<String> _coffeeItems = [
    'Limonlu Buzlu Çay',
    'Şeftalili Buzlu Çay',
    'Yaseminli Soğuk Çay',
    'Yeşil Soğuk Çay',
    'Berry Mix Soğuk Çay',
    'Matcha Soğuk Çay',
  ];
  List<String> _filteredItems = [];
  bool _isSearchVisible = false;
  String selectedCategory = '';

  Map<String, String> priceDetails = {
    'Limonlu Buzlu Çay': '80',
    'Şeftalili Buzlu Çay': '80',
    'Yaseminli Soğuk Çay': '90',
    'Yeşil Soğuk Çay': '90',
    'Berry Mix Soğuk Çay': '100',
    'Matcha Soğuk Çay': '100',
  };

  @override
  void initState() {
    super.initState();
    _filteredItems = _coffeeItems;
  }

  void _filterSearchResults(String query) {
    setState(() {
      _filteredItems =
          _coffeeItems
              .where((item) => item.toLowerCase().contains(query.toLowerCase()))
              .toList();
    });
  }

  void _closeSearchBar() {
    setState(() {
      _isSearchVisible = false;
      _searchController.clear();
      _filterSearchResults('');
    });
  }

  void _filterByCategory(String category) {
    setState(() {
      selectedCategory = category;
      _filteredItems =
          _coffeeItems
              .where(
                (item) => item.toLowerCase().contains(category.toLowerCase()),
              )
              .toList();
    });
  }

  Map<String, String> coffeeImages = {
    'Limonlu Buzlu Çay': 'assets/images/americano.png',
    'Şeftalili Buzlu Çay': 'assets/images/cappuccino.png',
    'Yaseminli Soğuk Çay': 'assets/images/latte.png',
    'Yeşil Soğuk Çay': 'assets/images/mocha.png',
    'Berry Mix Soğuk Çay': 'assets/images/macchiato.png',
    'Matcha Soğuk Çay': 'assets/images/espresso.png',
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            Positioned.fill(
              top: 100,
              left: 65,
              right: 16,
              bottom: 0,
              child: GridView.builder(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.only(bottom: 20),
                itemCount: _filteredItems.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 30,
                  mainAxisSpacing: 40,
                  childAspectRatio: 0.7,
                ),
                itemBuilder: (context, index) {
                  return _coffeeItem(
                    title: _filteredItems[index],
                    description: '',
                    price: priceDetails[_filteredItems[index]] ?? '0',
                  );
                },
              ),
            ),
            Positioned(
              top: 60,
              bottom: 0,
              left: -5,
              child: Container(
                width: 65,
                decoration: const BoxDecoration(
                  color: Color(0xFFE16076),
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(50),
                    bottomRight: Radius.circular(50),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _rotatedCategory('Atıştırmalıklar', false),
                    const SizedBox(height: 20),
                    _rotatedCategory('Sıcak Kahveler', false),
                    const SizedBox(height: 20),
                    _rotatedCategory('Soğuk Kahveler', false),
                    const SizedBox(height: 20),
                    _rotatedCategory('Sıcak Çaylar', false),
                    const SizedBox(height: 20),
                    _rotatedCategory('Soğuk Çaylar', true),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Container(
                height: 60,
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _isSearchVisible = !_isSearchVisible;
                        });
                      },
                      child: const Icon(Icons.search, color: Colors.black),
                    ),
                    const Text(
                      'THE Coffee',
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 80,
              left: 65,
              right: 20,
              child: Visibility(
                visible: _isSearchVisible,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 2,
                        blurRadius: 5,
                      ),
                    ],
                  ),
                  child: TextField(
                    controller: _searchController,
                    onChanged: (value) => _filterSearchResults(value),
                    decoration: InputDecoration(
                      hintText: 'Arama yap...',
                      suffixIcon: IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: _closeSearchBar,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 140,
              left: 65,
              right: 16,
              child: Visibility(
                visible: _isSearchVisible && _filteredItems.isNotEmpty,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 2,
                        blurRadius: 5,
                      ),
                    ],
                  ),
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: _filteredItems.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(_filteredItems[index]),
                        onTap: () {
                          setState(() {
                            _searchController.text = _filteredItems[index];
                            _isSearchVisible = false;
                            _filterSearchResults(_filteredItems[index]);
                          });
                        },
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: const Color(0xFFAA6DC0),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white70,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Text('🕹️', style: TextStyle(fontSize: 30)),
            label: 'Joystick',
          ),

          BottomNavigationBarItem(
            icon: Text('🕹️', style: TextStyle(fontSize: 30)),
            label: 'Joystick',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.exit_to_app), // Çıkış ikonu
            label: 'Exit',
          ),
        ],
        onTap: (index) {
          if (index == 0) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Sepetimsf(),
              ), // Sepetim sayfasına yönlendir
            );
          } else if (index == 3) {
            // Çıkış yapıldığında
            // Çıkış işlemi yapılabilir, örneğin kullanıcıyı giriş sayfasına yönlendirebilirsiniz:
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => Frame9(), // Giriş sayfasına yönlendir
              ),
            );
          }
        },
      ),
    );
  }

  Widget _coffeeItem({
    required String title,
    required String description,
    required String price,
  }) {
    String imagePath = coffeeImages[title] ?? 'assets/images/default.jpg';

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder:
                (_) => MenuIcerikSf(
                  title: title,
                  description: description,
                  price: price,
                  imageUrl: imagePath,
                ),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.all(6),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Container(
                width: 100,
                height: 100,
                color: Colors.brown[200],
                child: Image.asset(imagePath, fit: BoxFit.cover),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              title,
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            if (description.isNotEmpty)
              Text(
                description,
                style: const TextStyle(color: Colors.redAccent),
              ),
            const SizedBox(height: 4),
            Text('${price} TL', style: const TextStyle(color: Colors.grey)),
          ],
        ),
      ),
    );
  }

  Widget _rotatedCategory(String label, bool isIceTea) {
    return GestureDetector(
      onTap: () {
        _filterByCategory(label);
        if (label == 'Soğuk Kahveler') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const Icecoffee()),
          );
        } else if (label == 'Sıcak Kahveler') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const Hotcoffee()),
          );
        } else if (label == 'Soğuk Çaylar') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const Icetea()),
          );
        } else if (label == 'Sıcak Çaylar') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const Hottea()),
          );
        } else if (label == 'Atıştırmalıklar') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const Bakery()),
          );
        }
      },
      child: RotatedBox(
        quarterTurns: 3,
        child: Text(
          label,
          style: TextStyle(
            color: isIceTea ? Colors.white : const Color(0xFFE2DD8C),
            fontSize: 14,
            fontFamily: 'Jaini Purva',
          ),
        ),
      ),
    );
  }
}
