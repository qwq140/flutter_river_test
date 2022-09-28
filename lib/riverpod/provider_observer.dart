import 'package:flutter_riverpod/flutter_riverpod.dart';

class Logger extends ProviderObserver {

  // scope 내부의 provider가 업데이트 되었을 때 호출
  // providr : 업데이트 된 provider
  // previousValue : 이전값
  // newValue : 업데이트된 값
  @override
  void didUpdateProvider(ProviderBase provider, Object? previousValue, Object? newValue, ProviderContainer container) {
    print('[Provider Updated] provider: $provider / pv : $previousValue / nv : $newValue');
  }

  // provider가 추가될 때 호출
  @override
  void didAddProvider(ProviderBase provider, Object? value, ProviderContainer container) {
    print('[Provider Added] provider: $provider / value : $value');
  }

  // provider가 삭제될 때 호출
  @override
  void didDisposeProvider(ProviderBase provider, ProviderContainer containers) {
    print('[Provider disposed] provider: $provider');
  }
}