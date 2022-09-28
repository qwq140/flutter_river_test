import 'package:flutter_river_test/model/shopping_item_model.dart';
import 'package:flutter_river_test/riverpod/state_notifier_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// 여러개의 provider를 함께 사용
final filteredShoppingListProvider = Provider<List<ShoppingItemModel>>(
  (ref) {
    // filterProvider 상태가 변화할 때 빌드
    final filterState = ref.watch(filterProvider);
    // shoppingListProvider 상태가 변화할 때 빌드
    final shoppingListState = ref.watch(shoppingListProvider);

    if(filterState == FilterState.all){
      return shoppingListState;
    }

    return shoppingListState.where((e) => filterState == FilterState.spicy ? e.isSpicy : !e.isSpicy).toList();
  },
);

enum FilterState {
  notSpicy,
  spicy,
  all,
}

final filterProvider = StateProvider<FilterState>((ref) => FilterState.all);