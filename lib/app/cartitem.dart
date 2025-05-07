// cartitem.dart
class CartItem {
  final String name;
  final String price;
  final String imagePath;
  final String size; // Boyut ekleyelim
  int count = 1;

  CartItem({
    required this.name,
    required this.price,
    required this.imagePath,
    required this.size, // Boyut burada da gerekli
    this.count = 1,
  });
}

