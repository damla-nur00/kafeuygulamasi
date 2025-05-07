//ıcecoffee.dart
import 'package:flutter/material.dart';
import 'package:flutter_application_1/app/GirisKaydol.dart';
import 'frame9.dart';
import 'GirisKaydol.dart';

import 'hotcoffee.dart';
import 'hottea.dart';
import 'bakery.dart';
import 'icetea.dart';
import 'menu_icerik_sf.dart';

import 'sepetim_sf.dart';

class Icecoffee extends StatefulWidget {
  const Icecoffee({super.key});

  @override
  _IcecoffeeState createState() => _IcecoffeeState();
}

class _IcecoffeeState extends State<Icecoffee> {
  TextEditingController _searchController = TextEditingController();
  List<String> _coffeeItems = [
    'Iced Americano',
    'Iced Cappuccino',
    'Iced Latte',
    'Iced Mocha',
    'Iced Macchiato',
    'Espresso Frappe',
  ];
  List<String> _filteredItems = [];
  bool _isSearchVisible = false;
  String selectedCategory = '';

  Map<String, String> priceDetails = {
    'Iced Americano': '90',
    'Iced Cappuccino': '90',
    'Iced Latte': '80',
    'Iced Mocha': '80',
    'Iced Macchiato': '90',
    'Espresso Frappe': '90',
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
          _coffeeItems.where((item) {
            return item.toLowerCase().contains(category.toLowerCase());
          }).toList();
    });
  }

  Map<String, String> coffeeImages = {
    'Iced Americano': 'assets/images/americano.png',
    'Iced Cappuccino': 'assets/images/cappuccino.png',
    'Iced Latte': 'assets/images/latte.png',
    'Iced Mocha': 'assets/images/mocha.png',
    'Iced Macchiato': 'assets/images/macchiato.png',
    'Espresso Frappe': 'assets/images/espresso.png',
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
              top: 0,
              bottom: 0,
              left: 0,
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
                    _rotatedCategory('Bakery', false),
                    const SizedBox(height: 20),
                    _rotatedCategory('Hot coffees', false),
                    const SizedBox(height: 20),
                    _rotatedCategory('Ice coffees', true),
                    const SizedBox(height: 20),
                    _rotatedCategory('Hot teas', false),
                    const SizedBox(height: 20),
                    _rotatedCategory('Ice teas', false),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Container(
                height: 80,
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
              right: 16,
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
            icon: Icon(Icons.shopping_cart), // Sepet ikonu
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
                builder:
                    (context) => Frame9(), // Giriş sayfasına yönlendir
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
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(description, style: const TextStyle(color: Colors.redAccent)),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('${price} TL', style: const TextStyle(color: Colors.grey)),
                const SizedBox(width: 5),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _rotatedCategory(String label, bool isHotCoffee) {
    return GestureDetector(
      onTap: () {
        _filterByCategory(label);
        if (label == 'Ice coffees') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const Icecoffee()),
          );
        } else if (label == 'Hot coffees') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const Hotcoffee()),
          );
        } else if (label == 'Ice teas') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const Icetea()),
          );
        } else if (label == 'Hot teas') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const Hottea()),
          );
        } else if (label == 'Bakery') {
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
            color: isHotCoffee ? Colors.white : const Color(0xFFE2DD8C),
            fontSize: 14,
            fontFamily: 'Jaini Purva',
          ),
        ),
      ),
    );
  }
}
