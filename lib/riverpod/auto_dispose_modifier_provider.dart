import 'package:flutter_riverpod/flutter_riverpod.dart';

// 필요없을때 삭제를 하고 필요할 때 다시 생성
final autoDisposeModifierProvider = FutureProvider.autoDispose<List<int>>((ref) async {
  await Future.delayed(Duration(seconds: 2));

  return [1,2,3,4,5];
});