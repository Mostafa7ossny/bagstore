import 'package:flutter/material.dart';
import 'package:learn/model/item.dart';

class Cart with ChangeNotifier {
  double _price = 0;
  List<Item> _items = [];
  void add(Item item0) {
    _items.add(item0);
    _price += item0.price;
    notifyListeners();
  }
  void remove(Item item0) {
    _items.remove(item0);
    _price -= item0.price;
    notifyListeners();
  }
    double get totalprice {
    return _price;
  }

  int get count {
    return _items.length;
  }

  List<Item> get backet {
    return _items;
  }
  
}
