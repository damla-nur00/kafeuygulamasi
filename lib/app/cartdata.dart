//cartdata.dart
import 'cartitem.dart';

class CartData {
  static List<CartItem> items = [];

  static void addItem(CartItem item) {
    final existingItemIndex = items.indexWhere((i) =>
        i.name == item.name && i.size == item.size); // Boyutla eşleşenleri kontrol et
    if (existingItemIndex != -1) {
      items[existingItemIndex].count++;
    } else {
      items.add(item);
    }
  }
}