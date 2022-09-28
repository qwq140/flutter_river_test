import 'package:flutter_river_test/model/shopping_item_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final shoppingListProvider =
    StateNotifierProvider<ShoppingListNotifier, List<ShoppingItemModel>>(
  (ref) => ShoppingListNotifier(),
);

// 무조건 StateNotifier를 상속받아야함
class ShoppingListNotifier extends StateNotifier<List<ShoppingItemModel>> {
  // 초기값
  ShoppingListNotifier()
      : super([
          ShoppingItemModel(
              name: '김치', quantity: 3, hasBought: false, isSpicy: true),
          ShoppingItemModel(
              name: '라면', quantity: 5, hasBought: false, isSpicy: true),
          ShoppingItemModel(
              name: '삼겹살', quantity: 10, hasBought: false, isSpicy: false),
          ShoppingItemModel(
              name: '수박', quantity: 3, hasBought: false, isSpicy: false),
          ShoppingItemModel(
              name: '카스테라', quantity: 3, hasBought: false, isSpicy: false),
        ]);

  void toggleHasBought({required String name}) {
    state = state
        .map((e) => e.name == name
            ? ShoppingItemModel(
                name: e.name,
                quantity: e.quantity,
                hasBought: !e.hasBought,
                isSpicy: e.isSpicy)
            : e)
        .toList();
  }
}
