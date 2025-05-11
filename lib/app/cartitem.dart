class CartItem {
  final String name;
  final String price;
  final String imagePath;
  final String size; 
  int count = 1;

  CartItem({
    required this.name,
    required this.price,
    required this.imagePath,
    required this.size,
    this.count = 1,
  });
}
