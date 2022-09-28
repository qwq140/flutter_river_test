import 'package:flutter_riverpod/flutter_riverpod.dart';

// 관리하는 값을 반환, 제네릭은 관리할 값의 타입
final numberProvider = StateProvider<int>((ref) => 0);